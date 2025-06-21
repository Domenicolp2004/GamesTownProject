document.addEventListener("DOMContentLoaded", () => {
    const formButtons = document.querySelectorAll(".form-carrello");

    formButtons.forEach(form => {
        form.addEventListener("submit", (event) => {
            const titolo = form.closest(".prodotto").querySelector("h2").textContent;
            alert(`"${titolo}" aggiunto al carrello!`);
            // Se vuoi evitare il submit reale per test o AJAX, puoi usare: event.preventDefault();
        });
    });
});
