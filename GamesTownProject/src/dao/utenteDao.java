public class UtenteDAO {
    public boolean login(String email, String password) throws SQLException {
        Connection con = ConnessioneDB.getConnection();
        String query = "SELECT * FROM utenti WHERE email=? AND password=?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, email);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();
        return rs.next(); // true se utente trovato
    }