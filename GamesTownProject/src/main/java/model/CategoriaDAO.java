package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoriaDAO {

    private Connection conn;

    public CategoriaDAO(Connection conn) {
        this.conn = conn;
    }

    // Ottieni tutte le categorie
    public List<Categoria> getAllCategorie() throws SQLException {
        List<Categoria> listaCategorie = new ArrayList<>();
        String sql = "SELECT * FROM categoria ORDER BY nome";

        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Categoria c = new Categoria();
                c.setId(rs.getInt("id"));
                c.setNome(rs.getString("nome"));
                listaCategorie.add(c);
            }
        }
        return listaCategorie;
    }

    // Ottieni categoria per ID
    public Categoria getCategoriaById(int id) throws SQLException {
        Categoria categoria = null;
        String sql = "SELECT * FROM categoria WHERE id = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    categoria = new Categoria();
                    categoria.setId(rs.getInt("id"));
                    categoria.setNome(rs.getString("nome"));
                }
            }
        }
        return categoria;
    }
}
