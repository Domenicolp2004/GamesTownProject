<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Accesso Negato</title>
     <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/styles/login.css">
</head>
<body>
    <div class="box">
        <h2>Accesso Negato</h2>
        <p>Non hai i permessi per visualizzare questa pagina.</p>
        <a href="<%= request.getContextPath() %>/jsp/login.jsp" class="home-link">Torna al login</a>
    </div>
</body>
</html>