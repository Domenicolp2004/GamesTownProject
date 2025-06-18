<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>GamesTown</title>
 	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/styles/login.css">
    <link href="https://fonts.googleapis.com/css2?family=Titillium+Web:wght@300;600&display=swap" rel="stylesheet">
</head>
<body>

<form action="/GamesTownProject/LoginServlet" method="post">

  <div class="container">
    <h1 align="center">Accedi</h1>

    <label for="email"><b>Email</b></label>
    <input type="email" placeholder="Email" name="email" required>

    <label for="password"><b>Password</b></label>
    <input type="password" placeholder="Password" name="password" required>
    
    <a href="password-dimenticata.jsp" class="forgot-password">Hai dimenticato la password?</a>
        
    <button type="submit">Accedi</button>
    <label>
      <input type="checkbox" checked="checked" name="remember"> Remember me
    </label>

    <% String errore = (String) request.getAttribute("errore");
       if (errore != null) { %>
       <p style="color:red; text-align:center;"><%= errore %></p>
    <% } %>
  </div>

</form>

</body>
</html>