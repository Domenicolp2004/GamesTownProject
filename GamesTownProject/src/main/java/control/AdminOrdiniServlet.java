package control;

import model.DataBaseConnection;
import model.Ordine;
import model.OrdineDAO;
import model.Utente;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/AdminOrdiniServlet")
public class AdminOrdiniServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Utente utente = (session != null) ? (Utente) session.getAttribute("utente") : null;
        if (utente == null || !"admin".equalsIgnoreCase(utente.getRuolo())) {
            response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
            return;
        }

        String clienteFiltro = request.getParameter("clienteFiltro");
        String dataInizio = request.getParameter("dataInizio");
        String dataFine = request.getParameter("dataFine");

        try (Connection conn = DataBaseConnection.getConnection()) {
            OrdineDAO ordineDAO = new OrdineDAO(conn);
            List<Ordine> listaOrdini = ordineDAO.getOrdiniFiltrati(clienteFiltro, dataInizio, dataFine);

            request.setAttribute("listaOrdini", listaOrdini);
            request.getRequestDispatcher("/jsp/admin/gestioneOrdini.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Errore del server");
        }
    }

    // Potresti aggiungere doPost se vuoi modificare stati ordini ecc.
}
