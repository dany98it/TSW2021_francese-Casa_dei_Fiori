package control;

import java.io.IOException;
/*import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;*/
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Password;
import model.Permessi;
import model.User;
import model.UserDAO;

/**
 * Servlet implementation class RegistraUtente
 */
@WebServlet("/RegistraUtente")
public class RegistraUtente extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public RegistraUtente() {
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
		HttpSession sessione = request.getSession(true);
		User loggedUser;
			synchronized(sessione) {
		      
				loggedUser = (User)sessione.getAttribute("loggedUser");
				if(loggedUser==null) {
					User user = new User();
					user.setEmail(request.getParameter("email"));
					user.setPassword(Password.criptaPassword(request.getParameter("password")));
					user.setNome(request.getParameter("nome"));
					user.setCognome(request.getParameter("cognome"));
					System.out.println(request.getParameter("dataNascita"));
					user.setdataNascita(Date.valueOf(request.getParameter("dataNascita")));
					user.setPermessi(Permessi.user);
					user.setTelefono(request.getParameter("telefono"));
					UserDAO userdao=new UserDAO();
					try {
						userdao.doSave(user);
					} catch (SQLException e) {
						return;
					}
					sessione.setAttribute("loggedUser", loggedUser);
					response.sendRedirect("index.jsp");
					return;
				}
			}
	}

}