<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Utente" %>
<%
	Utente utente = (Utente) session.getAttribute("utente");
	String token = (String) session.getAttribute("token");
	
	if (utente == null || token == null || !"admin".equalsIgnoreCase(utente.getRuolo())) {
	    response.sendRedirect(request.getContextPath() + "/jsp/login.jsp?accessDenied=true");
	    return;
	}

%>
<!DOCTYPE html>
<html>
<head>
    <title>Area Admin - GamesTown</title>
      <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/styles/login.css">
</head>
<body>
    <h1>Benvenuto Admin, <%= utente.getNome() %></h1>
    <ul>
        <li><a href="<%= request.getContextPath() %>/AdminCatalogoServlet">Gestione Catalogo</a></li>
        <li><a href="<%= request.getContextPath() %>/AdminOrdiniServlet">Gestione Ordini</a></li>
        <li><a href="<%= request.getContextPath() %>/LogoutServlet">Logout</a></li>
    </ul>
</body>
</html>