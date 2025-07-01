package control;

import model.Categoria;
import model.CategoriaDAO;
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

@WebServlet("/VideogiochiServlet")
public class VideogiochiServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try (Connection conn = DataBaseConnection.getConnection()) {
            VideogiocoDAO dao = new VideogiocoDAO(conn);
            CategoriaDAO categoriaDAO = new CategoriaDAO(conn);
            
            List<Categoria> listaCategorie = categoriaDAO.getAllCategorie();
            request.setAttribute("listaCategorie", listaCategorie);

            String categoriaIdParam = request.getParameter("categoriaId");
            List<Videogioco> listaVideogiochi;

            if (categoriaIdParam != null && !categoriaIdParam.isEmpty()) {
                try {
                    int categoriaId = Integer.parseInt(categoriaIdParam);
                    listaVideogiochi = dao.getVideogiochiByCategoria(categoriaId);
                    // Passa anche l'id categoria per mantenere selezione filtro in JSP (opzionale)
                    request.setAttribute("categoriaSelezionata", categoriaId);
                } catch (NumberFormatException e) {
                    // Se il parametro non è un numero valido, carica tutti i videogiochi
                    listaVideogiochi = dao.getAllVideogiochi();
                }
            } else {
                listaVideogiochi = dao.getAllVideogiochi();
            }

            request.setAttribute("listaVideogiochi", listaVideogiochi);
            request.getRequestDispatcher("jsp/videogiochi.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Errore nel recupero dei videogiochi");
        }
    }
}