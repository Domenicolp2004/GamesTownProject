<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Registrazione - GamesTown</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/styles/login.css">
    <link href="https://fonts.googleapis.com/css2?family=Titillium+Web:wght@300;600&display=swap" rel="stylesheet">
    <style>
      .error-message { color: red; font-size: 0.9em; }
    </style>
</head>
<body>

<form id="registrationForm" action="<%= request.getContextPath() %>/RegistrazioneServlet" method="post">
  <div class="container">
    <h1 align="center">Registrati</h1>

    <label for="nome"><b>Nome</b></label>
    <input type="text" placeholder="Nome" name="nome" id="nome" required>
    <span id="nomeError" class="error-message"></span>

    <label for="cognome"><b>Cognome</b></label>
    <input type="text" placeholder="Cognome" name="cognome" id="cognome" required>
    <span id="cognomeError" class="error-message"></span>

    <label for="email"><b>Email</b></label>
    <input type="email" placeholder="Email" name="email" id="email" required>
    <span id="emailError" class="error-message"></span>

    <label for="password"><b>Password</b></label>
    <input type="password" placeholder="Password" name="password" id="password" required>
    <span id="passwordError" class="error-message"></span>

    <button type="submit">Registrati</button>

    <% String errore = (String) request.getAttribute("errore");
       if (errore != null) { %>
       <p style="color:red; text-align:center;"><%= errore %></p>
    <% } %>

    <% String successo = (String) request.getAttribute("successo");
       if (successo != null) { %>
       <p style="color:green; text-align:center;"><%= successo %></p>
    <% } %>
  </div>
<div style="text-align: center; margin-top: 15px;">
    <a href="<%= request.getContextPath() %>/HomeServlet" class="home-link">← Torna alla Home</a>
</div>
</form>


<script src="<%= request.getContextPath() %>/scripts/registrazione.js"></script>
</body>
</html>
