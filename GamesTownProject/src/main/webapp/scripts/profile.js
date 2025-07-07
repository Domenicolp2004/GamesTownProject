document.addEventListener("DOMContentLoaded", () => {
    const emailInput = document.querySelector('input[name="email"]');
    const emailError = document.getElementById('emailExistsError');
    const passwordInput = document.querySelector('input[name="password"]');
    
    const passwordError = document.createElement('span');
    passwordError.style.color = 'red';
    passwordInput.parentNode.insertBefore(passwordError, passwordInput.nextSibling);

    const form = document.querySelector('form');

    // Salviamo l'email attuale dell'utente per confronti
    const originalEmail = emailInput.value;

    emailInput.addEventListener('input', () => {
        const email = emailInput.value.trim();
        emailError.textContent = ""; // reset errore

        if (email === originalEmail) {
            // Email non cambiata, non serve controllo
            return;
        }

        fetch(`CheckEmailServlet?email=${encodeURIComponent(email)}`)
            .then(response => response.json())
            .then(data => {
                if (data.exists) {
                    emailError.textContent = "Questa email è già registrata.";
                }
            })
            .catch(() => {
                // Gestisco eventuali errori di rete
            });
    });

    passwordInput.addEventListener('input', () => {
        const pwd = passwordInput.value;
        if (pwd.length > 0 && pwd.length < 6) {
            passwordError.textContent = "La password deve essere di almeno 6 caratteri.";
        } else {
            passwordError.textContent = "";
        }
    });

    form.addEventListener('submit', (e) => {
        // Blocca submit se email duplicata
        if (emailError.textContent !== "") {
            e.preventDefault();
        }
        // Blocca submit se password errata
        if (passwordError.textContent !== "") {
            e.preventDefault();
        }
    });
});
