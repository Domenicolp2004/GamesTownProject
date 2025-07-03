package control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Carrello;
import model.DataBaseConnection;
import model.ItemCarrello;
import model.Ordine;
import model.OrdineDAO;
import model.RigaOrdine;
import model.RigaOrdineDAO;
import model.Utente;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

@WebServlet("/ConfermaOrdineServlet")
public class ConfermaOrdineServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/HomeServlet");
            return;
        }

        Utente utente = (Utente) session.getAttribute("utente");
        String nome, cognome, email;

        if (utente != null) {
            nome = utente.getNome();
            cognome = utente.getCognome();
            email = utente.getEmail();
        } else {
            nome = request.getParameter("nome");
            cognome = request.getParameter("cognome");
            email = request.getParameter("email");
            if (nome == null || cognome == null || email == null || nome.isEmpty() || cognome.isEmpty() || email.isEmpty()) {
                request.setAttribute("errore", "Tutti i campi sono obbligatori.");
                request.getRequestDispatcher("/jsp/carrello.jsp").forward(request, response);
                return;
            }
        }

        Carrello carrello = (Carrello) session.getAttribute("carrello");
        if (carrello == null || carrello.getItems().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/jsp/carrello.jsp");
            return;
        }

        String indirizzoSpedizione = request.getParameter("indirizzoSpedizione");
        String metodoPagamento = request.getParameter("metodoPagamento");
        if (indirizzoSpedizione == null || indirizzoSpedizione.isEmpty() || metodoPagamento == null || metodoPagamento.isEmpty()) {
            request.setAttribute("errore", "Indirizzo spedizione e metodo pagamento sono obbligatori");
            request.getRequestDispatcher("/jsp/carrello.jsp").forward(request, response);
            return;
        }

        try (Connection conn = DataBaseConnection.getConnection()) {
            OrdineDAO ordineDAO = new OrdineDAO(conn);
            Ordine ordine = new Ordine();
            if (utente != null) {
                ordine.setIdUtente(utente.getId());
            } else {
                ordine.setIdUtente(null);
            }
            ordine.setNomeCliente(nome);
            ordine.setCognomeCliente(cognome);
            ordine.setEmailCliente(email);
            ordine.setDataOrdine(new Date());
            ordine.setStato("In elaborazione");
            ordine.setTotale(carrello.getTotale());
            ordine.setIndirizzoSpedizione(indirizzoSpedizione);
            ordine.setMetodoPagamento(metodoPagamento);

            int idOrdine = ordineDAO.salvaOrdine(ordine);
            if (idOrdine > 0) {
                RigaOrdineDAO rigaOrdineDAO = new RigaOrdineDAO(conn);
                for (ItemCarrello item : carrello.getItems()) {
                    RigaOrdine riga = new RigaOrdine();
                    riga.setIdOrdine(idOrdine);
                    riga.setIdProdotto(item.getVideogioco().getId());
                    riga.setQuantita(item.getQuantita());
                    riga.setPrezzoUnitario(item.getVideogioco().getPrezzo());
                    rigaOrdineDAO.salvaRigaOrdine(riga);
                }
                carrello.svuota();
                session.setAttribute("carrello", carrello);
                if (utente != null) {
                    session.setAttribute("confermaSuccesso", "Ordine confermato con successo!");
                    response.sendRedirect(request.getContextPath() + "/ListaOrdiniServlet");
                } else {
                    request.setAttribute("ordineId", idOrdine);
                    request.setAttribute("emailCliente", email);
                    request.getRequestDispatcher("/jsp/ConfermaGuest.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("errore", "Errore nel salvataggio dell'ordine");
                request.getRequestDispatcher("/jsp/carrello.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(500, "Errore interno del server: " + e.getMessage());
        }
    }
}
