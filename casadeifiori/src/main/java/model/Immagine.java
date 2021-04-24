package model;

public class Immagine {
	private int id;
	private String url;
	private String descrizione;
	
	
	public Immagine() {
		super();
	}

	public Immagine(int id, String url, String descrizione) {
		super();
		this.id = id;
		this.url = url;
		this.descrizione = descrizione;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	
}
