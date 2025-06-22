document.addEventListener('DOMContentLoaded', () => {
    // Aggiunge conferma prima di eliminare un videogioco
    const deleteLinks = document.querySelectorAll('a.delete-link');

    deleteLinks.forEach(link => {
        link.addEventListener('click', (event) => {
            if (!confirm('Sei sicuro di voler eliminare questo videogioco?')) {
                event.preventDefault();
            }
        });
    });
});