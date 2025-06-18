<%@ page import="model.Carrello, model.ItemCarrello" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Carrello</title>
	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/styles/login.css">
</head>
<body>

<%
    Carrello carrello = (Carrello) session.getAttribute("carrello");
    if (carrello == null || carrello.getItems().isEmpty()) {
%>
    <p>Il carrello è vuoto.</p>
<%
    } else {
%>
    <table>
        <tr><th>Titolo</th><th>Prezzo</th><th>Quantità</th><th>Totale</th></tr>
<%
        for (ItemCarrello item : carrello.getItems()) {
%>
        <tr>
            <td><%= item.getVideogioco().getTitolo() %></td>
            <td><%= item.getVideogioco().getPrezzo() %>€</td>
            <td><%= item.getQuantita() %></td>
            <td><%= item.getTotale() %>€</td>
        </tr>
<%
        }
%>
        <tr>
            <td colspan="3">Totale</td>
            <td><%= carrello.getTotale() %>€</td>
        </tr>
    </table>
<%
    }
%>
</body>
</html>