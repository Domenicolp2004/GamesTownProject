package control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/DettaglioOrdineServlet")
public class DettaglioOrdineServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("utente") == null) {
            response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
            return;
        }

        Utente utente = (Utente) session.getAttribute("utente");

        String idOrdineStr = request.getParameter("id");
        if (idOrdineStr == null) {
            response.sendRedirect(request.getContextPath() + "/ListaOrdiniServlet");
            return;
        }

        int idOrdine;
        try {
            idOrdine = Integer.parseInt(idOrdineStr);
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/ListaOrdiniServlet");
            return;
        }

        try (Connection conn = model.DataBaseConnection.getConnection()) {
            OrdineDAO ordineDAO = new OrdineDAO(conn);
            RigaOrdineDAO rigaDAO = new RigaOrdineDAO(conn);

            Ordine ordine = ordineDAO.getOrdineById(idOrdine);

            if (ordine == null || ordine.getIdUtente() != utente.getId()) {
                response.sendError(HttpServletResponse.SC_FORBIDDEN, "Accesso negato");
                return;
            }

            List<RigaOrdine> righeOrdine = rigaDAO.getRighePerOrdine(idOrdine);

            request.setAttribute("ordine", ordine);
            request.setAttribute("righeOrdine", righeOrdine);
            request.getRequestDispatcher("/jsp/dettaglioOrdine.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(500, "Errore nel recupero dettagli ordine");
        }
    }
}
