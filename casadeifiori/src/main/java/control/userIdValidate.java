package control;

import java.io.IOException;
/*import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;*/
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.UserDAO;



/**
 * Servlet implementation class userIdValidate
 */
@WebServlet("/userIdValidate")
public class userIdValidate extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public userIdValidate() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String telefono= request.getParameter("telefono");
		String email= request.getParameter("email");
		UserDAO uDao = new UserDAO();
		int error=0;
		try {
			if(uDao.doRetrieveBy("telefono", telefono).getTelefono()!=null) {
				error=1;
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			if(uDao.doRetrieveBy("email", email).getEmail()!=null) {
				error+=2;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
			System.out.println(error);
		
			switch (error) {
			case 1:
				response.getWriter().write("Numero di telefono gi&agrave; in uso");
				break;
			case 2:
				response.getWriter().write("Email gi&agrave; in uso");
				break;
			case 3:
				response.getWriter().write("Email e numero di telefono gi&agrave; in uso");
				break;

			default:
				response.getWriter().write("unico");
				break;
			}
			
	}

}