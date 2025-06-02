<%@ page import="java.sql.*, javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page session="true" %>

<%
    String uname = request.getParameter("uname");
    String psw = request.getParameter("psw");

    if (uname != null && psw != null) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamestown", "tuo_utente", "tua_password");

            String sql = "SELECT * FROM utente WHERE email = ? AND password = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uname);
            stmt.setString(2, psw);

            rs = stmt.executeQuery();

            if (rs.next()) {
                session.setAttribute("idUtente", rs.getInt("id"));
                session.setAttribute("nomeUtente", rs.getString("nome"));
                response.sendRedirect("home.jsp"); // pagina di atterraggio dopo il login
            } else {
%>
                <p style="color:red; text-align:center;">Credenziali non valide</p>
<%
            }
        } catch (Exception e) {
            out.println("Errore: " + e.getMessage());
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (stmt != null) stmt.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>GamesTown</title>
    <link rel="stylesheet" type="text/css" href="../styles/login.css">
     <link href="https://fonts.googleapis.com/css2?family=Titillium+Web:wght@300;600&display=swap" rel="stylesheet">
</head>
 <body>

    
<form action="login.jsp" method="post">

  <div class="container">
    <h1 align="center">Accedi</h1>
    <label for="uname"><b>Username</b></label>
    <input type="text" placeholder="Username" name="uname" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Password" name="psw" required>
    
    <a href="password-dimenticata.jsp" class="forgot-password">Hai dimenticato la password?</a>
        
    <button type="submit">Accedi</button>
    <label>
      <input type="checkbox" checked="checked" name="remember"> Remember me
    </label>
  </div>

</form>

</body>
</html>