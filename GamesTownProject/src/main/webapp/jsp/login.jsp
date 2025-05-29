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
    <h1 align="center">Accedi</h1>
    <label for="uname"><b>Username</b></label>
    <input type="text" placeholder="Username" name="uname" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Password" name="psw" required>
    
    <a href="password-dimenticata.jsp" class="forgot-password">Hai dimenticato la password?</a>
        
    <button type="submit">Accedi</button>
    <label>
      <input type="checkbox" checked="checked" name="remember"> Remember me
    </label>
  </div>

</form>

</body>
</html>