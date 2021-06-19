package control;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
/*import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
*/
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Carrello;
import model.ContenutoOrdine;
import model.ContenutoOrdineDao;
import model.Item;
import model.ItemCarrello;
import model.ItemDAO;
import model.Ordine;
import model.OrdineDAO;
import model.TipoOrdine;
import model.TipoPagamento;
import model.User;


/**
 * Servlet implementation class effettuaCheckOut
 */
@WebServlet("/EffettuaCheckOut")
public class EffettuaCheckOut extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public EffettuaCheckOut() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession sessione = request.getSession(true);
		Carrello cart = (Carrello) sessione.getAttribute("carrello");
		ArrayList<ItemCarrello> itemToBuy = cart.getItemsOrdinati();
		ItemDAO iDao = new ItemDAO();
		User user;
		synchronized (sessione) {
			user = (User) sessione.getAttribute("loggedUser");
			if(user == null) {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/logInPage.jsp");
				dispatcher.forward(request, response);
			}
		}
		OrdineDAO oDao = new OrdineDAO();
		int maxId = 0;
		try {
			maxId = oDao.doGetMaxOrderId()+1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		double costoTotale = 0;
		ArrayList<ContenutoOrdine> cos=new ArrayList<ContenutoOrdine>();
		for (ItemCarrello item : itemToBuy) {
			Item itemToUpdate = item.getItem();
			ContenutoOrdine co= new ContenutoOrdine();
			int nuovaQuantita = itemToUpdate.getQuantita() - item.getQuantita();
			if(nuovaQuantita < 0) {
				//lanciare Errore impossibile effettuare acquisto di questo Item
			}
			co.setItem(itemToUpdate.getId());
			co.setIvaVendita(itemToUpdate.getIva());
			co.setPrezzoVendita(itemToUpdate.getPrezzo());
			co.setOrdine(maxId);
			co.setQuantita(item.getQuantita());
			cos.add(co);
			costoTotale += item.getCostoTotale();
			itemToUpdate.setQuantita(nuovaQuantita);
			try {
				iDao.doUpdate(itemToUpdate);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		Ordine o = new Ordine();
		o.setId(maxId);
		o.setUser(user.getId());
		o.setPrezzoTotale(costoTotale);
		o.setTipoPagamento(TipoPagamento.cardaCredito);
		o.setTipoOrdine(TipoOrdine.ritiro);
		o.setDataOrdine(new Timestamp(System.currentTimeMillis()));
		try {
			oDao.doSave(o);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		for (ContenutoOrdine contenutoOrdine : cos) {
			ContenutoOrdineDao coDao = new ContenutoOrdineDao();
			try {
				coDao.doSave(contenutoOrdine);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
		
		
		sessione.setAttribute("carrello", new Carrello());
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/confermaAcquisto.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}