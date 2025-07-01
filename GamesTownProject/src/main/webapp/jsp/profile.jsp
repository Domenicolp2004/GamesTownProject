<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Utente" %>
<%
    Utente utente = (Utente) session.getAttribute("utente");
%>
<!DOCTYPE html>
<html>
<head>
    <title>GamesTown - Modifica Profilo</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/styles/login.css">
    <link href="https://fonts.googleapis.com/css2?family=Titillium+Web:wght@300;600&display=swap" rel="stylesheet">
</head>
<body>

<form id="profileForm" action="<%= request.getContextPath() %>/ProfileServlet" method="post">
    <div class="container">
        <h1 align="center">Modifica Profilo</h1>

        <label for="nome"><b>Nome</b></label>
        <input type="text" placeholder="Nome" name="nome" id="nome" value="<%= utente != null ? utente.getNome() : "" %>" required>

        <label for="cognome"><b>Cognome</b></label>
        <input type="text" placeholder="Cognome" name="cognome" id="cognome" value="<%= utente != null ? utente.getCognome() : "" %>" >

        <label for="email"><b>Email</b></label>
        <input type="email" placeholder="Email" name="email" id="email" value="<%= utente != null ? utente.getEmail() : "" %>" required>
	<span id="emailExistsError" style="color:red;"></span>
        <label for="password"><b>Password (lascia vuoto per non cambiare)</b></label>
        <input type="password" placeholder="Password" name="password" id="password">

        <button type="submit">Salva</button>

        <% String errore = (String) request.getAttribute("errore");
           if (errore != null) { %>
           <p style="color:red; text-align:center; margin-top: 10px;"><%= errore %></p>
        <% } %>

        <% String success = (String) request.getAttribute("success");
           if (success != null) { %>
           <p style="color:green; text-align:center; margin-top: 10px;"><%= success %></p>
        <% } %>
    </div>

    <div style="text-align: center; margin-top: 15px;">
        <a href="<%= request.getContextPath() %>/HomeServlet" class="home-link">← Torna alla Home</a>
    </div>
</form>
<script src="<%= request.getContextPath() %>/scripts/profile.js"></script>
</body>
</html>
