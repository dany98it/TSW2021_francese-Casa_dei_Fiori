package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Password;
import model.User;
import model.UserDAO;

/**
 * Servlet implementation class LogInValidate
 */
@WebServlet("/LogInValidate")
public class LogInValidate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogInValidate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username= request.getParameter("username");
		String password= request.getParameter("password");
		User loggedUser = new User();
		UserDAO uDao = new UserDAO();
		if (username.contains("@")&&username.contains(".")) {
			try {
				loggedUser=uDao.doRetrieveBy("email", username);
				if(loggedUser.getEmail()==null) {
					response.getWriter().write("Email non registrata");
					return;
					}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			try {
				loggedUser=uDao.doRetrieveBy("telefono", username);
				if(loggedUser.getTelefono()==null) {
					response.getWriter().write("Numero di telefono non registrato");
					return;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(!Password.isCorrect(password, loggedUser.getPassword())) {
			response.getWriter().write("Password Errata");
			return;
		}
		response.getWriter().write("passed");
	}

}
