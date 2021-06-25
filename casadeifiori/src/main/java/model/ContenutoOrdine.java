package model;

public class ContenutoOrdine {
	private int ordine;
	private int item;
	private int quantita;
	private int ivaVendita;
	private double prezzoVendita;
	private String nome;
	
	public ContenutoOrdine() {
		super();
	}

	public ContenutoOrdine(int ordine, int item, int quantita, int ivaVendita, double prezzoVendita, String nome) {
		this.ordine = ordine;
		this.item = item;
		this.quantita = quantita;
		this.ivaVendita = ivaVendita;
		this.prezzoVendita = prezzoVendita;
		this.nome = nome;
	}

	public int getOrdine() {
		return ordine;
	}

	public void setOrdine(int ordine) {
		this.ordine = ordine;
	}

	public int getItem() {
		return item;
	}

	public void setItem(int item) {
		this.item = item;
	}

	public int getQuantita() {
		return quantita;
	}

	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}

	public int getIvaVendita() {
		return ivaVendita;
	}

	public void setIvaVendita(int ivaVenditita) {
		this.ivaVendita = ivaVenditita;
	}

	public double getPrezzoVendita() {
		return prezzoVendita;
	}

	public void setPrezzoVendita(double prezzoVendita) {
		this.prezzoVendita = prezzoVendita;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}
	
}