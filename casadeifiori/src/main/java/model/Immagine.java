package model;

public class Immagine<T> {
	private int id;
	private T img;
	private String descrizione;
	
	
	public Immagine() {
		super();
	}

	public Immagine(int id, T img, String descrizione) {
		super();
		this.id = id;
		this.img = img;
		this.descrizione = descrizione;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public T getImg() {
		return img;
	}

	public void setImg(T img) {
		this.img = img;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	
}
