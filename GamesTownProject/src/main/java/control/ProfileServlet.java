package control;

import org.mindrot.jbcrypt.BCrypt;
import model.Utente;
import model.UtenteDAO;
import model.DataBaseConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.UUID;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("utente") == null) {
            response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
            return;
        }

        Utente utente = (Utente) session.getAttribute("utente");

        // Per sicurezza, ricarichiamo dati da DB
        try (Connection conn = DataBaseConnection.getConnection()) {
            UtenteDAO dao = new UtenteDAO(conn);
            Utente freshUtente = dao.doRetrieveByEmail(utente.getEmail());
            request.setAttribute("utente", freshUtente);
            request.getRequestDispatcher("/jsp/profile.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Errore server");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if(session == null || session.getAttribute("utente") == null) {
            response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
            return;
        }

        Utente utente = (Utente) session.getAttribute("utente");

        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validazione base (aggiungi più controlli se vuoi)
        if(nome == null || nome.isEmpty() || email == null || email.isEmpty()) {
            request.setAttribute("error", "Nome e email sono obbligatori");
            request.getRequestDispatcher("/jsp/profile.jsp").forward(request, response);
            return;
        }

        // Aggiorna dati utente
        utente.setNome(nome);
        utente.setCognome(cognome);
        utente.setEmail(email);

        // Password: se non vuota, re-hash
        if(password != null && !password.isEmpty()) {
            String hashed = BCrypt.hashpw(password, BCrypt.gensalt(12));
            utente.setPassword(hashed);
        }

        try (Connection conn = DataBaseConnection.getConnection()) {
            UtenteDAO dao = new UtenteDAO(conn);
            boolean updated = dao.updateUtente(utente);

            if(updated) {
                session.setAttribute("utente", utente);
                request.setAttribute("success", "Profilo aggiornato con successo");
            } else {
                request.setAttribute("error", "Errore durante l'aggiornamento");
            }
            request.setAttribute("utente", utente);
            request.getRequestDispatcher("/jsp/profile.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Errore server");
        }
    }
}
