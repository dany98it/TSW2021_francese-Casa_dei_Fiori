package model;

public class ItemCarrello {
	private Item item;
	private int quantita;
	
	
	public ItemCarrello(Item item, int quantita) {
		super();
		this.item = item;
		this.quantita = quantita;
	}
	
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	public int getQuantita() {
		return quantita;
	}
	public void setQuantita(int quantita) {
		this.quantita = quantita;
	}
	
	public void incrementaQuantita() {
		this.quantita++;
	}
	
	public void cancellaOrdine() {
		setQuantita(0);
	}
	
	public double getCostoTotale() {
		return(this.item.getPrezzo()*quantita);
	}
}
