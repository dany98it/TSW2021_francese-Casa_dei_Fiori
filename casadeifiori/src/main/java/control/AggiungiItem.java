package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Caratteristica;
import model.CaratteristicaDAO;
/*import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;*/
import model.InclusioneTag;
import model.InclusioneTagDAO;
import model.Item;
import model.ItemDAO;
import model.Mostra;
import model.PossedereCaratteristica;
import model.PosserdereCaratteristicaDAO;
import model.PrintCaratteristica;
import model.Tag;
import model.TagDAO;
import model.TipoItem;

/**
 * Servlet implementation class AggiungiItem
 */
@WebServlet("/AggiungiItem")
public class AggiungiItem extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AggiungiItem() {
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
		ItemDAO itemDAO= new ItemDAO();
		int x=0;
		try {
			x = itemDAO.doGetMaxItemId()+1;
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Item item = new Item(x,
				Integer.parseInt(request.getParameter("iva")),
				Double.parseDouble(request.getParameter("price")),
				request.getParameter("description"),
				request.getParameter("name"),
				TipoItem.valueOf(request.getParameter("tipo")),
				Integer.parseInt(request.getParameter("sconto")),
				Integer.parseInt(request.getParameter("quantity")));
		
		synchronized (sessione) {
			sessione.setAttribute("idItem", x);
		}
		try {
			itemDAO.doSave(item);
			String[] tag=request.getParameter("tag").split(",");
			for (String string : tag) {
				TagDAO tDao=new TagDAO();
				try {
					Tag t= tDao.doRetrieveByName(string);
					InclusioneTag it=new InclusioneTag(x, t.getId());
					InclusioneTagDAO itDao=new InclusioneTagDAO();
					itDao.doSave(it);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			String[] c=request.getParameterValues("caratterisica");
			String[] cVal=request.getParameterValues("caratterisicaValore");
			for (int i = 0; i < cVal.length && i < c.length; i++) {
				CaratteristicaDAO cDao=new CaratteristicaDAO();
				Caratteristica crt=cDao.doRetrieveByKey(Integer.parseInt(c[i]));
				PossedereCaratteristica pC=new PossedereCaratteristica(x, crt.getId(), cVal[i]);
				PosserdereCaratteristicaDAO pCDao=new PosserdereCaratteristicaDAO();
				pCDao.doSave(pC);
			}
			LinkedList<InclusioneTag> it = (LinkedList<InclusioneTag>) new InclusioneTagDAO()
					.doRetrieveAllByItem(x);
			ArrayList<String> tag1 = new ArrayList<>();
			for (InclusioneTag inclusioneTag : it) {
				tag1.add(new TagDAO().doRetrieveByKey(inclusioneTag.getTag()).getNome());
			}
			LinkedList<PossedereCaratteristica> pc = (LinkedList<PossedereCaratteristica>) new PosserdereCaratteristicaDAO()
					.doRetrieveAllByItem(x);
			ArrayList<PrintCaratteristica> c1 = new ArrayList<>();
			for (PossedereCaratteristica possedereCaratteristica : pc) {
				PrintCaratteristica prc = new PrintCaratteristica();
				prc.setNome(new CaratteristicaDAO().doRetrieveByKey(possedereCaratteristica.getCaratteristica()).getNome());
				prc.setValore(possedereCaratteristica.getValore().split(","));
				c1.add(prc);
			}
			request.setAttribute("item", item);
			request.setAttribute("tag", tag1);
			request.setAttribute("c", c1);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/addImage.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace(response.getWriter());
		}
	}
}