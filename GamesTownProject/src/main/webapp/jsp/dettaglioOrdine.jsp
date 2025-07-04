<%@ page import="java.util.List" %>
<%@ page import="model.RigaOrdine" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="model.Ordine" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Dettaglio Ordine</title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/styles/carrello.css">
  <script src="<%= request.getContextPath() %>/scripts/dettaglioOrdine.js" defer></script>
</head>
<body>

<h1>Dettaglio Ordine</h1>

<%
    Ordine ordine = (Ordine) request.getAttribute("ordine");
    List<RigaOrdine> righeOrdine = (List<RigaOrdine>) request.getAttribute("righeOrdine");

    if (ordine == null) {
%>
    <p>Ordine non trovato.</p>
<%
    } else {
%>
	
    <h2>Informazioni Generali</h2>
    <ul>
        <li><strong>ID Ordine:</strong> <%= ordine.getId() %></li>
        <%
   			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy"); // o "yyyy-MM-dd"
			%>
        <li><strong>Data:</strong> <%= sdf.format(ordine.getDataOrdine()) %></li>
        <li><strong>Totale:</strong> <%= String.format("%.2f", ordine.getTotale()) %> €</li>
        <li><strong>Stato:</strong> <%= ordine.getStato() %></li>
        <li><strong>Indirizzo Spedizione:</strong> <%= ordine.getIndirizzoSpedizione() %></li>
        <li><strong>Metodo Pagamento:</strong> <%= ordine.getMetodoPagamento() %></li>
    </ul>

    <h2>Prodotti Ordinati</h2>
<%
        if (righeOrdine == null || righeOrdine.isEmpty()) {
%>
        <p>Nessuna riga d'ordine trovata.</p>
<%
        } else {
%>
        <table border="1" cellpadding="5" cellspacing="0" id="tabellaRigheOrdine">
            <thead>
              <tr>
                 
                  <th>ID Prodotto</th>
                  <th>Quantità</th>
                  <th>Prezzo Unitario</th>
                  <th>Totale</th>
              </tr>
            </thead>
            <tbody>
<%
            for (RigaOrdine r : righeOrdine) {
                double totaleRiga = r.getPrezzoUnitario() * r.getQuantita();
%>
              <tr>
                 
                  <td><%= r.getIdProdotto() %></td>
                  <td><%= r.getQuantita() %></td>
                  <td><%= String.format("%.2f", r.getPrezzoUnitario()) %> €</td>
                  <td><%= String.format("%.2f", totaleRiga) %> €</td>
              </tr>
<%
            }
%>
            </tbody>
        </table>
<%
        }
    }
%>

<p ><a href="<%= request.getContextPath() %>/ListaOrdiniServlet" class="home-link">← Torna alla lista ordini</a></p>

</body>
</html>

