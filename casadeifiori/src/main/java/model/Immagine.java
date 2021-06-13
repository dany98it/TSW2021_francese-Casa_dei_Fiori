package model;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

public class Immagine {
	private int id;
	private InputStream img;
	private String descrizione;
	
	
	public Immagine() {
		super();
	}

	public Immagine(int id, InputStream img, String descrizione) {
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
	public String imgConvert() throws IOException {
		byte[] imageBytes = null;
		img.read(imageBytes);
		String imageStr = Base64.getEncoder().encodeToString(imageBytes);
		return imageStr;
	}
}