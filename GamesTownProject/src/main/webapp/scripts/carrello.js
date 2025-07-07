document.addEventListener("DOMContentLoaded", () => {
    // Funzione per creare/mostrare messaggi di errore nel DOM
    function showError(input, message) {
        let errorElem = input.nextElementSibling;
        if (!errorElem || !errorElem.classList.contains('error-message')) {
            errorElem = document.createElement('div');
            errorElem.className = 'error-message';
            input.parentNode.insertBefore(errorElem, input.nextSibling);
        }
        errorElem.textContent = message;
        input.classList.add('input-error');
    }

    // Funzione per rimuovere messaggi di errore
    function clearError(input) {
        let errorElem = input.nextElementSibling;
        if (errorElem && errorElem.classList.contains('error-message')) {
            errorElem.textContent = '';
        }
        input.classList.remove('input-error');
    }

    // Validazione quantità (number tra 1 e 99)
    function validateQuantity(input) {
        const val = input.value.trim();
        if (!/^\d+$/.test(val)) {
            showError(input, 'La quantità deve essere un numero intero.');
            return false;
        }
        const num = parseInt(val, 10);
        if (num < 1 || num > 99) {
            showError(input, 'La quantità deve essere compresa tra 1 e 99.');
            return false;
        }
        clearError(input);
        return true;
    }

    // Validazione indirizzo (non vuoto e almeno 5 caratteri, esempio)
    function validateIndirizzo(input) {
        const val = input.value.trim();
        if (val.length < 5) {
            showError(input, 'Inserisci un indirizzo di spedizione valido (minimo 5 caratteri).');
            return false;
        }
        clearError(input);
        return true;
    }

    // Validazione metodo pagamento (deve essere selezionato)
    function validateMetodoPagamento(select) {
        if (select.value === '') {
            showError(select, 'Seleziona un metodo di pagamento.');
            return false;
        }
        clearError(select);
        return true;
    }

    // --- VALIDAZIONE FORM QUANTITÀ ---
    document.querySelectorAll(".form-quantita").forEach(form => {
        const inputQuantita = form.querySelector('input[name="quantita"]');

        // Validazione al change
        inputQuantita.addEventListener('change', () => {
            validateQuantity(inputQuantita);
        });

        // Validazione al submit del form
        form.addEventListener('submit', e => {
            if (!validateQuantity(inputQuantita)) {
                e.preventDefault();
            }
        });
    });

    // VALIDAZIONE FORM ORDINE 
    const formOrdine = document.querySelector(".form-ordine");
    if (formOrdine) {
        const inputIndirizzo = formOrdine.querySelector('#indirizzoSpedizione');
        const selectPagamento = formOrdine.querySelector('#metodoPagamento');

        // Validazioni al change
        inputIndirizzo.addEventListener('change', () => {
            validateIndirizzo(inputIndirizzo);
        });

        selectPagamento.addEventListener('change', () => {
            validateMetodoPagamento(selectPagamento);
        });

        // Validazione al submit form
        formOrdine.addEventListener('submit', e => {
            let validIndirizzo = validateIndirizzo(inputIndirizzo);
            let validPagamento = validateMetodoPagamento(selectPagamento);

            if (!validIndirizzo || !validPagamento) {
                e.preventDefault();
            }
        });
    }

    // --- Conferma prima di svuotare carrello ---
    const svuotaForm = document.querySelector(".form-svuota");
    if (svuotaForm) {
        svuotaForm.addEventListener("submit", e => {
            if (!confirm("Sei sicuro di voler svuotare il carrello?")) {
                e.preventDefault();
            }
        });
    }
});
