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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Utente utente = (Utente) session.getAttribute("utente");

        try (Connection conn = DataBaseConnection.getConnection()) {
            OrdineDAO ordineDAO = new OrdineDAO(conn);
            List<Ordine> listaOrdini = ordineDAO.getOrdiniByUtente(utente.getId());

            request.setAttribute("listaOrdini", listaOrdini);
            request.getRequestDispatcher("/jsp/ordini.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(500, "Errore interno");
        }
    }
}
