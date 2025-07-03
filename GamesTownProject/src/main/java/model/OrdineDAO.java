package model;

import java.sql.*;
import java.sql.Date;
import java.util.*;
import model.RigaOrdine;

public class OrdineDAO {
    private Connection conn;

    public OrdineDAO(Connection conn) {
        this.conn = conn;
    }

    // Salva un ordine e restituisce l'ID generato
    
    public int salvaOrdine(Ordine ordine) throws SQLException {
        String sql = "INSERT INTO ordine (id_utente, data_ordine, stato, totale, indirizzo_spedizione, metodo_pagamento, nome_cliente, cognome_cliente, email_cliente) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
        	if (ordine.getIdUtente() != null) {
        	    stmt.setInt(1, ordine.getIdUtente());
        	} else {
        	    stmt.setNull(1, Types.INTEGER);
        	}

            stmt.setTimestamp(2, new Timestamp(ordine.getDataOrdine().getTime()));
            stmt.setString(3, ordine.getStato());
            stmt.setDouble(4, ordine.getTotale());
            stmt.setString(5, ordine.getIndirizzoSpedizione());
            stmt.setString(6, ordine.getMetodoPagamento());
            stmt.setString(7, ordine.getNomeCliente());
            stmt.setString(8, ordine.getCognomeCliente());
            stmt.setString(9, ordine.getEmailCliente());

            int rows = stmt.executeUpdate();

            if (rows > 0) {
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        return rs.getInt(1);
                    }
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
    
    public List<Ordine> getOrdiniFiltrati(String clienteFiltro, String dataInizio, String dataFine) throws SQLException {
        List<Ordine> lista = new ArrayList<>();

        StringBuilder sql = new StringBuilder("SELECT * FROM ordine WHERE 1=1 ");
        List<Object> params = new ArrayList<>();

        if (clienteFiltro != null && !clienteFiltro.trim().isEmpty()) {
            sql.append("AND id_utente IN (SELECT id FROM utente WHERE email LIKE ?) ");
            params.add("%" + clienteFiltro.trim() + "%");
        }

        if (dataInizio != null && !dataInizio.trim().isEmpty()) {
            sql.append("AND data_ordine >= ? ");
            params.add(Date.valueOf(dataInizio));
        }

        if (dataFine != null && !dataFine.trim().isEmpty()) {
            sql.append("AND data_ordine <= ? ");
            params.add(Date.valueOf(dataFine));
        }

        sql.append("ORDER BY data_ordine DESC");

        try (PreparedStatement ps = conn.prepareStatement(sql.toString())) {

            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Ordine ordine = new Ordine();

                    ordine.setId(rs.getInt("id"));
                    ordine.setIdUtente(rs.getInt("id_utente"));
                    ordine.setDataOrdine(rs.getDate("data_ordine"));
                    ordine.setStato(rs.getString("stato"));
                    ordine.setTotale(rs.getDouble("totale"));
                    ordine.setIndirizzoSpedizione(rs.getString("indirizzo_spedizione"));
                    ordine.setMetodoPagamento(rs.getString("metodo_pagamento"));
                    // aggiungi altri campi se servono

                    lista.add(ordine);
                }
            }
        }

        return lista;
    }

   
  
}