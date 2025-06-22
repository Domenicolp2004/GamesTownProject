<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Utente" %>
<%@ page import="model.Ordine" %>
<%@ page import="java.util.List" %>
<%
    Utente utente = (Utente) session.getAttribute("utente");
    if (utente == null || !"admin".equals(utente.getRuolo())) {
        response.sendRedirect("adminHome.jsp");
        return;
    }

    List<Ordine> ordini = (List<Ordine>) request.getAttribute("ordini");
%>
<html>
<head>
    <title>Ordini</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/styles/login.css">
    <script src="<%= request.getContextPath() %>/scripts/adminOrdini.js" defer></script>
</head>
<body>
    <h2>Ordini Clienti</h2>
    <form id="filtroOrdiniForm" action="/AdminOrdiniServlet" method="get">
        Da: <input type="date" name="da" id="da">
        A: <input type="date" name="a" id="a">
        Email cliente (opzionale): <input type="text" name="email" id="email">
        <button type="submit">Filtra</button>
    </form>

    <table border="1">
        <thead>
            <tr>
                <th>Cliente</th>
                <th>Data</th>
                <th>Totale</th>
                <th>Dettagli</th>
            </tr>
        </thead>
        <tbody>
        <%
            if (ordini != null) {
                for (Ordine o : ordini) {
        %>
            <tr>
                <td><%= o.getIdUtente() %></td>
                <td><%= o.getDataOrdine() %></td>
                <td><%= o.getTotale() %> €</td>
                <td><a href="DettagliOrdine.jsp?id=<%= o.getId() %>">🔍</a></td>
            </tr>
        <%      }
            }
        %>
        </tbody>
    </table>
</body>
</html>
