package control;

import model.DataBaseConnection;
import model.UtenteDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/CheckEmailServlet")
public class CheckEmailServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        boolean exists = false;

        try (Connection conn = DataBaseConnection.getConnection()) {
            UtenteDAO dao = new UtenteDAO(conn);
            exists = dao.esisteEmail(email);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.setContentType("application/json");
        response.getWriter().write("{\"exists\":" + exists + "}");
    }
}
