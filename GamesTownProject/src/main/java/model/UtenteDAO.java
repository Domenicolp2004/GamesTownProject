package model;

import java.sql.*;

import model.Utente;

public class UtenteDAO {

    private Connection conn;

    public UtenteDAO(Connection conn) {
        this.conn = conn;
    }

    public Utente loginUtente(String email, String password) throws SQLException {
        String sql = "SELECT * FROM utente WHERE email = ? AND password = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.setString(2, password); 

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Utente u = new Utente();
                u.setId(rs.getInt("id"));
                u.setNome(rs.getString("nome"));
                u.setCognome(rs.getString("cognome"));
                u.setEmail(rs.getString("email"));
                u.setPassword(rs.getString("password"));
                u.setRuolo(rs.getString("ruolo"));
                return u;
            } else {
                return null;
            }
        }
    }

    public boolean registraUtente(Utente utente) throws SQLException {
        String sql = "INSERT INTO utente (nome, cognome, email, password, ruolo) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, utente.getNome());
            stmt.setString(2, utente.getCognome());
            stmt.setString(3, utente.getEmail());
            stmt.setString(4, utente.getPassword()); 
            stmt.setString(5, utente.getRuolo());

            int result = stmt.executeUpdate();
            return result > 0;
        }
    }
}