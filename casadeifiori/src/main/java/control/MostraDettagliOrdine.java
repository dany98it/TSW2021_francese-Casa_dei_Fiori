package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ContenutoOrdine;
import model.ContenutoOrdineDao;
import model.Ordine;
import model.OrdineDAO;
import model.User;

/**
 * Servlet implementation class MostraDettagliOrdine
 */
@WebServlet("/MostraDettagliOrdine")
public class MostraDettagliOrdine extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public MostraDettagliOrdine() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession Sessione = request.getSession(true);
		User user;
		String orderID = request.getParameter("orderID");
		
		synchronized (Sessione) {
			user = (User) Sessione.getAttribute("loggedUser");
			if(user==null) {
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/logInPage.jsp");
				dispatcher.forward(request, response);
			}
		}
		ContenutoOrdineDao coDao = new ContenutoOrdineDao();
		Collection<ContenutoOrdine> contOrd = null;
		try {
			contOrd = coDao.doRetrieveByOrder(Integer.parseInt(orderID));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		OrdineDAO oDao = new OrdineDAO();
		Ordine ordine = null;
		try {
			ordine = oDao.doRetrieveByKey(Integer.parseInt(orderID));
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("contenutoOrdine", contOrd);
		request.setAttribute("ordine", ordine);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/orderDetailsPage.jsp");
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
