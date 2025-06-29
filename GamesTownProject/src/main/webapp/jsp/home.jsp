<%@ page import="java.util.List" %>
<%@ page import="model.Videogioco" %>
<%@ page import="model.Notizia" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
     <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/styles/carosello.css">
    <link href="https://fonts.googleapis.com/css2?family=Titillium+Web:wght@300;600&display=swap" rel="stylesheet">
</head>
<body>

<div class="container">

    <div class="sidebar">
        <img src="<%= request.getContextPath() %>/images/logotrasparente4.png" alt="GamesTown Logo" class="logo">
    </div>

    <main class="main-content">
         <header>
        <div class="topnav" id="myTopnav">
            <a href="home.jsp" class="active">Home</a>
            <a href="<%= request.getContextPath() %>/NotizieServlet">Notizie</a>
	   		<a href="<%= request.getContextPath() %>/VideogiochiServlet">Videogiochi</a>
	   		 <div class="dropdown">
            <button class="dropbtn">Categorie</button>
            <div class="dropdown-content">
                <a href="#">Arcade</a>
                <a href="#">Sparatutto</a>
                <a href="#">Sport</a>
            </div>
        </div>
        </div>

       

       
          </header>

        <% if (utente != null) { %>
            <p>Benvenuto/a, <%= utente.getNome() %>!</p>
        <% } else { %>
            <p>Benvenuto, ospite! Loggati o registrati per un'esperienza completa.</p>
		        <% } %>
			<!--	<div class="titolo">Notizie in Evidenza</div>
		<div class="notizie-evidenza">
		    <div class="notizia">
		        <img src="<%= request.getContextPath() %>/images/notizia1.jpg" alt="Notizia 1">
		        <h3>Titolo Notizia 1</h3>
		    </div>
		    <div class="notizia">
		        <img src="<%= request.getContextPath() %>/images/notizia2.jpg" alt="Notizia 2">
		        <h3>Titolo Notizia 2</h3>
		    </div>
		    <div class="notizia">
		        <img src="<%= request.getContextPath() %>/images/notizia3.jpg" alt="Notizia 3">
		        <h3>Titolo Notizia 3</h3>
		    </div>
		</div>-->
		
        
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
            <div class="loginbar" id="myLoginbar">
                <button id="carrelloBtn" class="lang-btn">🛒</button>
                <button id="loginBtn" class="btn">Login</button>
                <button id="registrazioneBtn" class="btn">Registrazione</button>
            </div>
        <% } else { %>
            <p>Area riservata.</p>
            <button id="carrelloBtnUser" class="lang-btn">🛒</button>
            <button id="logoutBtn" class="btn">Logout</button>
        <% } %>
    </aside>
<%@ include file="footer.jsp" %>
</div>

<!-- Script JS separato -->
<script src="<%= request.getContextPath() %>/scripts/home.js"></script>
</body>
</html>
