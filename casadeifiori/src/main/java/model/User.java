package model;

import java.sql.Date;

public class User {
	private int id;
	private String email;
	private String nome;
	private String cognome;
	private Date dataNascita;
	private String telefono;
	private Permessi permessi;
	private String password;
	
	public User() {
		super();
	}
	
	public User(String email, String nome, String cognome, Date dataNascita, String telefono, Permessi permessi,
			String password) {
		super();
		this.email = email;
		this.nome = nome;
		this.cognome = cognome;
		this.dataNascita = dataNascita;
		this.telefono = telefono;
		this.permessi = permessi;
		this.password = password;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	public Date getdataNascita() {
		return dataNascita;
	}
	public void setdataNascita(Date dataNascita) {
		this.dataNascita = dataNascita;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public Permessi getPermessi() {
		return permessi;
	}
	public void setPermessi(Permessi permessi) {
		this.permessi = permessi;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isAdmin() {
		return permessi==Permessi.admin;
	}

}
