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

import model.Item;
import model.ItemDAO;
import model.TipoItem;


/**
 * Servlet implementation class MostraItem
 */
@WebServlet("/MostraItem")
public class MostraItem extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public MostraItem() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ItemDAO itemDao = new ItemDAO();
		String cerca=request.getParameter("cerca");
		String doveq=request.getParameter("doveq");
		if (cerca==null||cerca.equals("")) {
			try {
				Collection<Item> itemsCollection = itemDao.doRetrieveAll(null);
				request.setAttribute("itemsCollection", itemsCollection);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			if(doveq!=null&&!doveq.equals("")) {
				int group=Integer.parseInt(doveq.split(":")[0]);
				int id=Integer.parseInt(doveq.split(":")[1]);
				switch (group) {
				case 1:
					try {
						Collection<Item> itemsCollection = itemDao.doRetrieveByNameAndTipo(cerca,TipoItem.values()[id]);
						request.setAttribute("itemsCollection", itemsCollection);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					break;
				case 2:
					break;
				case 3:
					break;
				default:
					try {
						Collection<Item> itemsCollection = itemDao.doRetrieveByName(cerca);
						request.setAttribute("itemsCollection", itemsCollection);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					break;
				}
			}else {
				try {
					Collection<Item> itemsCollection = itemDao.doRetrieveByName(cerca);
					request.setAttribute("itemsCollection", itemsCollection);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
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