document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('filtroOrdiniForm');
    const inputDa = document.getElementById('da');
    const inputA = document.getElementById('a');
    const inputEmail = document.getElementById('email');

    form.addEventListener('submit', (event) => {
        const dataDa = inputDa.value;
        const dataA = inputA.value;
        const email = inputEmail.value.trim();

        // Controllo che la data "Da" sia <= della data "A"
        if (dataDa && dataA && dataDa > dataA) {
            alert('La data "Da" deve essere precedente o uguale alla data "A".');
            event.preventDefault();
            return;
        }

        // Validazione email (opzionale se inserito)
        if (email && !validateEmail(email)) {
            alert('Inserisci un indirizzo email valido.');
            event.preventDefault();
            return;
        }
    });

    function validateEmail(email) {
        // semplice regex per validare email
        const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return re.test(email.toLowerCase());
    }
});
