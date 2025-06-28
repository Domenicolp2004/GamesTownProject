package control;

import model.DataBaseConnection;
import model.Videogioco;
import model.VideogiocoDAO;
import model.Utente;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/AdminCatalogoServlet")
public class AdminCatalogoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Utente utente = (session != null) ? (Utente) session.getAttribute("utente") : null;

        if (utente == null || !"admin".equalsIgnoreCase(utente.getRuolo())) {
            response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
            return;
        }

        try (Connection conn = DataBaseConnection.getConnection()) {
            VideogiocoDAO dao = new VideogiocoDAO(conn);
            List<Videogioco> lista = dao.getAllVideogiochi();
            request.setAttribute("listaGiochi", lista);
            request.getRequestDispatcher("/jsp/admin/gestioneProdotti.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Errore del server");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null) {
            response.sendRedirect(request.getContextPath() + "/jsp/login.jsp?accessDenied=true");
            return;
        }

        Utente utente = (Utente) session.getAttribute("utente");
        if (utente == null || !"admin".equalsIgnoreCase(utente.getRuolo())) {
            response.sendRedirect(request.getContextPath() + "/jsp/login.jsp?accessDenied=true");
            return;
        }

        // Controllo CSRF token
        String sessionToken = (String) session.getAttribute("token");
        String requestToken = request.getParameter("token");
        if (sessionToken == null || !sessionToken.equals(requestToken)) {
            response.sendRedirect(request.getContextPath() + "/jsp/login.jsp?accessDenied=true");
            return;
        }

        String action = request.getParameter("action");

        try (Connection conn = DataBaseConnection.getConnection()) {
            VideogiocoDAO dao = new VideogiocoDAO(conn);

            if ("insert".equals(action)) {
                Videogioco v = new Videogioco();
                v.setTitolo(request.getParameter("titolo"));
                v.setDescrizione(request.getParameter("descrizione"));
                v.setPrezzo(Double.parseDouble(request.getParameter("prezzo")));
                v.setDataUscita(request.getParameter("dataUscita"));
                v.setGenere(request.getParameter("genere"));
                v.setPiattaforma(request.getParameter("piattaforma"));
                v.setImmagine(request.getParameter("immagine"));
                v.setAttivo(true);
                dao.insertVideogioco(v);

            } else if ("update".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                Videogioco v = dao.getVideogiocoByIdPerUpdate(id);
                if (v != null) {
                    v.setTitolo(request.getParameter("titolo"));
                    v.setDescrizione(request.getParameter("descrizione"));
                    v.setPrezzo(Double.parseDouble(request.getParameter("prezzo")));
                    v.setDataUscita(request.getParameter("dataUscita"));
                    v.setGenere(request.getParameter("genere"));
                    v.setPiattaforma(request.getParameter("piattaforma"));
                    v.setImmagine(request.getParameter("immagine"));
                    dao.updateVideogioco(v);
                }

            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                dao.disableVideogioco(id);
            }

            response.sendRedirect(request.getContextPath() + "/AdminCatalogoServlet");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Errore del server");
        }
    }
}
