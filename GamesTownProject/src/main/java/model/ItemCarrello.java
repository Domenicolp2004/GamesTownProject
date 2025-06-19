package model;

public class ItemCarrello {
    private Videogioco videogioco;
    private int quantita;

    public ItemCarrello(Videogioco videogioco, int quantita) {
        this.videogioco = videogioco;
        this.quantita = quantita;
    }

    public Videogioco getVideogioco() {
        return videogioco;
    }

    public void setVideogioco(Videogioco videogioco) {
        this.videogioco = videogioco;
    }

    public int getQuantita() {
        return quantita;
    }

    public void setQuantita(int quantita) {
        this.quantita = quantita;
    }
  

    public double getTotale() {
        return videogioco.getPrezzo() * quantita;
    }
}
