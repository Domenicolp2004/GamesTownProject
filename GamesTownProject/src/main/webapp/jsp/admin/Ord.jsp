<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Utente" %>
<%@ page import="model.Ordine" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    Utente utente = (Utente) session.getAttribute("utente");
    if (utente == null || !"admin".equals(utente.getRuolo())) {
        response.sendRedirect("adminHome.jsp");
        return;
    }

    List<Ordine> ordini = (List<Ordine>) request.getAttribute("ordini");
    String clienteFiltro = request.getParameter("clienteFiltro") != null ? request.getParameter("clienteFiltro") : "";
    String dataInizio = request.getParameter("dataInizio") != null ? request.getParameter("dataInizio") : "";
    String dataFine = request.getParameter("dataFine") != null ? request.getParameter("dataFine") : "";

    // Token CSRF per sicurezza
    String token = (String) session.getAttribute("token");

    SimpleDateFormat displayDateFormat = new SimpleDateFormat("dd/MM/yyyy");
%>
<html>
<head>
    <title>Ordini</title>
     <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/styles/login.css">
    <script src="<%= request.getContextPath() %>/scripts/adminOrdini.js" defer></script>
</head>
<body>
    <h2>Ordini Clienti</h2>
    <form id="filtroOrdiniForm" action="/AdminOrdiniServlet" method="get">
    	<input type="hidden" name="token" value="<%= token %>" />
		Da: <input type="date" name="dataInizio" id="dataInizio" value="<%= dataInizio %>" />
        A: <input type="date" name="dataFine" id="dataFine" value="<%= dataFine %>" />
             Email cliente (opzionale): <input type="text" name="clienteFiltro" id="clienteFiltro" value="<%= clienteFiltro %>" />
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
            } else{
        %>  <tr>
                <td colspan="4" class=nulla>Nessun ordine trovato per i criteri selezionati.</td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
</body>
</html>
