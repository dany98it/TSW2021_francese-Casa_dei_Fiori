package model;


public class ImmagineRetrive {
	private int id;
	private byte[] img;
	private String descrizione;
	
	
	public ImmagineRetrive() {
		super();
	}

	public ImmagineRetrive(int id, byte[] img, String descrizione) {
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

	public byte[] getImg() {
		return img;
	}

	public void setImg(byte[] img) {
		this.img = img;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
}