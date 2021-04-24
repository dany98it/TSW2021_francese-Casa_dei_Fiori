package model;

public class Tag {
	private int id;
	private String name;
	private String descrizione;
	
	public Tag() {
		super();
	}

	public Tag(int id, String name, String descrizione) {
		super();
		this.id = id;
		this.name = name;
		this.descrizione = descrizione;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescrizione() {
		return descrizione;
	}
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	
	
}
