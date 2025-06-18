package control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

import model.DataBaseConnection;
import model.Carrello;
import model.Videogioco;
import model.VideogiocoDAO;

@WebServlet("/RemoveCarrelloServlet")
public class RemoveCarrelloServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        HttpSession session = request.getSession();
        Carrello carrello = (Carrello) session.getAttribute("carrello");

        if (carrello != null) {
            carrello.rimuovi(id);
        }

        response.sendRedirect("jsp/carrello.jsp");
    }
}