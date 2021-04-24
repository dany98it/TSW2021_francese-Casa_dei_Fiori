package model;

public class Indirizzo {
    private String id;
    private String provincia;
    private String citt�;
    private String cap;
    private String via;
    private String interno;
    private int numero_civico;
     
    public Indirizzo() {
    	super();
    }

	public Indirizzo(String id, String provincia, String citt�, String cap, String via, String interno,
			int numero_civico) {
		super();
		this.id = id;
		this.provincia = provincia;
		this.citt� = citt�;
		this.cap = cap;
		this.via = via;
		this.interno = interno;
		this.numero_civico = numero_civico;
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

	public String getCitt�() {
		return citt�;
	}

	public void setCitt�(String citt�) {
		this.citt� = citt�;
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
		return numero_civico;
	}

	public void setNumero_civico(int numero_civico) {
		this.numero_civico = numero_civico;
	}
    
    
}