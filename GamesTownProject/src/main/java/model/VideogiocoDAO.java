package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class VideogiocoDAO {

    private Connection conn;

    public VideogiocoDAO(Connection conn) {
        this.conn = conn;
    }

  
    public List<Videogioco> getAllVideogiochi() throws SQLException {
        List<Videogioco> lista = new ArrayList<>();
        String sql = "SELECT * FROM videogioco WHERE attivo = TRUE";

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
                v.setAttivo(rs.getBoolean("attivo"));
                lista.add(v);
            }
        }

        return lista;
    }

    public List<Videogioco> getVideogiochiByCategoria(int categoriaId) throws SQLException {
        List<Videogioco> lista = new ArrayList<>();

        String sql = "SELECT v.* FROM videogioco v " +
                     "JOIN videogioco_categoria vc ON v.id = vc.id_videogioco " +
                     "WHERE vc.id_categoria = ? AND v.attivo = true";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, categoriaId);
            try (ResultSet rs = ps.executeQuery()) {
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
                    v.setAttivo(rs.getBoolean("attivo"));
                    lista.add(v);
                }
            }
        }

        return lista;
    }
    // Prendi videogame attivo per id (ad esempio per dettagli prodotto)
    public Videogioco getVideogiocoById(int id) throws SQLException {
        String sql = "SELECT * FROM videogioco WHERE id = ? AND attivo = TRUE";
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
                    v.setAttivo(rs.getBoolean("attivo"));
                    return v;
                }
            }
        }
        return null;
    }
    
    public Videogioco getVideogiocoByIdPerUpdate(int id) throws SQLException {
        String sql = "SELECT * FROM videogioco WHERE id = ?";
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
                    v.setAttivo(rs.getBoolean("attivo"));
                    return v;
                }
            }
        }
        return null;
    }

    public List<Videogioco> getPrimiCinqueGiochi() throws SQLException {
        String sql = "SELECT * FROM videogioco WHERE attivo = TRUE LIMIT 5";
        List<Videogioco> lista = new ArrayList<>();

        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Videogioco v = new Videogioco();
                v.setId(rs.getInt("id"));
                v.setTitolo(rs.getString("titolo"));
                v.setPrezzo(rs.getDouble("prezzo"));
                v.setImmagine(rs.getString("immagine"));
                v.setAttivo(rs.getBoolean("attivo"));
                lista.add(v);
            }
        }
        return lista;
    }

    public List<Videogioco> getEconomici() throws SQLException {
        String sql = "SELECT * FROM videogioco WHERE attivo = TRUE ORDER BY prezzo ASC LIMIT 5";
        List<Videogioco> lista = new ArrayList<>();

        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Videogioco v = new Videogioco();
                v.setId(rs.getInt("id"));
                v.setTitolo(rs.getString("titolo"));
                v.setPrezzo(rs.getDouble("prezzo"));
                v.setImmagine(rs.getString("immagine"));
                v.setAttivo(rs.getBoolean("attivo"));
                lista.add(v);
            }
        }
        return lista;
    }
    
    

    // Funzioni per l'amministratore:

    public boolean insertVideogioco(Videogioco v) throws SQLException {
        String sql = "INSERT INTO videogioco (titolo, descrizione, dataUscita, prezzo, genere, piattaforma, immagine, attivo) VALUES (?, ?, ?, ?, ?, ?, ?, TRUE)";
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

    public boolean disableVideogioco(int id) throws SQLException {
        String sql = "UPDATE videogioco SET attivo = FALSE WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        }
    }

}
