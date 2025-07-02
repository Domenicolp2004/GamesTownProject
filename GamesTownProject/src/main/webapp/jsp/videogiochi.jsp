<%@ page import="java.util.List" %>
<%@ page import="model.Videogioco" %>
<%@ page import="model.Categoria" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Videogiochi - GamesTown</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/styles/main.css">
</head>
<body>
<%@ include file="header.jsp" %>

<%
    List<Categoria> listaCategorie = (List<Categoria>) request.getAttribute("listaCategorie");
    Integer categoriaSelezionata = (Integer) request.getAttribute("categoriaSelezionata");
%>
<h1 align="center">Videogiochi disponibili</h1>
<form method="get" action="" class="categoria-filter-form">
    <div class="categoria-filter">
        <label for="categoriaSelect">Filtra per categoria:</label>
        <select name="categoriaId" id="categoriaSelect">
            <option value="">Tutte le categorie</option>
            <% if (listaCategorie != null) {
                for (Categoria c : listaCategorie) {
                    String selected = (categoriaSelezionata != null && categoriaSelezionata == c.getId()) ? "selected" : "";
            %>
                <option value="<%= c.getId() %>" <%= selected %>><%= c.getNome() %></option>
            <%  }
            } %>
        </select>
        <noscript><button type="submit">Filtra</button></noscript>
    </div>
</form>


<div class="catalogo" id="catalogoVideogiochi">
    <%
        List<Videogioco> listaVideogiochi = (List<Videogioco>) request.getAttribute("listaVideogiochi");
        if (listaVideogiochi != null) {
            for (Videogioco v : listaVideogiochi) {
    %>
                <div class="prodotto">
                    <h2><%= v.getTitolo() %></h2>
                    <img src="<%= request.getContextPath() + "/images/" + v.getImmagine() %>" alt="<%= v.getTitolo() %>" width="200" />
                    <p>Genere: <%= v.getGenere() %></p>
                    <p>Piattaforma: <%= v.getPiattaforma() %></p>
                    <p>Prezzo: <%= v.getPrezzo() %> euro</p>
                    <form class="form-carrello" action="<%= request.getContextPath() %>/AddCarrelloServlet" method="post">
                        <input type="hidden" name="id" value="<%= v.getId() %>"/>
                        <button type="submit" class="btn-add">Aggiungi al carrello</button>
                    </form>
                </div>
    <%
            }
        } else {
    %>
        <p>Nessun videogioco disponibile</p>
    <%
        }
    %>
  
</div>

  <%@ include file="footer.jsp" %>

<script src="<%= request.getContextPath() %>/scripts/videogiochi.js"></script>
</body>
</html>
