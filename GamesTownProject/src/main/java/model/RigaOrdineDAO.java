package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RigaOrdineDAO {
    private Connection conn;

    public RigaOrdineDAO(Connection conn) {
        this.conn = conn;
    }

    // Recupera tutte le righe di un ordine dato l'id ordine
    public List<RigaOrdine> getRighePerOrdine(int idOrdine) throws SQLException {
        List<RigaOrdine> righe = new ArrayList<>();
        String sql = "SELECT * FROM rigaordine WHERE id_ordine = ?";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idOrdine);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    RigaOrdine riga = new RigaOrdine();
                    riga.setId(rs.getInt("id"));
                    riga.setIdOrdine(rs.getInt("id_ordine"));
                    riga.setIdProdotto(rs.getInt("id_videogioco"));
                    riga.setQuantita(rs.getInt("quantita"));
                    riga.setPrezzoUnitario(rs.getDouble("prezzo_unitario"));
                    righe.add(riga);
                }
            }
        }
        return righe;
    }

    // Metodo per salvare una riga ordine (opzionale)
    public void salvaRigaOrdine(RigaOrdine riga) throws SQLException {
        String sql = "INSERT INTO rigaordine (id_ordine, id_videogioco, quantita, prezzo_unitario) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, riga.getIdOrdine());
            stmt.setInt(2, riga.getIdProdotto());
            stmt.setInt(3, riga.getQuantita());
            stmt.setDouble(4, riga.getPrezzoUnitario());
            stmt.executeUpdate();
        }
    }
}
