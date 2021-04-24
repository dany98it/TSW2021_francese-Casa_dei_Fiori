package model;

public class Indirizzo {
    private String id;
    private String provincia;
    private String città;
    private String cap;
    private String via;
    private String interno;
    private int numeroCivico;
     
    public Indirizzo() {
    	super();
    }

	public Indirizzo(String id, String provincia, String città, String cap, String via, String interno,
			int numeroCivico) {
		super();
		this.id = id;
		this.provincia = provincia;
		this.città = città;
		this.cap = cap;
		this.via = via;
		this.interno = interno;
		this.numeroCivico = numeroCivico;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	public String getCittà() {
		return città;
	}

	public void setCittà(String città) {
		this.città = città;
	}

	public String getCap() {
		return cap;
	}

	public void setCap(String cap) {
		this.cap = cap;
	}

	public String getVia() {
		return via;
	}

	public void setVia(String via) {
		this.via = via;
	}

	public String getInterno() {
		return interno;
	}

	public void setInterno(String interno) {
		this.interno = interno;
	}

	public int getNumero_civico() {
		return numeroCivico;
	}

	public void setNumero_civico(int numeroCivico) {
		this.numeroCivico = numeroCivico;
	}
    
    
}