<%@ page import="java.util.List" %>
<%@ page import="model.Videogioco" %>
<!DOCTYPE html>
<html>
<head>
    <title>Videogiochi - GamesTown</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/styles/main.css">
</head>
<body>

<h1>Videogiochi disponibili</h1>

<div class="lista-videogiochi">
    <%
        List<Videogioco> listaVideogiochi = (List<Videogioco>) request.getAttribute("listaVideogiochi");
        if (listaVideogiochi != null) {
            for (Videogioco v : listaVideogiochi) {
    %>
                <div class="videogioco">
                    <h2><%= v.getTitolo() %></h2>
                    <img src="<%= request.getContextPath() + "/images/" + v.getImmagine() %>" alt="<%= v.getTitolo() %>" width="200" />
                    <p><%= v.getDescrizione() %></p>
                    <p>Genere: <%= v.getGenere() %></p>
                    <p>Piattaforma: <%= v.getPiattaforma() %></p>
                    <p>Data di uscita: <%= v.getDataUscita() %></p>
                    <form action="<%= request.getContextPath() %>/AddCarrelloServlet" method="post">
   				 <input type="hidden" name="id" value="<%= v.getId() %>"/>
   				 <button type="submit">Aggiungi al carrello</button>
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

</body>
</html>