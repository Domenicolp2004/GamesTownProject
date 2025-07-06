<%@ page import="java.util.List" %>
<%@ page import="model.Videogioco" %>
<%@ page import="model.Categoria" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Videogiochi - GamesTown</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/styles/main.css">
</head>
<body>

<%@ include file="header.jsp" %>

<%
    List<Categoria> listaCategorie = (List<Categoria>) request.getAttribute("listaCategorie");
    Integer categoriaSelezionata = (Integer) request.getAttribute("categoriaSelezionata");
    List<Videogioco> listaVideogiochi = (List<Videogioco>) request.getAttribute("listaVideogiochi");
%>

<h1>Videogiochi disponibili</h1>

<!-- FILTRO CATEGORIA -->
<form method="get" action="<%= request.getContextPath() %>/CatalogoPerCategoriaServlet" class="categoria-filter-form">
    <div class="categoria-filter">
        <label for="categoriaSelect">Filtra per categoria:</label>
        <select name="categoriaId" id="categoriaSelect" onchange="this.form.submit()">
            <option value="">Tutte le categorie</option>
            <% if (listaCategorie != null) {
                for (Categoria c : listaCategorie) {
                    boolean selected = (categoriaSelezionata != null && categoriaSelezionata == c.getId());
            %>
                <option value="<%= c.getId() %>" <%= selected ? "selected" : "" %>><%= c.getNome() %></option>
            <%  }
            } %>
        </select>
        <noscript><button type="submit">Filtra</button></noscript>
    </div>
</form>

<!-- CATALOGO -->
<div class="catalogo" id="catalogoVideogiochi">
    <% if (listaVideogiochi != null && !listaVideogiochi.isEmpty()) {
        for (Videogioco v : listaVideogiochi) { %>
        <div class="prodotto">
            <h2><%= v.getTitolo() %></h2>
            <img src="<%= request.getContextPath() %>/images/<%= v.getImmagine() %>" alt="<%= v.getTitolo() %>" width="200">
            <p><strong>Genere:</strong> <%= v.getGenere() %></p>
            <p><strong>Piattaforma:</strong> <%= v.getPiattaforma() %></p>
            <p><strong>Prezzo:</strong> €<%= String.format("%.2f", v.getPrezzo()) %></p>
            <form action="<%= request.getContextPath() %>/AddCarrelloServlet" method="post" class="form-carrello">
                <input type="hidden" name="id" value="<%= v.getId() %>">
                <button type="submit" class="btn-add">Aggiungi al carrello</button>
            </form>
        </div>
    <% }
    } else { %>
        <p>Nessun videogioco disponibile.</p>
    <% } %>
</div>

<%@ include file="footer.jsp" %>

<script src="<%= request.getContextPath() %>/scripts/videogiochi.js"></script>
</body>
</html>