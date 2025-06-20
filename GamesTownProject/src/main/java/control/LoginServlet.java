package control;

import model.DataBaseConnection;
import model.Utente;
import model.UtenteDAO;
import control.HomeServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection conn = DataBaseConnection.getConnection()) {
            UtenteDAO dao = new UtenteDAO(conn);
            Utente utente = dao.loginUtente(email, password);

            if (utente != null) {
                request.getSession().setAttribute("utente", utente);
                response.sendRedirect(request.getContextPath() + "/HomeServlet");
            } else {
                request.setAttribute("errore", "Email o password errati");
                request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Errore del server");
        }
    }
}
