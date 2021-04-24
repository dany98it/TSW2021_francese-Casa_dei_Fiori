package model;

import java.sql.Date;

public class Ordine {
	private int id;
	private TipoOrdine tipoOrdine;
	private TipoPagamento tipoPagamento;
	private double prezzoTotale;
	private Date dataOrdine;
	private String user;
	
	public Ordine() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public TipoOrdine getTipoOrdine() {
		return tipoOrdine;
	}

	public void setTipoOrdine(TipoOrdine tipoOrdine) {
		this.tipoOrdine = tipoOrdine;
	}

	public TipoPagamento getTipoPagamento() {
		return tipoPagamento;
	}

	public void setTipoPagamento(TipoPagamento tipoPagamento) {
		this.tipoPagamento = tipoPagamento;
	}

	public double getPrezzoTotale() {
		return prezzoTotale;
	}

	public void setPrezzoTotale(double prezzoTotale) {
		this.prezzoTotale = prezzoTotale;
	}

	public Date getDataOrdine() {
		return dataOrdine;
	}

	public void setDataOrdine(Date dataOrdine) {
		this.dataOrdine = dataOrdine;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}
	
	
}
