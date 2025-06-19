package model;

public class Notizia {
    private int id;
    private String titolo;
    private String contenuto;
    private String immagine;
    private String dataPubblicazione;

    // Getters
    public int getId() {
        return id;
    }

    public String getTitolo() {
        return titolo;
    }

    public String getContenuto() {
        return contenuto;
    }

    public String getImmagine() {
        return immagine;
    }

    public String getDataPubblicazione() {
        return dataPubblicazione;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }

    public void setContenuto(String contenuto) {
        this.contenuto = contenuto;
    }

    public void setImmagine(String immagine) {
        this.immagine = immagine;
    }

    public void setDataPubblicazione(String dataPubblicazione) {
        this.dataPubblicazione = dataPubblicazione;
    }
}