package control;

import org.mindrot.jbcrypt.BCrypt;
import model.DataBaseConnection;
import model.Utente;
import model.UtenteDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.UUID;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection conn = DataBaseConnection.getConnection()) {
            UtenteDAO dao = new UtenteDAO(conn);
            Utente utente = dao.doRetrieveByEmail(email);

            if (utente != null && BCrypt.checkpw(password, utente.getPassword())) {
            	HttpSession oldSession = request.getSession(false);
            	if (oldSession != null) {
            	    oldSession.invalidate(); // Invalida eventuale sessione precedente
            	}
            	HttpSession session = request.getSession(true);
                session.setAttribute("utente", utente);

                // Genera un token unico per la sessione
                String token = UUID.randomUUID().toString();
                session.setAttribute("token", token); 

                // Redirect senza passare il token in URL
                if ("admin".equalsIgnoreCase(utente.getRuolo())) {
                    response.sendRedirect(request.getContextPath() + "/jsp/admin/adminHome.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/HomeServlet");
                }
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
