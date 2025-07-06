<%@ page import="model.Utente" %>
<%@ page import="model.Ordine" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page session="true" %>


<%! 
    SimpleDateFormat displayDateFormat = new SimpleDateFormat("dd/MM/yyyy"); 
    SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd");
%>

<%
    Utente utente = (Utente) session.getAttribute("utente");
    if (utente == null || !"admin".equalsIgnoreCase(utente.getRuolo())) {
        response.sendRedirect(request.getContextPath() + "/jsp/login.jsp?accessDenied=true");
        return;
    }
    
    String token = (String) session.getAttribute("token");

    List<Ordine> ordini = (List<Ordine>) request.getAttribute("listaOrdini");

    // Valori per mantenere i filtri compilati nel form
    String clienteFiltro = request.getParameter("clienteFiltro") != null ? request.getParameter("clienteFiltro") : "";
    String dataInizio = request.getParameter("dataInizio") != null ? request.getParameter("dataInizio") : "";
    String dataFine = request.getParameter("dataFine") != null ? request.getParameter("dataFine") : "";
%>

<!DOCTYPE html>
<html>
<head>
    <title>Visualizza Ordini - Admin</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/styles/admin.css">
</head>
<body>
    <h1>Visualizza Ordini</h1>
    <a href="<%= request.getContextPath() %>/jsp/admin/adminHome.jsp"  class="home-link">Torna alla Home Admin</a>

<form method="get" action="<%= request.getContextPath() %>/AdminOrdiniServlet">
    <input type="hidden" name="token" value="<%= session.getAttribute("token") %>" />
    Cliente (email): <input type="text" name="clienteFiltro" value="<%= clienteFiltro %>" />
    Data Inizio: <input type="date" name="dataInizio" value="<%= dataInizio %>" />
    Data Fine: <input type="date" name="dataFine" value="<%= dataFine %>" />
    <button type="submit">Filtra</button>
</form>

    <hr />

    <%
        if (ordini != null && !ordini.isEmpty()) {
            for (Ordine o : ordini) {
    %>
        <div class="ordine-card">
            <p><strong>Ordine ID:</strong> <%= o.getId() %></p>
            <p><strong>Cliente:</strong> <%= o.getIdUtente() %></p>
            <p><strong>Data Ordine:</strong> 
                <%= o.getDataOrdine() != null ? displayDateFormat.format(o.getDataOrdine()) : "" %>
            </p>
            <p><strong>Stato:</strong> <%= o.getStato() %></p>
            <p><strong>Totale:</strong> Euro <%= o.getTotale() %></p>
            <p><strong>Indirizzo Spedizione:</strong> <%= o.getIndirizzoSpedizione() %></p>
            <p><strong>Metodo Pagamento:</strong> <%= o.getMetodoPagamento() %></p>
        </div>
    <%
            }
        } else {
    %>
        <p>Nessun ordine trovato per i criteri selezionati.</p>
    <%
        }
    %>
</body>
</html>
