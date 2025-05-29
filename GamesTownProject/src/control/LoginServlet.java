public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UtenteDAO dao = new UtenteDAO();
        try {
            if (dao.login(email, password)) {
                request.getSession().setAttribute("utente", email);
                response.sendRedirect("home.jsp");
            } else {
                request.setAttribute("errore", "Email o password errati");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}