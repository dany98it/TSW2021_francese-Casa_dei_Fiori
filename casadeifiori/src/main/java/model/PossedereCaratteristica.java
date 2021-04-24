package model;

public class PossedereCaratteristica {
	private int item;
	private int caratteristica;
	private String valore;
		
	public PossedereCaratteristica() {
		super();
	}

	public PossedereCaratteristica(int item, int caratteristica, String valore) {
		super();
		this.item = item;
		this.caratteristica = caratteristica;
		this.valore = valore;
	}

	public int getItem() {
		return item;
	}

	public void setItem(int item) {
		this.item = item;
	}

	public int getCaratteristica() {
		return caratteristica;
	}

	public void setCaratteristica(int caratteristica) {
		this.caratteristica = caratteristica;
	}

	public String getValore() {
		return valore;
	}

	public void setValore(String valore) {
		this.valore = valore;
	}
	
	
}
