<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GamesTown</title>
    <link rel="stylesheet" type="text/css" href="../styles/main.css">
</head>
 <body>
<div class="container">

   <div class="sidebar">
        <img src="../images/logo trasparente 4.png" alt="GamesTown Logo" class="logo">
        		<div class="dropdown">
  <button class="dropbtn">Categorie</button>
  <div class="dropdown-content">
    <a href="#">Arcade</a>
    <a href="#">Sparatutto</a>
    <a href="#">Sport</a>
  </div>
  </div>
  </div>
    
    <main class="main-content">
<div class="topnav" id="myTopnav">
  <a href="home.jsp" class="active">Home</a>
  <a href="news.jsp">News</a>
  <a href="">Contatti</a>
  <a href="prodotti.jsp">Prodotti</a>
<div class="loginbar" id="myLoginbar">
                <a href="login.jsp">Login</a>
                <a href="registrazione.jsp">Registrati</a>
  </div>
</div>
	<form action="#" method="post">
    <input type="search" name="q" placeholder="Cerca qualcosa..." />
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
<aside class="news-section">
        <h3>Ultime News</h3>
        <ul>
            <li>GTA VI trailer rilasciato</li> 
            <li>Elden Ring DLC in arrivo</li> 
            <li>Nintendo annuncia console</li> 
            <li>Xbox acquisisce studio</li> 
            <li>PlayStation 6 leak</li> 
            <li>Steam fest autunno</li> 
            <li>Cyberpunk 2077 aggiornamento</li>
            <li>The Sims 5 gameplay</li> 
            <li>Fortnite mappa classica</li> 
            <li>Call of Duty gratis</li>
            <li>Zelda riceve spin-off</li> 
            <li>Hollow Knight: Silksong rimandato</li>
            <li>Among Us nuova modalità</li>
            <li>Assassin’s Creed in Giappone</li>
            <li>LoL aggiornamento massiccio</li>
            <li>Minecraft 300 milioni di vendite</li>
            <li>Valorant su console</li>
            <li>FIFA cambia nome</li> 
            <li>Baldur's Gate 3 premi</li> 
            <li>Silent Hill remake gameplay</li>
        </ul>
    </aside>

       

</div>


    


</body>
</html>