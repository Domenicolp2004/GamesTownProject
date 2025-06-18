package control;

import model.DataBaseConnection;
import model.VideogiocoDAO;
import model.Videogioco;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/VideogiochiServlet")
public class VideogiochiServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try (Connection conn = DataBaseConnection.getConnection()) {
            VideogiocoDAO dao = new VideogiocoDAO(conn);
            List<Videogioco> listaVideogiochi = dao.getAllVideogiochi();

            request.setAttribute("listaVideogiochi", listaVideogiochi);
            request.getRequestDispatcher("jsp/videogiochi.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Errore nel recupero dei videogiochi");
        }
    }
}