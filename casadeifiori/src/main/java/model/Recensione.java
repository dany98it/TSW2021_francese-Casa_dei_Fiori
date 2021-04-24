package model;

public class Recensione {
    private String user;
    private int item;
    private String titolo;
    private String commento;
    private int valutazione;
    
	public Recensione() {
		super();
	}

	public Recensione(String user, int item, String titolo, String commento, int valutazione) {
		super();
		this.user = user;
		this.item = item;
		this.titolo = titolo;
		this.commento = commento;
		this.valutazione = valutazione;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public int getItem() {
		return item;
	}

	public void setItem(int item) {
		this.item = item;
	}

	public String getTitolo() {
		return titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}

	public String getCommento() {
		return commento;
	}

	public void setCommento(String commento) {
		this.commento = commento;
	}

	public int getValutazione() {
		return valutazione;
	}

	public void setValutazione(int valutazione) {
		this.valutazione = valutazione;
	}

    
} 

