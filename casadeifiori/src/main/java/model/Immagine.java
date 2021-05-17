package model;

public class Immagine {
	private int id;
	private String imgBase64;
	private String descrizione;
	
	
	public Immagine() {
		super();
	}

	public Immagine(int id, String imgBase64, String descrizione) {
		super();
		this.id = id;
		this.imgBase64 = imgBase64;
		this.descrizione = descrizione;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getImgBase64() {
		return imgBase64;
	}

	public void setImgBase64(String imgBase64) {
		this.imgBase64 = imgBase64;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	
}
