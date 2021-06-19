package model;

import java.io.InputStream;

public class ImmagineSave {
	private int id;
	private InputStream img;
	private String descrizione;
	
	
	public ImmagineSave() {
		super();
	}

	public ImmagineSave(int id, InputStream img, String descrizione) {
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

	public InputStream getImg() {
		return img;
	}

	public void setImg(InputStream img) {
		this.img = img;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	
}