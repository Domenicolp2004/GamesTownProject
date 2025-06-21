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

@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Connection conn = DataBaseConnection.getConnection()) {
            VideogiocoDAO dao = new VideogiocoDAO(conn);
            List<Videogioco> top5 = dao.getPrimiCinqueGiochi();
            List<Videogioco> cheap5 = dao.getEconomici();
            

            request.setAttribute("eco", cheap5);
            request.setAttribute("giochi", top5);
            
            request.getRequestDispatcher("/jsp/home.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error");
        }
    }
}

