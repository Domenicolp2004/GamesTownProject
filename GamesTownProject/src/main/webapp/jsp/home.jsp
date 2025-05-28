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
        		
  </div>
    
    <main class="main-content">
<div class="topnav" id="myTopnav">
  <a href="home.jsp" class="active">Home</a>
  <a href="news.jsp">News</a>
  <a href="">Contatti</a>
  <a href="prodotti.jsp">Prodotti</a>
</div>
	
	<form action="#" method="post">
    <input type="search" name="q" placeholder="Cerca qualcosa..." />
    <button type="submit">Cerca</button>
    	<div class="dropdown">
  <button class="dropbtn">Categorie</button>
  <div class="dropdown-content">
    <a href="#">Arcade</a>
    <a href="#">Sparatutto</a>
    <a href="#">Sport</a>
  </div>
  </div>
  </form>

     <div class="titolo">Prodotti in Vendita</div>

  <div class="catalogo">
    <div class="prodotto">
  
      
       <img src="../images/fc.jpg" alt="fifa">
       <div class="nome">FC 25</div>
      <div class="prezzo">€29,99</div>
    </div>


    <div class="prodotto">
  
      
      <img src="../images/cod.jpg" alt="cod">
      <div class="nome">Call of duty Black Ops 6</div>
      <div class="prezzo">€45,00</div>
    </div>

    <div class="prodotto">
           <img src="../images/minecraft.jpg" alt="Minecraft">
      <div class="nome">Minecraft</div>
      <div class="prezzo">€15,50</div>
    </div>
    
       <div class="prodotto">
           <img src="../images/minecraft.jpg" alt="Minecraft">
      <div class="nome">Minecraft</div>
      <div class="prezzo">€15,50</div>
    </div>
    
       <div class="prodotto">
           <img src="../images/minecraft.jpg" alt="Minecraft">
      <div class="nome">Minecraft</div>
      <div class="prezzo">€15,50</div>
    </div>
  </div>
        
        
        
       
             <div class="immag">
             
             <img src="../images/sito.jpg" alt="sito" width=1200px height=auto>
             
             
             </div>
          
        
                 <section class="prodotti">
            <h2>Più venduti </h2>
           
             </section>
             
    </main>
<aside class="news-section">
<div class="loginbar" id="myLoginbar">
                <a href="login.jsp">Login</a>
                <a href="registrazione.jsp">Registrati</a>
  </div>
        
    </aside>

       

</div>


    


</body>
</html>