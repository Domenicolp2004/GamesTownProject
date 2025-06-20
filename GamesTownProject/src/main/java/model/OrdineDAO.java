package model;

import java.sql.*;
import java.util.*;
import model.RigaOrdine;

public class OrdineDAO {
    private Connection conn;

    public OrdineDAO(Connection conn) {
        this.conn = conn;
    }

    // Salva un ordine e restituisce l'ID generato
    
    public int salvaOrdine(Ordine ordine) throws SQLException {
    	System.out.println("Sto salvando ordine per utente ID: " + ordine.getIdUtente());
    	String sql = "INSERT INTO ordine (id_utente, data_ordine, stato, totale, indirizzo_spedizione, metodo_pagamento) " +
                     "VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, ordine.getIdUtente());
            stmt.setDate(2, new java.sql.Date(ordine.getDataOrdine().getTime()));
            stmt.setString(3, ordine.getStato());
            stmt.setDouble(4, ordine.getTotale());
            stmt.setString(5, ordine.getIndirizzoSpedizione());
            stmt.setString(6, ordine.getMetodoPagamento());

            stmt.executeUpdate();

            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                }
            }
        }
        return -1;
    }
    public Ordine getOrdineById(int idOrdine) throws SQLException {
        String sql = "SELECT * FROM ordine WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idOrdine);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Ordine ordine = new Ordine();
                    ordine.setId(rs.getInt("id"));
                    ordine.setIdUtente(rs.getInt("id_utente"));
                    ordine.setDataOrdine(rs.getTimestamp("data_ordine"));
                    ordine.setTotale(rs.getDouble("totale"));
                    ordine.setStato(rs.getString("stato"));
                    ordine.setIndirizzoSpedizione(rs.getString("indirizzo_spedizione"));
                    ordine.setMetodoPagamento(rs.getString("metodo_pagamento"));
                    return ordine;
                } else {
                    return null;
                }
            }
        }
    }

    
    public List<Ordine> getOrdiniByUtente(int idUtente) throws SQLException {
        List<Ordine> ordini = new ArrayList<>();

        String sql = "SELECT * FROM ordine WHERE id_utente = ? ORDER BY data_ordine DESC";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idUtente);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Ordine ordine = new Ordine();
                    ordine.setId(rs.getInt("id"));
                    ordine.setIdUtente(rs.getInt("id_utente"));
                    ordine.setDataOrdine(rs.getTimestamp("data_ordine"));
                    ordine.setTotale(rs.getDouble("totale"));
                    ordine.setStato(rs.getString("stato"));
                    ordine.setIndirizzoSpedizione(rs.getString("indirizzo_spedizione"));
                    ordine.setMetodoPagamento(rs.getString("metodo_pagamento"));

                    ordini.add(ordine);
                }
            }
        }

        return ordini;
    }

   
  
}