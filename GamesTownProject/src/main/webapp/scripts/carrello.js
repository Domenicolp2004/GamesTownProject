document.addEventListener("DOMContentLoaded", () => {
    // Eventuale validazione, AJAX per aggiornamento quantità, ecc.

    // Esempio: conferma prima di svuotare carrello
    const svuotaForm = document.querySelector(".form-svuota");
    if (svuotaForm) {
        svuotaForm.addEventListener("submit", e => {
            if (!confirm("Sei sicuro di voler svuotare il carrello?")) {
                e.preventDefault();
            }
        });
    }
});
