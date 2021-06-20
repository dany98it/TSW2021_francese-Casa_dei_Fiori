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
import model.ImmagineDAO;
import model.InclusioneTag;
import model.InclusioneTagDAO;
import model.Item;
import model.ItemDAO;
import model.Mostra;
import model.MostraDAO;
import model.PossedereCaratteristica;
import model.PosserdereCaratteristicaDAO;
import model.PrintCaratteristica;
import model.Tag;
import model.TagDAO;
import model.TipoItem;

/**
 * Servlet implementation class ModificaItems
 */
@WebServlet(description = "modificaItems", urlPatterns = { "/modificaItems" })
public class ModificaItems extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificaItems() {
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
		HttpSession sessione = request.getSession(true);
		InclusioneTagDAO itDao=new InclusioneTagDAO();
		ItemDAO itemDAO= new ItemDAO();
		PosserdereCaratteristicaDAO pCDao=new PosserdereCaratteristicaDAO();
		MostraDAO mdao = new MostraDAO();
		ImmagineDAO imDao = new ImmagineDAO();
		TagDAO tDao=new TagDAO();
		CaratteristicaDAO cDao= new CaratteristicaDAO();
		int x=Integer.parseInt(request.getParameter("id"));
		itDao.doDeleteById(x);
		try {
			pCDao.doDeleteById(x);
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
				Tag t= tDao.doRetrieveByName(string);
				InclusioneTag it=new InclusioneTag(x, t.getId());
				itDao.doSave(it);
			}
			String[] c=request.getParameterValues("caratterisica");
			String[] cVal=request.getParameterValues("caratterisicaValore");
				for (int i = 0; i < cVal.length && i < c.length; i++) {
					Caratteristica crt=cDao.doRetrieveByKey(Integer.parseInt(c[i]));
					PossedereCaratteristica pC=new PossedereCaratteristica(x, crt.getId(), cVal[i]);
					pCDao.doSave(pC);
				}
				LinkedList<Mostra> m = (LinkedList<Mostra>) mdao.doRetrieveAllByItem(x);
				ArrayList<Integer> imgs = new ArrayList<>();
				for (Mostra mostra : m) {
					imgs.add(imDao.doRetrieveByKey(mostra.getImmagine()).getId());
				}
				LinkedList<InclusioneTag> it = (LinkedList<InclusioneTag>) itDao
						.doRetrieveAllByItem(x);
				ArrayList<String> tag1 = new ArrayList<>();
				for (InclusioneTag inclusioneTag : it) {
					tag1.add(tDao.doRetrieveByKey(inclusioneTag.getTag()).getNome());
				}
				LinkedList<PossedereCaratteristica> pc = (LinkedList<PossedereCaratteristica>) pCDao
						.doRetrieveAllByItem(x);
				ArrayList<PrintCaratteristica> c1 = new ArrayList<>();
				for (PossedereCaratteristica possedereCaratteristica : pc) {
					PrintCaratteristica prc = new PrintCaratteristica();
					prc.setNome(cDao.doRetrieveByKey(possedereCaratteristica.getCaratteristica()).getNome());
					prc.setValore(possedereCaratteristica.getValore().split(","));
					c1.add(prc);
				}
				request.setAttribute("item", item);
				request.setAttribute("galleriaItem", imgs);
				request.setAttribute("tag", tag1);
				request.setAttribute("c", c1);
			} catch (Exception e) {
			// TODO Auto-generated catch block
				e.printStackTrace(response.getWriter());
			}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/modificaImage.jsp");
		dispatcher.forward(request, response);
	}

}
