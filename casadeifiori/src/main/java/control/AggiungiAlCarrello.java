package control;

import java.io.IOException;

/*import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
*/
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Carrello;

/**
 * Servlet implementation class AggiungiAlCarrello
 */
@WebServlet("/addCart")
public class AggiungiAlCarrello extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AggiungiAlCarrello() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession sessione = request.getSession(true);
		Carrello cart;
		synchronized(sessione) {
		      cart = (Carrello)sessione.getAttribute("carrello");
		      // I nuovi visitatori ottengono un nuovo carrello
		      // I vistatori che hanno già un carrello lo mantengono
		      if (cart == null) {
		        cart = new Carrello();
		        sessione.setAttribute("carrello", cart);
		      }
		
		String stringItemID = request.getParameter("itemID");
		int itemID = Integer.parseInt(stringItemID);
		if (stringItemID!=null) {
	        String numItemsString =
	          request.getParameter("numItems");
	        if (numItemsString == null) {
	          // se la richiesta specifica un ID e non il numero di item ,
	          // allora il cliente è arrivato qui tramite il bottone "Aggiungi al carrello"
	          // nella pagine del catalogo
	          cart.addItem(itemID);
	        } else {
	          // Se la richiesta specifica un id e un numero di ITEMS allora
	          // il cliente è arrivato qui tramita aggiorna ordine 
	          // dopo aver cambiato il numero di elementi nell'ordine
	          // Se il nuemero di elementi è settato a 0 allora
	          //l'item viene eliminato dal carrello
	          int numItems;
	          try {
	            numItems = Integer.parseInt(numItemsString);
	          } catch(NumberFormatException nfe) {
	            numItems = 1;
	          }
	          cart.setNumOrdered(itemID, numItems);
	        }
	        sessione.setAttribute("carrello", cart);
	      }else {
	    	response.getWriter().append("fail");
	      }
			
	    }
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
