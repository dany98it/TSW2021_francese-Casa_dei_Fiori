package model;

import java.sql.Date;

public class Consegna {
	private int id;
	private TipoConsegna tipo;
	private String corriere;
	private Date dataConsegna;
	private Date dataInizioSpedizione;
	private Date dataPresuntaConsegna;
	private StatoConsegna stato;
	private int indirizzo;
	private int ordine;
	
	public Consegna() {
		super();
	}
	public Consegna(int id, TipoConsegna tipo, String corriere, Date dataConsegna, Date dataInizioSpedizione,
			Date dataPresuntaConsegna, StatoConsegna stato, int indirizzo, int ordine) {
		super();
		this.id = id;
		this.tipo = tipo;
		this.corriere = corriere;
		this.dataConsegna = dataConsegna;
		this.dataInizioSpedizione = dataInizioSpedizione;
		this.dataPresuntaConsegna = dataPresuntaConsegna;
		this.stato = stato;
		this.indirizzo = indirizzo;
		this.ordine = ordine;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public TipoConsegna getTipo() {
		return tipo;
	}
	public void setTipo(TipoConsegna tipo) {
		this.tipo = tipo;
	}
	public String getCorriere() {
		return corriere;
	}
	public void setCorriere(String corriere) {
		this.corriere = corriere;
	}
	public Date getDataConsegna() {
		return dataConsegna;
	}
	public void setDataConsegna(Date dataConsegna) {
		this.dataConsegna = dataConsegna;
	}
	public Date getDataInizioSpedizione() {
		return dataInizioSpedizione;
	}
	public void setDataInizioSpedizione(Date dataInizioSpedizione) {
		this.dataInizioSpedizione = dataInizioSpedizione;
	}
	public Date getDataPresuntaConsegna() {
		return dataPresuntaConsegna;
	}
	public void setDataPresuntaConsegna(Date dataPresuntaConsegna) {
		this.dataPresuntaConsegna = dataPresuntaConsegna;
	}
	public StatoConsegna getStato() {
		return stato;
	}
	public void setStato(StatoConsegna stato) {
		this.stato = stato;
	}
	public int getIndirizzo() {
		return indirizzo;
	}
	public void setIndirizzo(int indirizzo) {
		this.indirizzo = indirizzo;
	}
	public int getOrdine() {
		return ordine;
	}
	public void setOrdine(int ordine) {
		this.ordine = ordine;
	} 
	
}
