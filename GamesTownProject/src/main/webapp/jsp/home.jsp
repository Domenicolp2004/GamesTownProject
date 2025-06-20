
<%@ page import="java.util.List" %>
<%@ page import="model.Videogioco" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    model.Utente utente = (model.Utente) session.getAttribute("utente");
%>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GamesTown</title>
 	<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/styles/main.css">
    <link href="https://fonts.googleapis.com/css2?family=Titillium+Web:wght@300;600&display=swap" rel="stylesheet">
</head>
<body>

<div class="container">

    <div class="sidebar">
        <img src="../images/logo trasparente 4.png" alt="GamesTown Logo" class="logo">
    </div>

    <main class="main-content">
        <div class="topnav" id="myTopnav">
            <a href="home.jsp" class="active">Home</a>
           <a href="<%= request.getContextPath() %>/NotizieServlet">Notizie</a>
            <a href="">Contatti</a>
            <a href="<%= request.getContextPath() %>/VideogiochiServlet">Videogiochi</a>
        </div>

        <input type="text" placeholder="🔍 Cerca nel negozio" class="search-bar">
        <button type="submit">Cerca</button>
        <div class="dropdown">
            <button class="dropbtn">Categorie</button>
            <div class="dropdown-content">
                <a href="#">Arcade</a>
                <a href="#">Sparatutto</a>
                <a href="#">Sport</a>
            </div>
        </div>

        <% if (utente != null) { %>
            <!-- Contenuto per utenti loggati -->
            Benvenuto/a, <%= utente.getNome() %>!
        <% } else { %>
            <!-- Contenuto per utenti non loggati -->
            <p>Benvenuto, ospite! Loggati o registrati per un'esperienza completa.</p>
        <% } %>

        <div class="titolo">Prodotti in Evidenza</div>

      <div class="catalogo">
    <% 
        List<model.Videogioco> giochi = (List<model.Videogioco>) request.getAttribute("giochi");
        if (giochi != null) {
            for (model.Videogioco gioco : giochi) {
    %>
        <div class="prodotto">
            <h2><%= gioco.getTitolo() %></h2>
                    <img src="<%= request.getContextPath() + "/images/" + gioco.getImmagine() %>" alt="<%= gioco.getTitolo() %>" width="200" />
                
                    <p>Prezzo: <%= gioco.getPrezzo() %> euro</p>
                    <form action="<%= request.getContextPath() %>/AddCarrelloServlet" method="post">
   				 <input type="hidden" name="id" value="<%= gioco.getId() %>"/>
   				 <button type="submit">Aggiungi al carrello</button>
</form>
                    
        </div>
    <% 
            }
        }
    %>
    

</div>
		<!--
		<div class="immag">
		    <img src="../images/sito.jpg" alt="sito">
		</div>
		-->

      <div class="titolo">Più Economici</div>

      <div class="catalogo">
    <% 
        List<model.Videogioco> games = (List<model.Videogioco>) request.getAttribute("eco");
        if (games != null) {
            for (model.Videogioco g : games) {
    %>
        <div class="prodotto">
            <h2><%= g.getTitolo() %></h2>
                    <img src="<%= request.getContextPath() + "/images/" + g.getImmagine() %>" alt="<%= g.getTitolo() %>" width="200" />
                
                    <p>Prezzo: <%= g.getPrezzo() %> euro</p>
                    <form action="<%= request.getContextPath() %>/AddCarrelloServlet" method="post">
   				 <input type="hidden" name="id" value="<%= g.getId() %>"/>
   				 <button type="submit">Aggiungi al carrello</button>
</form>
                    
        </div>
    <% 
            }
        }
    %>
    

</div>
    </main>

    <aside class="news-section">
        <% if (utente == null) { %>
            <!-- Mostro login e registrazione solo se non loggato -->
            <div class="loginbar" id="myLoginbar">
                <button class="lang-btn">🛒</button>
                <button onclick="location.href='login.jsp'" class="btn">Login</button>
                <button onclick="location.href='registrazione.jsp'" class="btn">Registrazione</button>
            </div>
        <% } else { %>
            <!-- Se vuoi, qui puoi mettere contenuti o link per utenti loggati -->
            <p>Area riservata.</p>
         <button onclick="location.href='carrello.jsp'" class="lang-btn">🛒</button>
               <button onclick="location.href='<%= request.getContextPath() %>/LogoutServlet'" class="btn">Logout</button>
        <% } %>
    </aside>
</div>

</body>
</html>