document.addEventListener('DOMContentLoaded', () => {
    const deleteLinks = document.querySelectorAll('button.delete-link');

    deleteLinks.forEach(button => {
        button.addEventListener('click', (event) => {
            if (!confirm('Sei sicuro di voler cancellare questo videogioco?')) {
                event.preventDefault();
            }
        });
    });
});

