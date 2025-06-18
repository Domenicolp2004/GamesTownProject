package control;

import model.DataBaseConnection;
import model.Carrello;
import model.Videogioco;
import model.VideogiocoDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/AddCarrelloServlet")
public class AddCarrelloServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        try (Connection conn = DataBaseConnection.getConnection()) {
            VideogiocoDAO dao = new VideogiocoDAO(conn);
            Videogioco videogioco = dao.getVideogiocoById(id);

            HttpSession session = request.getSession();
            Carrello carrello = (Carrello) session.getAttribute("carrello");
            if (carrello == null) {
                carrello = new Carrello();
                session.setAttribute("carrello", carrello);
            }

            carrello.aggiungi(videogioco);
            response.sendRedirect("jsp/carrello.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(500, "Errore nel recupero del videogioco");
        }
    }
}