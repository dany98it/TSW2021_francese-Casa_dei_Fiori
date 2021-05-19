package control;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
/*import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;*/
import java.util.Collection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Ordine;
import model.OrdineDAO;
import model.User;

/**
 * Servlet implementation class MostraOrdiniEffettuati
 */
@WebServlet("/MostraOrdiniEffettuati")
public class MostraOrdiniEffettuati extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public MostraOrdiniEffettuati() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession sessione = request.getSession(true);
		User loggedUser;
		Collection<Ordine> ordini;
		synchronized (sessione) {
			loggedUser = (User) sessione.getAttribute("loggedUser");
			if(loggedUser==null) {
				response.sendRedirect("logInPage.jsp"); //logged-in page   
			}   
		};
		String date1=request.getParameter("startDate");
		String date2=request.getParameter("endDate");
	
		Timestamp startDate = null,endDate = null;

		if(date1!=null && date1!="") {
			startDate = new Timestamp(Date.valueOf(date1).getTime());
			System.out.println(startDate.toString());
		}
		if(date2!=null && date2!="") {
			endDate = new Timestamp(Date.valueOf(date2).getTime());
			System.out.println(endDate.toString());
		}
		
		OrdineDAO orderDao = new OrdineDAO();
		try {
			if((date1==null || date1=="") || (date2==null || date2=="")) {
				ordini = orderDao.doRetrieveByUser(loggedUser.getId());
				request.setAttribute("ordiniEffettuati", ordini);
			}
			else {
				ordini = orderDao.doRetrieveByDateAndUserID(loggedUser.getId(),startDate,endDate);
				request.setAttribute("ordiniEffettuati", ordini);
			}
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ordersPage.jsp");
			dispatcher.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
