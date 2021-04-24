package model;

public class Contenuto {
	private int ordine;
	private int item;
	private int quantita;
	private int ivaVenditita;
	private double prezzoVendita;
	
	public Contenuto() {
		super();
	}

	public Contenuto(int ordine, int item, int quantita, int ivaVenditita, double prezzoVendita) {
		super();
		this.ordine = ordine;
		this.item = item;
		this.quantita = quantita;
		this.ivaVenditita = ivaVenditita;
		this.prezzoVendita = prezzoVendita;
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

	public int getIvaVenditita() {
		return ivaVenditita;
	}

	public void setIvaVenditita(int ivaVenditita) {
		this.ivaVenditita = ivaVenditita;
	}

	public double getPrezzoVendita() {
		return prezzoVendita;
	}

	public void setPrezzoVendita(double prezzoVendita) {
		this.prezzoVendita = prezzoVendita;
	}
	
	
}
