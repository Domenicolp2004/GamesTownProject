package control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

@WebServlet("/ConfermaOrdineServlet")
public class ConfermaOrdineServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null) {
            // Sessione scaduta o non valida, redirect al login
            response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
            return;
        }

        Utente utente = (Utente) session.getAttribute("utente");
        if (utente == null) {
            // Utente non loggato
            response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
            return;
        }

        Carrello carrello = (Carrello) session.getAttribute("carrello");
        if (carrello == null || carrello.getItems().isEmpty()) {
            // Carrello vuoto, redirect alla pagina carrello
            response.sendRedirect(request.getContextPath() + "/jsp/carrello.jsp");
            return;
        }

        // Prendi dati spedizione e pagamento dal form
        String indirizzoSpedizione = request.getParameter("indirizzoSpedizione");
        String metodoPagamento = request.getParameter("metodoPagamento");

        if (indirizzoSpedizione == null || indirizzoSpedizione.isEmpty() ||
            metodoPagamento == null || metodoPagamento.isEmpty()) {
            request.setAttribute("errore", "Indirizzo spedizione e metodo pagamento sono obbligatori");
            request.getRequestDispatcher("/jsp/carrello.jsp").forward(request, response);
            return;
        }

        try (Connection conn = model.DataBaseConnection.getConnection()) {
            // Crea DAO ordine
            OrdineDAO ordineDAO = new OrdineDAO(conn);

            // Crea nuovo ordine
            Ordine ordine = new Ordine();
            ordine.setIdUtente(utente.getId());
            ordine.setDataOrdine(new Date());
            ordine.setStato("In elaborazione");
            ordine.setTotale(carrello.getTotale());
            ordine.setIndirizzoSpedizione(indirizzoSpedizione);
            ordine.setMetodoPagamento(metodoPagamento);

            // Salva ordine e prendi id
            int idOrdine = ordineDAO.salvaOrdine(ordine);

            if (idOrdine > 0) {
                // Salva righe ordine
                RigaOrdineDAO rigaOrdineDAO = new RigaOrdineDAO(conn);

                for (ItemCarrello item : carrello.getItems()) {
                    RigaOrdine riga = new RigaOrdine();
                    riga.setIdOrdine(idOrdine);
                    riga.setIdProdotto(item.getVideogioco().getId());
                    riga.setQuantita(item.getQuantita());
                    riga.setPrezzoUnitario(item.getVideogioco().getPrezzo());

                    rigaOrdineDAO.salvaRigaOrdine(riga);
                }

                // Svuota carrello
                carrello.svuota();
                session.setAttribute("carrello", carrello);

                // Redirect a pagina conferma ordine o lista ordini
                session.setAttribute("confermaSuccesso", "Ordine confermato con successo!");
                response.sendRedirect(request.getContextPath() + "/ListaOrdiniServlet");
            } else {
                request.setAttribute("errore", "Errore nel salvataggio dell'ordine");
                request.getRequestDispatcher("/jsp/carrello.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(500, "Errore interno del server");
        }
    }
}

