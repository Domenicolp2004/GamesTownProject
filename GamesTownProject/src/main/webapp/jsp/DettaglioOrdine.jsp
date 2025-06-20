<%@ page import="java.util.List" %>
<%@ page import="model.RigaOrdine" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dettaglio Ordine</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/styles/main.css">
</head>
<body>

<h1>Dettaglio Ordine</h1>

<%
    List<RigaOrdine> righeOrdine = (List<RigaOrdine>) request.getAttribute("righeOrdine");

    if (righeOrdine == null || righeOrdine.isEmpty()) {
%>
    <p>Nessuna riga d'ordine trovata.</p>
<%
    } else {
%>
    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>ID Riga</th>
            <th>ID Prodotto</th>
            <th>Quantità</th>
            <th>Prezzo Unitario</th>
            <th>Totale</th>
        </tr>
<%
        for (RigaOrdine r : righeOrdine) {
            double totaleRiga = r.getPrezzoUnitario() * r.getQuantita();
%>
        <tr>
            <td><%= r.getId() %></td>
            <td><%= r.getIdProdotto() %></td>
            <td><%= r.getQuantita() %></td>
            <td><%= String.format("%.2f", r.getPrezzoUnitario()) %> €</td>
            <td><%= String.format("%.2f", totaleRiga) %> €</td>
        </tr>
<%
        }
%>
    </table>
<%
    }
%>

<p><a href="<%= request.getContextPath() %>/ListaOrdiniServlet">Torna agli ordini</a></p>

</body>
</html>