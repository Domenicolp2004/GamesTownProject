package model;

public class Videogioco {
    private int id;
    private String titolo;
    private String descrizione;
    private String dataUscita;
    private String genere;
    private String piattaforma;
    private String immagine; // path immagine


    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitolo() { return titolo; }
    public void setTitolo(String titolo) { this.titolo = titolo; }

    public String getDescrizione() { return descrizione; }
    public void setDescrizione(String descrizione) { this.descrizione = descrizione; }

    public String getDataUscita() { return dataUscita; }
    public void setDataUscita(String dataUscita) { this.dataUscita = dataUscita; }

    public String getGenere() { return genere; }
    public void setGenere(String genere) { this.genere = genere; }

    public String getPiattaforma() { return piattaforma; }
    public void setPiattaforma(String piattaforma) { this.piattaforma = piattaforma; }

    public String getImmagine() { return immagine; }
    public void setImmagine(String immagine) { this.immagine = immagine; }
}