package control;

import java.io.IOException;
/*import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;*/
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
				response.setHeader("error","Email gi� in uso");
				response.sendError(519,"Email gi� in uso");
				
				break;
			case 2:
				response.setHeader("error","Numero di telefono gi� in uso");
				response.sendError(519,"Numero di telefono gi� in uso");
				break;
			case 3:
				response.setHeader("error", "Email e numero di telefono gi� in uso");
				response.sendError(519,"Email e numero di telefono gi� in uso");
				break;

			default:
				response.sendError(200);
				break;
			}
			
	}

}