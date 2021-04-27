package model;

import java.sql.SQLException;
import java.util.ArrayList;


public class Carrello {
	private ArrayList<ItemCarrello> itemsOrdinati;

	public Carrello() {
		super();
		this.itemsOrdinati = new ArrayList<ItemCarrello>();
	}

	public ArrayList<ItemCarrello> getItemsOrdinati() {
		return itemsOrdinati;
	}
	
	
	public synchronized void addItem(int itemID) {
	    ItemCarrello order;
	    for(int i=0; i<itemsOrdinati.size(); i++) {
	      order = (ItemCarrello)itemsOrdinati.get(i);
	      if (order.getItem().getId()==itemID) {
	        order.incrementaQuantita();
	        return;
	      }
	    }
	    ItemDAO iDao = new  ItemDAO();
	    
	    ItemCarrello newOrder;
		try {
			newOrder = new ItemCarrello(iDao.doRetrieveByKey(itemID),1);
			System.out.println(newOrder.getItem().getId());
			itemsOrdinati.add(newOrder);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  }
	
	public synchronized void setNumOrdered(int itemID,
            int numOrdered) {
			ItemCarrello order;
				for(int i=0; i<itemsOrdinati.size(); i++) {
						order = (ItemCarrello)itemsOrdinati.get(i);
							if (order.getItem().getId()==itemID) {
								if (numOrdered <= 0) {
									itemsOrdinati.remove(i);
								} else {
									order.setQuantita(numOrdered);
								}
								return;
							}
				}
				ItemDAO iDao = new  ItemDAO();
				
				ItemCarrello newOrder = null;
				try {
					newOrder = new ItemCarrello(iDao.doRetrieveByKey(itemID),numOrdered);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				itemsOrdinati.add(newOrder);
	}
	
	public synchronized double getCostoTotale() {
		double costoTotale = 0.0;
		for (ItemCarrello itemCarrello : itemsOrdinati) {
			costoTotale += itemCarrello.getCostoTotale();
		}
		return costoTotale;
	}

}
