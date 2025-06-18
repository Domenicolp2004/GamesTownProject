package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.Videogioco;

public class VideogiocoDAO {

    private Connection conn;

    public VideogiocoDAO(Connection conn) {
        this.conn = conn;
    }
public List<Videogioco> getAllVideogiochi() throws SQLException {
    List<Videogioco> lista = new ArrayList<>();
    String sql = "SELECT * FROM videogioco";
    try (PreparedStatement stmt = conn.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery()) {
        while (rs.next()) {
            Videogioco v = new Videogioco();
            v.setId(rs.getInt("id"));
            v.setTitolo(rs.getString("titolo"));
            v.setDescrizione(rs.getString("descrizione"));
            v.setPrezzo(rs.getDouble("prezzo"));
            v.setDataUscita(rs.getString("dataUscita"));
            v.setGenere(rs.getString("genere"));
            v.setPiattaforma(rs.getString("piattaforma"));
            v.setImmagine(rs.getString("immagine"));
            lista.add(v);
        }
    }
    return lista;
}

public Videogioco getVideogiocoById(int id) throws SQLException {
    String sql = "SELECT * FROM videogioco WHERE id=?";
    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setInt(1, id);
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                Videogioco v = new Videogioco();
                v.setId(rs.getInt("id"));
                v.setTitolo(rs.getString("titolo"));
                v.setDescrizione(rs.getString("descrizione"));
                v.setPrezzo(rs.getDouble("prezzo"));
                v.setDataUscita(rs.getString("dataUscita"));
                v.setGenere(rs.getString("genere"));
                v.setPiattaforma(rs.getString("piattaforma"));
                v.setImmagine(rs.getString("immagine"));
                return v;
            }
        }
    }
    return null;
}

public List<Videogioco> getVideogiochiInHome() throws SQLException {
    List<Videogioco> lista = new ArrayList<>();
    String sql = "SELECT * FROM videogioco ORDER BY dataUscita DESC LIMIT 5";

    try (PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery()) {
           while (rs.next()) {
               Videogioco v = new Videogioco();
               v.setId(rs.getInt("id"));
               v.setTitolo(rs.getString("titolo"));
               v.setDescrizione(rs.getString("descrizione"));
               v.setPrezzo(rs.getDouble("prezzo"));
               v.setDataUscita(rs.getString("dataUscita"));
               v.setGenere(rs.getString("genere"));
               v.setPiattaforma(rs.getString("piattaforma"));
               v.setImmagine(rs.getString("immagine"));
               lista.add(v);
           }
       }
       return lista;
   }

//funzioni per l'amministratore:

public boolean insertVideogioco(Videogioco v) throws SQLException {
    String sql = "INSERT INTO videogioco (titolo, descrizione, dataUscita, prezzo, genere, piattaforma, immagine) VALUES (?, ?, ?, ?, ?, ?)";
    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, v.getTitolo());
        stmt.setString(2, v.getDescrizione());
        stmt.setString(3, v.getDataUscita());
        stmt.setDouble(4, v.getPrezzo());
        stmt.setString(5, v.getGenere());
        stmt.setString(6, v.getPiattaforma());
        stmt.setString(7, v.getImmagine());
        return stmt.executeUpdate() > 0;
    }
}
public boolean updateVideogioco(Videogioco v) throws SQLException {
    String sql = "UPDATE videogioco SET titolo=?, descrizione=?, dataUscita=?, prezzo=?, genere=?, piattaforma=?, immagine=? WHERE id=?";
    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setString(1, v.getTitolo());
        stmt.setString(2, v.getDescrizione());
        stmt.setString(3, v.getDataUscita());
        stmt.setDouble(4, v.getPrezzo());
        stmt.setString(5, v.getGenere());
        stmt.setString(6, v.getPiattaforma());
        stmt.setString(7, v.getImmagine());
        stmt.setInt(8, v.getId());
        return stmt.executeUpdate() > 0;
    }
}
public boolean deleteVideogioco(int id) throws SQLException {
    String sql = "DELETE FROM videogioco WHERE id = ?";
    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
        stmt.setInt(1, id);
        return stmt.executeUpdate() > 0;
    }
}
}