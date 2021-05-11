package control;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
/*import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
*/
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Carrello;
import model.ContenutoOrdine;
import model.ContenutoOrdineDao;
import model.Item;
import model.ItemCarrello;
import model.ItemDAO;
import model.Ordine;
import model.OrdineDAO;
import model.User;


/**
 * Servlet implementation class effettuaCheckOut
 */
@WebServlet("/effettuaCheckOut")
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

		double costoTotale = 0;
		
		for (ItemCarrello item : itemToBuy) {
			Item itemToUpdate = item.getItem();
			ContenutoOrdineDao coDao = new ContenutoOrdineDao();
			ContenutoOrdine co= new ContenutoOrdine();
			int nuovaQuantita = itemToUpdate.getQuantita() - item.getQuantita();
			if(nuovaQuantita < 0) {
				//lanciare Errore impossibile effettuare acquisto di questo Item
			}
			costoTotale += item.getCostoTotale();
			itemToUpdate.setQuantita(nuovaQuantita);
			try {
				iDao.doUpdate(itemToUpdate);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		OrdineDAO oDao = new OrdineDAO();
		int maxId = 0;
		try {
			maxId = oDao.doGetMaxOrderId();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(maxId);
			
		Ordine o = new Ordine();
		o.setId(maxId);
		o.setUser(String.valueOf(user.getId()));
		o.setPrezzoTotale(costoTotale);
		//o.setTipoPagamento();
		//o.setTipoOrdine();
		o.setDataOrdine(new Timestamp(System.currentTimeMillis()));
			
		
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
