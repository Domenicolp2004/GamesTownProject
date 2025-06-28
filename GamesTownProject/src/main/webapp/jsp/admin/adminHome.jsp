<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Utente" %>
<%
    Utente utente = (Utente) session.getAttribute("utente");
    String sessionToken = (String) session.getAttribute("token");
    String requestToken = request.getParameter("token");

    // Se arriva un token da URL (solo al primo accesso dopo il login), salvalo in sessione
    if (requestToken != null && sessionToken == null) {
        session.setAttribute("token", requestToken);
        sessionToken = requestToken;
    }

    // Controllo utente e token in sessione
    if (utente == null 
        || !"admin".equalsIgnoreCase(utente.getRuolo()) 
        || sessionToken == null) {
        response.sendRedirect(request.getContextPath() + "/jsp/login.jsp?accessDenied=true");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Area Admin - GamesTown</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/styles/admin.css">
</head>
<body>
    <h1>Benvenuto Admin, <%= utente.getNome() %></h1>
    <ul>
        <li><a href="<%= request.getContextPath() %>/AdminCatalogoServlet?token=<%= session.getAttribute("token") %>">Gestione Catalogo</a></li>
        <li><a href="<%= request.getContextPath() %>/AdminOrdiniServlet?token=<%= session.getAttribute("token") %>">Gestione Ordini</a></li>
        <li><a href="<%= request.getContextPath() %>/LogoutServlet">Logout</a></li>
    </ul>
</body>
</html>