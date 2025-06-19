package control;

import model.DataBaseConnection;
import model.Utente;
import model.UtenteDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/RegistrazioneServlet")
public class RegistrazioneServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String ruolo = "utente"; 

        Utente utente = new Utente();
        utente.setNome(nome);
        utente.setCognome(cognome);
        utente.setEmail(email);
        utente.setPassword(password);
        utente.setRuolo(ruolo);

        try (Connection conn = DataBaseConnection.getConnection()) {
            UtenteDAO dao = new UtenteDAO(conn);

    
            boolean esiste = dao.esisteEmail(email);
            if (esiste) {
                request.setAttribute("errore", "Email già registrata");
                request.getRequestDispatcher("jsp/registrazione.jsp").forward(request, response);
                return;
            }

            boolean registrato = dao.registraUtente(utente);

            if (registrato) {
                request.setAttribute("successo", "Registrazione avvenuta con successo, puoi effettuare il login.");
                request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
            } else {
                request.setAttribute("errore", "Errore nella registrazione, riprova.");
                request.getRequestDispatcher("jsp/registrazione.jsp").forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Errore del server");
        }
    }
}