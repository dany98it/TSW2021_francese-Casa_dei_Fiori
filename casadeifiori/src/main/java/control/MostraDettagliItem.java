package control;

import java.io.IOException;
/*import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;*/
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;

import com.mysql.cj.x.protobuf.MysqlxCrud.Collection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Immagine;
import model.ImmagineDAO;
import model.Item;
import model.ItemDAO;
import model.Mostra;
import model.MostraDAO;

/**
 * Servlet implementation class mostraDettagli
 */
@WebServlet("/MostraDettagliItem")
public class MostraDettagliItem extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public MostraDettagliItem() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ItemDAO iDao = new ItemDAO();
		MostraDAO mdao=new MostraDAO();
		ImmagineDAO imDao=new ImmagineDAO();
		String itemID = request.getParameter("itemID");
			try {
				Item i = new Item();
				i = iDao.doRetrieveByKey(Integer.parseInt(itemID));
				LinkedList<Mostra> m=(LinkedList<Mostra>) mdao.doRetrieveAllByItem(Integer.parseInt(itemID));
				ArrayList<String> imgs=new ArrayList<>();
				for (Mostra mostra : m) {
					imgs.add(imDao.doRetrieveByKey(mostra.getImmagine()).getImg());
				}
				request.setAttribute("item", i);
				request.setAttribute("galleriaItem", imgs);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/itemDetailsPage.jsp");
				dispatcher.forward(request, response);
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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
