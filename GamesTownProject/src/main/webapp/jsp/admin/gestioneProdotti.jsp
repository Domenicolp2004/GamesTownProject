<%@ page import="model.Utente" %>
<%@ page import="model.Videogioco" %>
<%@ page import="java.util.List" %>
<%@ page session="true" %>
<%
    Utente utente = (Utente) session.getAttribute("utente");
    String token = (String) session.getAttribute("token");

    if (utente == null || !"admin".equalsIgnoreCase(utente.getRuolo()) || token == null) {
        response.sendRedirect(request.getContextPath() + "/jsp/login.jsp?accessDenied=true");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestione Catalogo - Admin</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/styles/admCatalogo.css">
    <script src="<%= request.getContextPath() %>/scripts/adminCatalogo.js"></script>
</head>
<body>
    <h1>Gestione Catalogo Prodotti</h1>
	<a href="<%= request.getContextPath() %>/jsp/admin/adminHome.jsp"  class="home-link">Torna alla Home Admin</a>
    
    <h2>Inserisci Nuovo Videogioco</h2>
    <form action="<%= request.getContextPath() %>/AdminCatalogoServlet" method="post">
        <input type="hidden" name="action" value="insert" />
        <input type="hidden" name="token" value="<%= token %>" />
        Titolo: <input type="text" name="titolo" required /><br/>
        Descrizione: <textarea name="descrizione"></textarea><br/>
        Prezzo: <input type="number" step="0.01" name="prezzo" required /><br/>
        Data Uscita: <input type="date" name="dataUscita" /><br/>
        Genere: <input type="text" name="genere" /><br/>
        Piattaforma: <input type="text" name="piattaforma" /><br/>
        Immagine (nome file): <input type="text" name="immagine" /><br/>
        <button type="submit">Aggiungi Videogioco</button>
    </form>

    <h2>Prodotti Esistenti</h2>
    <%
        List<Videogioco> giochi = (List<Videogioco>) request.getAttribute("listaGiochi");
        if (giochi != null && !giochi.isEmpty()) {
            for (Videogioco gioco : giochi) {
    %>
        <form action="<%= request.getContextPath() %>/AdminCatalogoServlet" method="post" style="border:1px solid #ccc; margin-bottom:10px; padding:10px;">
            <input type="hidden" name="id" value="<%= gioco.getId() %>" />
            <input type="hidden" name="token" value="<%= token %>" />
            Titolo: <input type="text" name="titolo" value="<%= gioco.getTitolo() %>" required /><br/>
            Descrizione: <textarea name="descrizione"><%= gioco.getDescrizione() %></textarea><br/>
            Prezzo: <input type="number" step="0.01" name="prezzo" value="<%= gioco.getPrezzo() %>" required /><br/>
            Data Uscita: <input type="date" name="dataUscita" value="<%= gioco.getDataUscita() != null ? gioco.getDataUscita().toString() : "" %>" /><br/>
            Genere: <input type="text" name="genere" value="<%= gioco.getGenere() %>" /><br/>
            Piattaforma: <input type="text" name="piattaforma" value="<%= gioco.getPiattaforma() %>" /><br/>
            Immagine (nome file): <input type="text" name="immagine" value="<%= gioco.getImmagine() %>" /><br/>
                 <button type="submit" name="action" value="update">Modifica</button>
            <button type="submit" name="action" value="delete" onclick="return confirm('Sei sicuro di voler cancellare questo prodotto?');">Cancella</button>
        </form>
    <%
            }
        } else {
    %>
        <p>Nessun videogioco trovato.</p>
    <%
        }
    %>
</body>
</html>