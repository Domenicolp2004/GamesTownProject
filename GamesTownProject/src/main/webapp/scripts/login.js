document.addEventListener("DOMContentLoaded", () => {
    const form = document.getElementById("loginForm");
    const emailInput = document.getElementById("email");
    const passwordInput = document.getElementById("password");
    const emailError = document.getElementById("emailError");
    const passwordError = document.getElementById("passwordError");

    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    // Validazione in tempo reale (quando l’utente cambia qualcosa)
    emailInput.addEventListener("input", () => {
        if (!emailRegex.test(emailInput.value.trim())) {
            emailError.textContent = "Inserisci un'email valida.";
        } else {
            emailError.textContent = "";
        }
    });

    passwordInput.addEventListener("input", () => {
        if (passwordInput.value.trim().length < 6) {
            passwordError.textContent = "La password deve contenere almeno 6 caratteri.";
        } else {
            passwordError.textContent = "";
        }
    });

    // Validazione finale al submit
    form.addEventListener("submit", (event) => {
        let valid = true;

        if (!emailRegex.test(emailInput.value.trim())) {
            emailError.textContent = "Inserisci un'email valida.";
            valid = false;
        } else {
            emailError.textContent = "";
        }

        if (passwordInput.value.trim().length < 6) {
            passwordError.textContent = "La password deve contenere almeno 6 caratteri.";
            valid = false;
        } else {
            passwordError.textContent = "";
        }

        if (!valid) {
            event.preventDefault(); // Blocca l’invio della form
        }
    });
});