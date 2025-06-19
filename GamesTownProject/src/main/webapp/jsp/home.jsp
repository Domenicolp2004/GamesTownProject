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
    <link rel="stylesheet" type="text/css" href="../styles/main.css">
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

        <div class="titolo">Prodotti in Vendita</div>

        <div class="catalogo">
            <div class="prodotto">
                <img src="../images/fc.jpg" alt="fifa">
                <div class="nome">FC 25 Standard Edition</div>
                <div class="prezzo">€59,99</div>
            </div>

            <div class="prodotto">
                <img src="../images/cod.jpg" alt="cod">
                <div class="nome">Call of duty Black Ops 6</div>
                <div class="prezzo">€69,90</div>
            </div>

            <div class="prodotto">
                <img src="../images/minecraft.jpg" alt="Minecraft">
                <div class="nome">Minecraft</div>
                <div class="prezzo">€15,50</div>
            </div>

            <div class="prodotto">
                <img src="../images/nba.jpg" alt="Nba 2K25 Standard Edition">
                <div class="nome">Nba 2K25 Standard Edition</div>
                <div class="prezzo">€69,90</div>
            </div>

            <div class="prodotto">
                <img src="../images/f1-25.jpg" alt="F1 25 Iconic Edition">
                <div class="nome">F1 25 Iconic Edition</div>
                <div class="prezzo">€89,90</div>
            </div>
        </div>

        <div class="immag">
            <img src="../images/sito.jpg" alt="sito" width="1200px" height="auto">
        </div>

        <section class="prodotti">
            <h2> Più venduti </h2>
        </section>
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
         <button class="lang-btn">🛒</button>
               <button onclick="location.href='<%= request.getContextPath() %>/LogoutServlet'" class="btn">Logout</button>
        <% } %>
    </aside>
</div>

</body>
</html>