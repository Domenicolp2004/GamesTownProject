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

    // Validazione in tempo reale
    nomeInput.addEventListener("input", () => {
        if (nomeInput.value.trim() === "") {
            nomeError.textContent = "Inserisci il nome.";
        } else {
            nomeError.textContent = "";
        }
    });

    cognomeInput.addEventListener("input", () => {
        if (cognomeInput.value.trim() === "") {
            cognomeError.textContent = "Inserisci il cognome.";
        } else {
            cognomeError.textContent = "";
        }
    });

    emailInput.addEventListener("input", () => {
        if (!emailRegex.test(emailInput.value.trim())) {
            emailError.textContent = "Inserisci un'email valida.";
        } else {
            emailError.textContent = "";
        }
    });

    passwordInput.addEventListener("input", () => {
        if (passwordInput.value.length < 6) {
            passwordError.textContent = "La password deve contenere almeno 6 caratteri.";
        } else {
            passwordError.textContent = "";
        }
    });

    // Validazione al submit
    form.addEventListener("submit", (event) => {
        let valid = true;

        if (nomeInput.value.trim() === "") {
            nomeError.textContent = "Inserisci il nome.";
            valid = false;
        } else {
            nomeError.textContent = "";
        }

        if (cognomeInput.value.trim() === "") {
            cognomeError.textContent = "Inserisci il cognome.";
            valid = false;
        } else {
            cognomeError.textContent = "";
        }

        if (!emailRegex.test(emailInput.value.trim())) {
            emailError.textContent = "Inserisci un'email valida.";
            valid = false;
        } else {
            emailError.textContent = "";
        }

        if (passwordInput.value.length < 6) {
            passwordError.textContent = "La password deve contenere almeno 6 caratteri.";
            valid = false;
        } else {
            passwordError.textContent = "";
        }

        if (!valid) {
            event.preventDefault();
        }
    });
});
