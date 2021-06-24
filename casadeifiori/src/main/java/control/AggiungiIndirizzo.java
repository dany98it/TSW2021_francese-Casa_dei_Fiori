package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Indirizzo;
import model.IndirizzoDAO;
import model.User;

/**
 * Servlet implementation class AggiungiIndirizzo
 */
@WebServlet("/AggiungiIndirizzo")
public class AggiungiIndirizzo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiungiIndirizzo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		IndirizzoDAO iDAO = new IndirizzoDAO();
		HttpSession sessione = request.getSession(true);
		User loggedUser;
		synchronized (sessione) {
			loggedUser = (User) sessione.getAttribute("loggedUser");
			if(loggedUser==null) {
				response.sendRedirect("index.jsp"); //logged-in page   
				return;
			}   
		};
		Indirizzo i = new Indirizzo();
		i.setUser(loggedUser.getId());
		i.setProvincia(request.getParameter("provincia"));
		i.setCittà(request.getParameter("citta"));
		i.setCap(request.getParameter("CAP"));
		i.setVia(request.getParameter("via"));
		i.setInterno(request.getParameter("interno"));
		i.setNumeroCivico(request.getParameter("numeroCivico"));
		i.setNome(request.getParameter("nome"));
		i.setCognome(request.getParameter("Cognome"));
		
		Indirizzo i2 = new Indirizzo(0,
				request.getParameter("provinciaIndirizzo"),
				request.getParameter("cittaIndirizzo"),
				request.getParameter("CAPIndirizzo"),
				request.getParameter("viaIndirizzo"),
				request.getParameter("internoIndirizzo"),
				request.getParameter("numeroCivicoIndirizzo"),
				request.getParameter("nomeIndirizzo"),
				request.getParameter("cognomeIndirizzo"),
				loggedUser.getId());
		try {
			iDAO.doSave(i);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/cartPage.jsp");
			dispatcher.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
			dispatcher.forward(request, response);
			e.printStackTrace();
		}
	}
}
