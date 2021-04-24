package model;

public class Caratteristica {
	private int id;
	private int nome;
	
	public Caratteristica() {
		super();
	}

	public Caratteristica(int id, int nome) {
		super();
		this.id = id;
		this.nome = nome;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getNome() {
		return nome;
	}

	public void setNome(int nome) {
		this.nome = nome;
	}
	
	
}
