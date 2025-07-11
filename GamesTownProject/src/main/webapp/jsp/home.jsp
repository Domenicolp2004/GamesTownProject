<%@ page import="java.util.List" %>
<%@ page import="model.Videogioco" %>
<%@ page import="model.Notizia" %>
<%@ page import="model.Utente" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>


<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GamesTown</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/styles/main.css">
    <link href="https://fonts.googleapis.com/css2?family=Titillium+Web:wght@300;600&display=swap" rel="stylesheet">
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container">

    <div class="sidebar">
	    <aside class="news-section left-news">
        <h3>Perché sceglierci?</h3>
                  <div class="offerte-lamp">
            🔥 <strong>I migliori titoli</strong>
        </div>
          <div class="offerte-lamp">
            🔥 <strong>Prezzi Competitivi</strong>
        </div>
          <div class="offerte-lamp">
            🔥 <strong>Ampia scelta</strong>
        </div>
        
    </aside>
    </div>

 
   

    <main class="main-content">
     
     


        <div class="titolo">Prodotti in Evidenza</div>
        <div class="catalogo">
            <%
                List<Videogioco> giochi = (List<Videogioco>) request.getAttribute("giochi");
                if (giochi != null) {
                    for (Videogioco gioco : giochi) {
            %>
                <div class="prodotto">
                    <h2><%= gioco.getTitolo() %></h2>
                    <img src="<%= request.getContextPath() + "/images/" + gioco.getImmagine() %>" alt="<%= gioco.getTitolo() %>" width="200" />
                    <p>Prezzo: <%= gioco.getPrezzo() %> euro</p>
                    <form action="<%= request.getContextPath() %>/AddCarrelloServlet" method="post">
                        <input type="hidden" name="id" value="<%= gioco.getId() %>"/>
                       <button type="submit" class="btn-add">Aggiungi al carrello</button>
                    </form>
                </div>
            <%
                    }
                }
            %>
        </div>
	<br>
	<br>
        <div class="titolo">Più Economici</div>
        <div class="catalogo">
            <%
                List<Videogioco> games = (List<Videogioco>) request.getAttribute("eco");
                if (games != null) {
                    for (Videogioco g : games) {
            %>
                <div class="prodotto">
                    <h2><%= g.getTitolo() %></h2>
                    <img src="<%= request.getContextPath() + "/images/" + g.getImmagine() %>" alt="<%= g.getTitolo() %>" width="200" />
                    <p>Prezzo: <%= g.getPrezzo() %> euro</p>
                    <form action="<%= request.getContextPath() %>/AddCarrelloServlet" method="post">
                        <input type="hidden" name="id" value="<%= g.getId() %>"/>
                         <button type="submit" class="btn-add">Aggiungi al carrello</button>
                    </form>
                </div>
            <%
                    }
                }
            %>
        </div>

    </main>

   <div class="sidebar">
    <aside class="news-section right-news">
        <h3>Info sull'acquisto</h3>
            <div class="offerte-lamp">
            🔥 <strong>Carta di Credito</strong>
        </div>
        <div class="offerte-lamp">
            🔥 <strong>Contrassegno</strong>
        </div>
          <div class="offerte-lamp">
            🔥 <strong>PayPal</strong>
        </div>
       
        
    </aside>

</div>
   
    <%@ include file="footer.jsp" %>

</div>

<script src="<%= request.getContextPath() %>/scripts/home.js"></script>
</body>
</html>
