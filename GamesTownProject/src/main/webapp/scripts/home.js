document.addEventListener("DOMContentLoaded", () => {
  const contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));

  const loginBtn = document.getElementById("loginBtn");
  const registrazioneBtn = document.getElementById("registrazioneBtn");
  const carrelloBtn = document.getElementById("carrelloBtn");
  const logoutBtn = document.getElementById("logoutBtn");
  const carrelloBtnUser = document.getElementById("carrelloBtnUser");

  if (loginBtn)
    loginBtn.addEventListener("click", () => {
      window.location.href = `${contextPath}/jsp/login.jsp`;
    });

  if (registrazioneBtn)
    registrazioneBtn.addEventListener("click", () => {
      window.location.href = `${contextPath}/jsp/registrazione.jsp`;
    });

  if (carrelloBtn || carrelloBtnUser) {
    const goToCart = () => {
      window.location.href = `${contextPath}/jsp/carrello.jsp`;
    };
    if (carrelloBtn) carrelloBtn.addEventListener("click", goToCart);
    if (carrelloBtnUser) carrelloBtnUser.addEventListener("click", goToCart);
  }

  if (logoutBtn)
    logoutBtn.addEventListener("click", () => {
      window.location.href = `${contextPath}/LogoutServlet`;
    });
});
