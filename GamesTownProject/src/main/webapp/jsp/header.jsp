<%
    model.Utente utente = (model.Utente) session.getAttribute("utente");
%>

<header>
    <div class="topnav">
        <!-- SINISTRA: Home, Notizie, Videogiochi, Categorie -->
        <div class="topnav-left">
            <a href="<%= request.getContextPath() %>/HomeServlet" class="active">Home</a>
            <a href="<%= request.getContextPath() %>/NotizieServlet">Notizie</a>
            <a href="<%= request.getContextPath() %>/VideogiochiServlet">Videogiochi</a>
            <div class="dropdown">
                <a class="dropbtn">Contatti</a>
                <div class="dropdown-content">
                    <a href="https://www.instagram.com/"> Instagram <img src="<%= request.getContextPath() %>/images/instagram.svg"></a>
                    <a href="https://it-it.facebook.com/">Facebook <img src="<%= request.getContextPath() %>/images/facebook.svg"></a>
                </div>
            </div>
        </div>
            <div class="topnav-center">
            <a href="<%= request.getContextPath() %>/HomeServlet">
                <img src="<%= request.getContextPath() %>/images/logotrasparente4.png" alt="GameTown Logo" class="logo" />
            </a>
        </div>

        <!-- DESTRA: login, logout, carrello -->
        <div class="topnav-right">
            <% if (utente == null) { %>
                <a href="<%= request.getContextPath() %>/jsp/carrello.jsp" id="carrelloLink"> <img src="<%= request.getContextPath() %>/images/carr.png"></a>
                <a href="<%= request.getContextPath() %>/jsp/login.jsp">Login</a>
                <a href="<%= request.getContextPath() %>/jsp/registrazione.jsp">Registrazione</a>
            <% } else { %>
                <span class="saluto">Ciao, <%= utente.getNome() %>!</span>
                <a href="<%= request.getContextPath() %>/jsp/carrello.jsp" id="carrelloLinkUser"><img src="<%= request.getContextPath() %>/images/carr.png"></a>
               <a href="<%= request.getContextPath() %>/jsp/profile.jsp">Modifica Profilo</a>
              <a href="<%= request.getContextPath() %>/ListaOrdiniServlet">I miei ordini</a>
               <a href="<%= request.getContextPath() %>/LogoutServlet">Logout</a>
            <% } %>
        </div>
    </div>
</header>
