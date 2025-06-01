import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RegistrazioneServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Utente nuovoUtente = new Utente(nome, cognome, email, password);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://127.0.0.1:3306/gamestown", "root", "KAknkcniwo92--!");

            UtenteDAO dao = new UtenteDAO(conn);
            boolean success = dao.registraUtente(nuovoUtente);

            if (success) {
                response.sendRedirect("login.jsp");
            } else {
                request.setAttribute("errore", "Registrazione fallita");
                request.getRequestDispatcher("registrazione.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errore", "Errore server: " + e.getMessage());
            request.getRequestDispatcher("registrazione.jsp").forward(request, response);
        }
    }
}