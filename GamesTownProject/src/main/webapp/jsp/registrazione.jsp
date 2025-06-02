<%@ page import="java.sql.*" %>
<%@ page session="true" %>

<%
    String nome = request.getParameter("nome");
    String cognome = request.getParameter("cognome");
    String email = request.getParameter("email");
    String psw = request.getParameter("psw");
    String pswRepeat = request.getParameter("psw-repeat");

    if (nome != null && cognome != null && email != null && psw != null && pswRepeat != null) {
        if (!psw.equals(pswRepeat)) {
%>
            <p style="color:red; text-align:center;">Le password non corrispondono!</p>
<%
        } else {
            Connection conn = null;
            PreparedStatement stmt = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gamestown", "tuo_utente", "tua_password");

                String checkEmailSql = "SELECT id FROM utente WHERE email = ?";
                stmt = conn.prepareStatement(checkEmailSql);
                stmt.setString(1, email);
                ResultSet rsCheck = stmt.executeQuery();

                if (rsCheck.next()) {
%>
                    <p style="color:red; text-align:center;">Email già registrata!</p>
<%
                } else {
                    rsCheck.close();
                    stmt.close();

                    String insertSql = "INSERT INTO utente (nome, cognome, email, password) VALUES (?, ?, ?, ?)";
                    stmt = conn.prepareStatement(insertSql);
                    stmt.setString(1, nome);
                    stmt.setString(2, cognome);
                    stmt.setString(3, email);
                    stmt.setString(4, psw); // In produzione: usa hash della password!

                    int result = stmt.executeUpdate();

                    if (result > 0) {
%>
                        <p style="color:green; text-align:center;">Registrazione avvenuta con successo!</p>
<%
                    } else {
%>
                        <p style="color:red; text-align:center;">Errore durante la registrazione.</p>
<%
                    }
                }

            } catch (Exception e) {
%>
                <p style="color:red; text-align:center;">Errore: <%= e.getMessage() %></p>
<%
            } finally {
                try { if (stmt != null) stmt.close(); } catch (Exception e) {}
                try { if (conn != null) conn.close(); } catch (Exception e) {}
            }
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
<form action="" method="post">
  <div class="container">
    <h1 align="center">Registrati</h1>
 

    <label for="nome"><b>Nome</b></label>
    <input type="text" placeholder="Nome" name="nome" required>
    
     <label for="cognome"><b>Cognome</b></label>
    <input type="text" placeholder="Cognome" name="cognome" required>
    
    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Email" name="email" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Password" name="psw" required>

    <label for="psw-repeat"><b>Ripeti Password</b></label>
    <input type="password" placeholder="Password" name="psw-repeat" required>


    <div class="clearfix">
      <button type="button" class="cancelbtn">Annulla</button>
      <button type="submit" class="signupbtn">Registrati</button>
      <label>
    </label>
    </div>
  </div>
</form>
</body>
</html>