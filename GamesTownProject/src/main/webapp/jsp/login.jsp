<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>GamesTown</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/styles/login.css">
    <link href="https://fonts.googleapis.com/css2?family=Titillium+Web:wght@300;600&display=swap" rel="stylesheet">
</head>
<body>

<form id="loginForm" action="<%= request.getContextPath() %>/LoginServlet" method="post">
    <div class="container">
        <h1 align="center">Accedi</h1>
<label for="email"><b>Email</b></label>
<input type="email" placeholder="Email" name="email" id="email" required>
<span id="emailError" class="error-message"></span>

<label for="password"><b>Password</b></label>
<input type="password" placeholder="Password" name="password" id="password" required>
<span id="passwordError" class="error-message"></span>
        
     
        
        <button type="submit">Accedi</button>
   
        <% String errore = (String) request.getAttribute("errore");
           if (errore != null) { %>
           <p style="color:red; text-align:center;"><%= errore %></p>
        <% } %>
    </div>
</form>

<script src="<%= request.getContextPath() %>/scripts/login.js"></script>
</body>
</html>
