package control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.DataBaseConnection;
import model.Notizia;
import model.NotiziaDAO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/NotizieServlet")
public class NotizieServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (Connection conn = DataBaseConnection.getConnection()) {
            NotiziaDAO dao = new NotiziaDAO(conn);
            List<Notizia> notizie = dao.getUltimeNotizie();
            request.setAttribute("listaNotizie", notizie);
            request.getRequestDispatcher("jsp/news.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}


