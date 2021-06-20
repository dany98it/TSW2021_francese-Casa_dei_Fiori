package model;

import java.util.ArrayList;

public class PrintCaratteristica {
	private String nome;
	private String[] valore;
	public PrintCaratteristica() {
		// TODO Auto-generated constructor stub
	}
	
	public PrintCaratteristica(String nome, String[] valore) {
		super();
		this.nome = nome;
		this.valore = valore;
	}

	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String[] getValore() {
		return valore;
	}
	public void setValore(String[] valore) {
		this.valore = valore;
	}
}
