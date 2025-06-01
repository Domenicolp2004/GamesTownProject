<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>GamesTown</title>
    <link rel="stylesheet" type="text/css" href="../styles/login.css">
     <link href="https://fonts.googleapis.com/css2?family=Titillium+Web:wght@300;600&display=swap" rel="stylesheet">
</head>
 <body>
<form action="" method="post">
  <div class="container">
    <h1 align="center">Registrati</h1>
 

    <label for="nome"><b>Nome</b></label>
    <input type="text" placeholder="Nome" name="nome" required>
    
     <label for="cognome"><b>Cognome</b></label>
    <input type="text" placeholder="Cognome" name="cognome" required>
    
    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Email" name="email" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Password" name="psw" required>

    <label for="psw-repeat"><b>Ripeti Password</b></label>
    <input type="password" placeholder="Password" name="psw-repeat" required>


    <div class="clearfix">
      <button type="button" class="cancelbtn">Annulla</button>
      <button type="submit" class="signupbtn">Registrati</button>
      <label>
    </label>
    </div>
  </div>
</form>
</body>
</html>