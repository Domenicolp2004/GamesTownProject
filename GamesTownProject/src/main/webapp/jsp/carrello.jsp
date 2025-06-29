<%@ page import="model.Carrello, model.ItemCarrello" %>
<%@ page import="java.util.*" %>
<%@ page import="model.Videogioco" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
                <form action="<%= request.getContextPath() %>/AggiornaQuantitaServlet" method="post" class="form-quantita">
                    <input type="hidden" name="id" value="<%= videogioco.getId() %>" />
                    <input type="number" name="quantita" value="<%= item.getQuantita() %>" min="1" max="99" required />
                    <button type="submit">Aggiorna</button>
                </form>
            </td>
            <td><%= item.getTotale() %>€</td>
            <td>
                <form action="<%= request.getContextPath() %>/RemoveCarrelloServlet" method="post" class="form-rimuovi">
                    <input type="hidden" name="id" value="<%= videogioco.getId() %>" />
                    <button type="submit">Rimuovi</button>
                </form>
            </td>
        </tr>
<%
        }
%>
        <tr>
            <td colspan="3"><strong>Totale carrello</strong></td>
            <td><%= carrello.getTotale() %>€</td>
            <td>
                <form action="<%= request.getContextPath() %>/SvuotaCarrelloServlet" method="post" class="form-svuota">
                    <button type="submit">Svuota carrello</button>
                </form>
            </td>
        </tr>
    </table>

    <form action="<%= request.getContextPath() %>/ConfermaOrdineServlet" method="post" class="form-ordine">
        <h3>Conferma Ordine</h3>
        <label for="indirizzoSpedizione">Indirizzo di spedizione:</label><br>
        <textarea name="indirizzoSpedizione" id="indirizzoSpedizione" rows="3" required></textarea><br><br>

        <label for="metodoPagamento">Metodo di pagamento:</label><br>
        <select name="metodoPagamento" id="metodoPagamento" required>
            <option value="">Seleziona...</option>
            <option value="Carta di credito">Carta di credito</option>
            <option value="PayPal">PayPal</option>
            <option value="Pagamento alla consegna">Pagamento alla consegna</option>
        </select><br><br>

        <button type="submit">Conferma Ordine</button>
    </form>
<%
    }
%>
<%@ include file="footer.jsp" %>

<script src="<%= request.getContextPath() %>/scripts/carrello.js"></script>

</body>
</html>
