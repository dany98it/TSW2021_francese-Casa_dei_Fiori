package control;

import java.io.IOException;
/*import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;*/
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CaratteristicaDAO;
import model.ImmagineDAO;
import model.InclusioneTagDAO;
import model.ItemDAO;
import model.Mostra;
import model.MostraDAO;
import model.PosserdereCaratteristicaDAO;
import model.TagDAO;

/**
 * Servlet implementation class Delete
 */
@WebServlet(name = "delete", urlPatterns = { "/delete" })
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Delete() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ItemDAO itemDao = new ItemDAO();
		MostraDAO mosDao = new MostraDAO();
		ImmagineDAO imgDADao = new ImmagineDAO();
		InclusioneTagDAO itagDao = new InclusioneTagDAO();
		PosserdereCaratteristicaDAO pCarDao = new PosserdereCaratteristicaDAO();
		
		int id = Integer.parseInt(request.getParameter("itemID"));
		try {
			
			Collection<Mostra> imgs = mosDao.doRetrieveAllByItem(id);
			mosDao.doDeleteById(id);
			for(Mostra m: imgs) {
				imgDADao.doDelete(m.getImmagine());
			}
			itagDao.doDeleteById(id);
			pCarDao.doDeleteById(id);
			itemDao.doDelete(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/listaItem.jsp");
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