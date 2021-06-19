package model;

public class Mostra{
    private int item;
    private int immagine;
 
    public Mostra() {
    	super();
    }

	public Mostra(int item, int immagine) {
		super();
		this.item = item;
		this.immagine = immagine;
	}

	public int getItem() {
		return item;
	}

	public void setItem(int item) {
		this.item = item;
	}

	public int getImmagine() {
		return immagine;
	}

	public void setImmagine(int immagine) {
		this.immagine = immagine;
	}
    
}