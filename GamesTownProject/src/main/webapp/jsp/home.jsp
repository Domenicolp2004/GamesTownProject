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

       

</div>


    


</body>
</html>