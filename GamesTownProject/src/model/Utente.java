public class Utente {
    
	private String id;
	private String email;
    private String password;
    private String nome;
    private String cognome;
    private String ruolo;
    private Date data_registrazione;
    
public Utente{
	
}

public Utente(String id, String email, String password, String nome, String cognome, String ruolo, Date data_registrazione)
    this.cognome= cognome;
    this.data_registrazione= data_registrazione;
    this.email= email;
    this.id= id;
    this.nome= nome;
    this.password= password;
    this.ruolo= ruolo;
}

public String getId() {
	return id;
}

public void setId(String id) {
	this.id= id;
}

public String getNome() {
	return nome;
}

public void setNome(String nome) {
	this.nome= nome;
}

public String getCognome() {
	return cognome;
}

public void setCognome(String cognome) {
	this.cognome= cognome;
}
public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email= email;
}
public String gePassword() {
	return password;
}

public void setPassword(String password) {
	this.password= password;
}
public String getRuolo() {
	return ruolo;
}

public void setRuolo(String ruolo) {
	this.ruolo= ruolo;
}
public String getData_registrazione() {
	return data_registrazione;
}

public void setData_registrazione(Date data_registrazione) {
	this.data_registrazione= data_registrazione;
}