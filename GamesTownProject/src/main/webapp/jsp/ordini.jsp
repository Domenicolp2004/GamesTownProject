<%@ page import="java.util.List" %>
<%@ page import="model.Ordine" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    String confermaSuccesso = (String) session.getAttribute("confermaSuccesso");
    if (confermaSuccesso != null) {
        request.setAttribute("confermaSuccesso", confermaSuccesso);
        session.removeAttribute("confermaSuccesso");
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>I miei ordini</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/styles/carrello.css">
</head>
<body>

<h1>I miei ordini</h1>

<p id="ordineSuccesso" style="color: green; display: none;">
    <%= request.getAttribute("confermaSuccesso") != null ? request.getAttribute("confermaSuccesso") : "" %>
</p>

<%
    List<Ordine> listaOrdini = (List<Ordine>) request.getAttribute("listaOrdini");

    if (listaOrdini == null || listaOrdini.isEmpty()) {
%>
    <p>Non hai ancora effettuato ordini.</p>
<%
    } else {
%>
    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>ID Ordine</th>
            <th>Data ordine</th>
            <th>Totale</th>
            <th>Stato</th>
            <th>Indirizzo spedizione</th>
            <th>Metodo pagamento</th>
            <th>Dettagli</th>
        </tr>
<%
        for (Ordine ordine : listaOrdini) {
%>
        <tr>
            <td><%= ordine.getId() %></td>
            <td><%= ordine.getDataOrdine() %></td>
            <td><%= String.format("%.2f", ordine.getTotale()) %> €</td>
            <td><%= ordine.getStato() %></td>
            <td><%= ordine.getIndirizzoSpedizione() %></td>
            <td><%= ordine.getMetodoPagamento() %></td>
            <td><a href="<%= request.getContextPath() %>/DettaglioOrdineServlet?id=<%= ordine.getId() %>">Visualizza</a></td>
        </tr>
<%
        }
%>
    </table>
<%
    }
%>

<script src="<%= request.getContextPath() %>/scripts/ordini.js"></script>
</body>
</html>
