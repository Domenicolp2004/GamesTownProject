package model;

import java.sql.*;

import model.Utente;

public class UtenteDAO {

    private Connection conn;

    public UtenteDAO(Connection conn) {
        this.conn = conn;
    }


    public boolean registraUtente(Utente utente) throws SQLException {
    	String sql = "INSERT INTO utente (nome, cognome, email, password) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, utente.getNome());
            stmt.setString(2, utente.getCognome());
            stmt.setString(3, utente.getEmail());

            // Hash della password prima di salvarla
            stmt.setString(4, utente.getPassword());

            int result = stmt.executeUpdate();
            return result > 0;
        }
    }
    public Utente doRetrieveByEmail(String email) throws SQLException {
        String sql = "SELECT * FROM utente WHERE email = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Utente u = new Utente();
                    u.setId(rs.getInt("id"));
                    u.setNome(rs.getString("nome"));
                    u.setCognome(rs.getString("cognome"));
                    u.setEmail(rs.getString("email"));
                    u.setPassword(rs.getString("password"));
                    u.setRuolo(rs.getString("ruolo"));
                    return u;
                }
            }
        }
        return null;
    }
    
    public boolean esisteEmail(String email) throws SQLException {
        String sql = "SELECT 1 FROM utente WHERE email = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();
            }
        }
    }
    
    public boolean updateUtente(Utente utente) throws SQLException {
        String sql = "UPDATE utente SET nome = ?, cognome = ?, email = ?, password = ? WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, utente.getNome());
            stmt.setString(2, utente.getCognome());
            stmt.setString(3, utente.getEmail());
            stmt.setString(4, utente.getPassword());  // Assumendo password già hashata se usi hash
            stmt.setInt(5, utente.getId());
            int result = stmt.executeUpdate();
            return result > 0;
        }
    }
}