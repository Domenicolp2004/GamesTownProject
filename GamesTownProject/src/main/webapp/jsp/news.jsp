<%@ page import="java.util.List" %>
<%@ page import="model.Notizia" %>
<!DOCTYPE html>
<html>
<head>
    <title>News - GamesTown</title>
     <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/styles/main.css">
</head>
<body>

<h1 align="center">Ultime Notizie</h1>

<div class="catalogo">
    <%
        List<Notizia> listaNotizie = (List<Notizia>) request.getAttribute("listaNotizie");
        if (listaNotizie != null && !listaNotizie.isEmpty()) {
            for (Notizia n : listaNotizie) {
    %>
                <div class="prodotto news-item">
                    <h2><%= n.getTitolo() %></h2>
                    <img src="<%= request.getContextPath() + "/images/" + n.getImmagine() %>" alt="<%= n.getTitolo() %>" width="200" />
                    <p class="date">Pubblicato il: <%= n.getDataPubblicazione() %></p>
                    <p><%= n.getContenuto() %></p>
                </div>
    <%
            }
        } else {
    %>
        <p>Nessuna notizia disponibile</p>
    <%
        }
    %>
</div>

</body>
</html>