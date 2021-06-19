package model;

import java.util.Locale;

public class Item {
	private int id;
	private int iva;
	private double prezzo;
	private String descrizione;
	private String nome;
	private TipoItem tipo;
	private int sconto;
	private int quantita;
	
	public Item() {
		super();
	}
	
	public Item(int id, int iva, double prezzo, String descrizione, String nome, TipoItem tipo, int sconto, int quantita) {
		super();
		this.id = id;
		this.iva = iva;
		this.prezzo = prezzo;
		this.descrizione = descrizione;
		this.nome = nome;
		this.tipo = tipo;
		this.sconto = sconto;
		this.quantita = quantita;
	}
	
	public int getQuantita() {
		return quantita;
	}

	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIva() {
		return iva;
	}
	public void setIva(int iva) {
		this.iva = iva;
	}
	public double getPrezzo() {
		return prezzo;
	}
	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}
	public String getDescrizione() {
		return descrizione;
	}
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public TipoItem getTipo() {
		return tipo;
	}
	public void setTipo(TipoItem tipo) {
		this.tipo = tipo;
	}
	public int getSconto() {
		return sconto;
	}
	public void setSconto(int sconto) {
		this.sconto = sconto;
	}
	public double calcolaPrezzo() {
		double costo=prezzo+(prezzo*iva/100);
		costo=costo-(costo*sconto/100);
		return Double.parseDouble(String.format(Locale.ENGLISH,"%.2f", costo));
	}
}