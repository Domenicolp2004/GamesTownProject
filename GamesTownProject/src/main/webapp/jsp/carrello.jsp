<%@ page import="model.Carrello, model.ItemCarrello" %>
<%@ page import="java.util.*" %>
<%@ page import="model.Videogioco" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Carrello</title>
 <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/styles/carrello.css">
</head>
<body>

<%
    Carrello carrello = (Carrello) session.getAttribute("carrello");
    if (carrello == null || carrello.getItems().isEmpty()) {
%>
    <p class="empty-message">Il carrello è vuoto.</p>
<%
    } else {
%>
    <table>
        <tr><th>Titolo</th><th>Prezzo</th><th>Quantità</th><th>Totale</th><th>Azioni</th></tr>
<%
        for (ItemCarrello item : carrello.getItems()) {
            Videogioco videogioco = item.getVideogioco();
%>
        <tr>
            <td><%= videogioco.getTitolo() %></td>
            <td><%= videogioco.getPrezzo() %>€</td>
           	<td>
    <form action="<%= request.getContextPath() %>/AggiornaQuantitaServlet" method="post">
        <input type="hidden" name="id" value="<%= videogioco.getId() %>" />
        <input type="number" name="quantita" value="<%= item.getQuantita() %>" min="1" max="99" required />
        <button type="submit">Aggiorna</button>
    </form>
</td>
            <td><%= item.getTotale() %>€</td>
            <td>
          <form action="<%= request.getContextPath() %>/RemoveCarrelloServlet" method="post">
    <input type="hidden" name="id" value="<%= videogioco.getId() %>" />
    <button type="submit">Rimuovi</button>
</form>

        </tr>
<%
        }
%>
        <tr>
            <td colspan="3"><strong>Totale carrello</strong></td>
            <td><%= carrello.getTotale() %>€</td>
            <td><form action="<%= request.getContextPath() %>/SvuotaCarrelloServlet" method="post">
    <button type="submit">Svuota carrello</button>
</form></td>
        </tr>
    </table>

<%
    }
%>
</body>
</html>