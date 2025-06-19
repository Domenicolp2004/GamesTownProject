package control;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import model.Carrello;
import model.Videogioco;
import model.ItemCarrello;

@WebServlet("/AggiornaQuantitaServlet")
public class AggiornaQuantitaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Carrello carrello = (Carrello) session.getAttribute("carrello");

        if (carrello != null) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                int quantita = Integer.parseInt(request.getParameter("quantita"));

                if (quantita < 1) quantita = 1;
                

           
                carrello.aggiornaQuantita(id, quantita);

         
                session.setAttribute("carrello", carrello);
            } catch (NumberFormatException e) {
              
                e.printStackTrace();
            }
        }



        response.sendRedirect(request.getContextPath() + "/jsp/carrello.jsp");
    }
}