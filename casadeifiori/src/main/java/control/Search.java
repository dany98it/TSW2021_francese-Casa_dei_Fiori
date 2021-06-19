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

import com.google.gson.Gson;

import model.CaratteristicaDAO;
import model.ItemDAO;
import model.TagDAO;

/**
 * Servlet implementation class itemSearch
 */
@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Search() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ItemDAO itemDAO=new ItemDAO();
		CaratteristicaDAO cDAO=new CaratteristicaDAO();
		TagDAO tagDAO=new TagDAO();
		Gson gson=new Gson();
		String itemq=request.getParameter("itemq");
		String cq=request.getParameter("cq");
		String tagq=request.getParameter("tagq");
		if(itemq!=null||itemq=="") {
			try {
				response.getWriter().write(gson.toJson(itemDAO.doRetrieveName(itemq)));
			} catch (IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (cq!=null||cq=="") {
			try {
				response.getWriter().write(gson.toJson(cDAO.doRetrieveName(cq)));
			} catch (IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if (tagq!=null||tagq=="") {
			try {
				response.getWriter().write(gson.toJson(tagDAO.doRetrieveName(tagq)));
			} catch (IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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
