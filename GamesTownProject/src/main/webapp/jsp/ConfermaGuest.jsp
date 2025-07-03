<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>Ordine Confermato</title>
 <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/styles/conferma.css">
</head>
<body>
  <div class="main-container">
  <h1>Grazie per il tuo ordine!</h1>
  <p>Numero d'ordine: <strong>${ordineId}</strong></p>
  <p>Ti abbiamo inviato una mail di conferma a ${emailCliente}.</p>
  <div style="text-align: center; margin-top: 15px;">
    <a href="<%= request.getContextPath() %>/HomeServlet" class="home-link">← Torna alla Home</a>
</div>
</div>
</body>
</html>
