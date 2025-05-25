<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
    <title>GamesTown</title>
    <link rel="stylesheet" type="text/css" href="../styles/main.css">
</head>
 <body>
<div class="container">

    <aside class="sidebar">
        <img src="../images/logo trasparente 4.png" alt="GamesTown Logo" class="logo">
        <nav class="nav">
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <li><a href="prodotti.jsp">Prodotti</a></li>
                <li><a href="news.jsp">News</a></li>
                <li><a href="login.jsp">Login</a></li>
                <li><a href="contatti.jsp">Contatti</a></li>
            </ul>
        </nav>
    </aside>

    <!-- MAIN CONTENT -->
    <main class="main-content">

 <form action="/cerca" method="get">
    <input type="search" name="cerca" placeholder="Cerca prodotto">
    <button type="submit">Cerca</button>
  </form>

        <!-- PRODOTTI: portfolio style -->
        <section class="prodotti">
            <h2>In evidenza</h2>
            <div class="product-grid">
                <div class="product-item">
                    <img src="../images/fc.jpg" alt="fifa">
                    <p>FC25</p>
                </div>
                <div class="product-item">
                    <img src="../images/cod.jpg" alt="cod">
                    <p>Call of Duty</p>
                </div>
                <div class="product-item">
                    <img src="../images/minecraft.jpg" alt="Minecraft">
                    <p>Minecraft</p>
                </div>
       		<div class="product-item">
                    <img src="../images/lego.jpg" alt="lego">
                    <p>Lego Horizons</p>
                </div>
          
             </div>
             </section>
                 
                 <section class="prodotti">
            <h2>Più venduti </h2>
            <div class="product-grid">
                <div class="product-item">
                    <img src="../images/game1.jpg" alt="Game 1">
                    <p>FC25</p>
                </div>
                <div class="product-item">
                    <img src="../images/game2.jpg" alt="Game 2">
                    <p>Minecraft</p>
                </div>
                <div class="product-item">
                    <img src="../images/game3.jpg" alt="Game 3">
                    <p>Call Of Duty</p>
                </div>
                <div class="product-item">
                    <img src="../images/game1.jpg" alt="Game 4">
                    <p>FC25</p>
                </div>
                <div class="product-item">
                    <img src="../images/game2.jpg" alt="Game 5">
                    <p>Minecraft</p>
                </div>
                <div class="product-item">
                    <img src="../images/game3.jpg" alt="Game 6">
                    <p>Call Of Duty</p>
                </div>
                  <div class="product-item">
                    <img src="../images/game1.jpg" alt="Game 1">
                    <p>FC25</p>
                </div>
                <div class="product-item">
                    <img src="../images/game2.jpg" alt="Game 2">
                    <p>Minecraft</p>
                </div>
                <div class="product-item">
                    <img src="../images/game3.jpg" alt="Game 3">
                    <p>Call Of Duty</p>
                </div>
             </div>
             </section>
             
    </main>

    <!-- COLONNA DESTRA: News -->
    <aside class="news-section">
       <img src="../images/cartello.png" alt="News" class="news" width=100%>
        <ul>
            <li>Nuove uscite PS5!</li>
            <li>Nuove uscite XBOX</li>
            <li>Titoli più popolari</li>
        </ul>
    </aside>

</div>
</body>
</html>