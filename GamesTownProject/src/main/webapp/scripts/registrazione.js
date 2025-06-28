document.addEventListener("DOMContentLoaded", () => {
  const form = document.getElementById("registrationForm");
  const nomeInput = document.getElementById("nome");
  const cognomeInput = document.getElementById("cognome");
  const emailInput = document.getElementById("email");
  const passwordInput = document.getElementById("password");

  const nomeError = document.getElementById("nomeError");
  const cognomeError = document.getElementById("cognomeError");
  const emailError = document.getElementById("emailError");
  const passwordError = document.getElementById("passwordError");

  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  const contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));

  let emailRegistrata = false; 

  // Validazione in tempo reale
  nomeInput.addEventListener("input", () => {
    nomeError.textContent = nomeInput.value.trim() === "" ? "Inserisci il nome." : "";
  });

  cognomeInput.addEventListener("input", () => {
    cognomeError.textContent = cognomeInput.value.trim() === "" ? "Inserisci il cognome." : "";
  });

  emailInput.addEventListener("input", () => {
    const val = emailInput.value.trim();

    if (!val.includes("@")) {
      emailError.textContent = "Inserisci un'email valida.";
      return;
    }

    if (!emailRegex.test(val)) {
      emailError.textContent = "";
      return;
    }

    // Verifica AJAX
    fetch(`${contextPath}/CheckEmailServlet?email=${encodeURIComponent(val)}`)
      .then(response => response.json())
      .then(data => {
        emailRegistrata = data.exists;
        emailError.textContent = data.exists ? "Email già registrata." : "";
      })
      .catch(() => {
        emailError.textContent = "Errore nella verifica email.";
      });
  });

  passwordInput.addEventListener("input", () => {
    passwordError.textContent = passwordInput.value.length < 6
      ? "La password deve contenere almeno 6 caratteri."
      : "";
  });

  // Validazione al submit
  form.addEventListener("submit", (event) => {
    let valid = true;

    if (nomeInput.value.trim() === "") {
      nomeError.textContent = "Inserisci il nome.";
      valid = false;
    }

    if (cognomeInput.value.trim() === "") {
      cognomeError.textContent = "Inserisci il cognome.";
      valid = false;
    }

    if (!emailRegex.test(emailInput.value.trim())) {
      emailError.textContent = "Inserisci un'email valida.";
      valid = false;
    } else if (emailRegistrata) {
      emailError.textContent = "Email già registrata.";
      valid = false;
    }

    if (passwordInput.value.length < 6) {
      passwordError.textContent = "La password deve contenere almeno 6 caratteri.";
      valid = false;
    }

    if (!valid) {
      event.preventDefault();
    }
  });
});
