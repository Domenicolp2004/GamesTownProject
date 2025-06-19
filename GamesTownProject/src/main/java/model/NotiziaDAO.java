package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NotiziaDAO {

    private Connection conn;

    public NotiziaDAO(Connection conn) {
        this.conn = conn;
    }

   
    public List<Notizia> getUltimeNotizie() throws SQLException {
        List<Notizia> lista = new ArrayList<>();
        String sql = "SELECT * FROM notizia ";

        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Notizia n = new Notizia();
                n.setId(rs.getInt("id"));
                n.setTitolo(rs.getString("titolo"));
                n.setContenuto(rs.getString("contenuto"));
                n.setImmagine(rs.getString("immagine"));
                n.setDataPubblicazione(rs.getString("dataPubblicazione"));
                lista.add(n);
            }
        }

        return lista;
    }
}
