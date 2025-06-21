<%@ page import="java.util.List" %>
<%@ page import="model.Videogioco" %>
<!DOCTYPE html>
<html>
<head>
    <title>Videogiochi - GamesTown</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/styles/main.css">
</head>
<body>

<h1 align="center">Videogiochi disponibili</h1>

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

<script src="<%= request.getContextPath() %>/scripts/videogiochi.js"></script>
</body>
</html>
