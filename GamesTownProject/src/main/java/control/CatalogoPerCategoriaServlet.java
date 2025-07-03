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

@WebServlet("/CatalogoPerCategoriaServlet")
public class CatalogoPerCategoriaServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try (Connection conn = DataBaseConnection.getConnection()) {
            VideogiocoDAO videogiocoDAO = new VideogiocoDAO(conn);
            CategoriaDAO categoriaDAO = new CategoriaDAO(conn);

            // Carica tutte le categorie per il filtro
            List<Categoria> listaCategorie = categoriaDAO.getAllCategorie();
            request.setAttribute("listaCategorie", listaCategorie);

            // Leggi parametro categoriaId dalla richiesta
            String categoriaIdParam = request.getParameter("categoriaId");
            List<Videogioco> listaVideogiochi;

            if (categoriaIdParam != null && !categoriaIdParam.isEmpty()) {
                try {
                    int categoriaId = Integer.parseInt(categoriaIdParam);
                    // Recupera videogiochi filtrati per categoria
                    listaVideogiochi = videogiocoDAO.getVideogiochiByCategoria(categoriaId);
                    // Imposta l'id della categoria selezionata per mantenere il filtro nella JSP
                    request.setAttribute("categoriaSelezionata", categoriaId);
                } catch (NumberFormatException e) {
                    // Se categoriaId non valido, mostra tutti i videogiochi
                    listaVideogiochi = videogiocoDAO.getAllVideogiochi();
                }
            } else {
                // Nessun filtro categoria: mostra tutti i videogiochi attivi
                listaVideogiochi = videogiocoDAO.getAllVideogiochi();
            }

            // Imposta la lista videogiochi come attributo della request
            request.setAttribute("listaVideogiochi", listaVideogiochi);

            // Inoltra alla JSP per il rendering
            request.getRequestDispatcher("/jsp/videogiochi.jsp").forward(request, response);
       
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Errore nel recupero dei videogiochi");
        }
    }
}