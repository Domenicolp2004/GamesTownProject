document.addEventListener("DOMContentLoaded", () => {
    // Gestione aggiunta al carrello
    const formButtons = document.querySelectorAll(".form-carrello");

    formButtons.forEach(form => {
        form.addEventListener("submit", (event) => {
            const titolo = form.closest(".prodotto").querySelector("h2").textContent;
            alert(`"${titolo}" aggiunto al carrello!`);
        });
    });

    // Gestione filtro categoria con JS + validazione
    const categoriaSelect = document.getElementById("categoriaSelect");
    const form = categoriaSelect.closest("form");

    // Span per messaggi di errore, subito dopo select
    let errorSpan = document.createElement("span");
    errorSpan.style.color = "red";
    categoriaSelect.parentNode.insertBefore(errorSpan, categoriaSelect.nextSibling);

    // Validazione on change
    categoriaSelect.addEventListener("change", () => {
        if (categoriaSelect.value !== "" && isNaN(parseInt(categoriaSelect.value))) {
            errorSpan.textContent = "Seleziona una categoria valida.";
        } else {
            errorSpan.textContent = "";
            form.submit(); // submit automatico solo se valido
        }
    });

    // Validazione on submit
    form.addEventListener("submit", (event) => {
        if (categoriaSelect.value !== "" && isNaN(parseInt(categoriaSelect.value))) {
            errorSpan.textContent = "Seleziona una categoria valida prima di inviare.";
            event.preventDefault();
        }
    });
});