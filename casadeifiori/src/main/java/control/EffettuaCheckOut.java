package control;

import java.io.IOException;
import java.sql.SQLException;
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
import model.Item;
import model.ItemCarrello;
import model.ItemDAO;


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
		HttpSession sessione = request.getSession(false);
		Carrello cart = (Carrello) sessione.getAttribute("carrello");
		ArrayList<ItemCarrello> itemToBuy = cart.getItemsOrdinati();
		ItemDAO iDao = new ItemDAO();
		for (ItemCarrello item : itemToBuy) {
			Item itemToUpdate = item.getItem();
			int nuovaQuantita = itemToUpdate.getQuantita() - item.getQuantita();
			if(nuovaQuantita < 0) {
				//lanciare Errore impossibile effettuare acquisto di questo Item
			}
			itemToUpdate.setQuantita(nuovaQuantita);
			try {
				iDao.doUpdate(itemToUpdate);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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
