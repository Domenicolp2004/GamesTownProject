document.addEventListener("DOMContentLoaded", () => {
    const msg = document.getElementById("ordineSuccesso");
    if (msg && msg.textContent.trim().length > 0) {
        msg.style.display = "block";

        // Nasconde automaticamente dopo 30 secondi il messaggio
        setTimeout(() => {
            msg.style.display = "none";
        }, 30000);
    }
});
