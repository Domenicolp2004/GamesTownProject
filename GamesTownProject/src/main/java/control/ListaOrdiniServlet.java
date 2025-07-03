package control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.DataBaseConnection;
import model.Ordine;
import model.OrdineDAO;
import model.Utente;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/ListaOrdiniServlet")
public class ListaOrdiniServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1) Controllo esistenza della sessione
        HttpSession session = request.getSession(false);
        if (session == null) {
            // Nessuna sessione: reindirizza alla home o login
            response.sendRedirect(request.getContextPath() + "/HomeServlet");
            return;
        }

        // 2) Controllo utente loggato
        Utente utente = (Utente) session.getAttribute("utente");
        if (utente == null) {
            // Utente non loggato: non può vedere la lista ordini
            response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
            return;
        }

        // 3) Recupera e mostra gli ordini per l'utente
        try (Connection conn = DataBaseConnection.getConnection()) {
            OrdineDAO ordineDAO = new OrdineDAO(conn);
            List<Ordine> listaOrdini = ordineDAO.getOrdiniByUtente(utente.getId());

            request.setAttribute("listaOrdini", listaOrdini);
            request.getRequestDispatcher("/jsp/ordini.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(500, "Errore interno del server");
        }
    }
}
