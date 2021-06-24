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
import model.PossedereCaratteristica;
import model.PosserdereCaratteristicaDAO;
import model.TagDAO;
import model.TipoItem;

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
		PosserdereCaratteristicaDAO pcDAO=new PosserdereCaratteristicaDAO();
		TagDAO tagDAO=new TagDAO();
		Gson gson=new Gson();
		String itemq=request.getParameter("itemq");
		String cq=request.getParameter("cq");
		String tagq=request.getParameter("tagq");
		String doveq=request.getParameter("doveq");
		if(itemq!=null&&!itemq.equals("")) {
			try {
				if(doveq!=null&&!doveq.equals("")) {
					int group=Integer.parseInt(doveq.split(":")[0]);
					int id=Integer.parseInt(doveq.split(":")[1]);
					switch (group) {
					case 1:
						response.getWriter().write(gson.toJson(itemDAO.doRetrieveNameByTipo(itemq,TipoItem.values()[id])));
						break;
					case 2:
						response.getWriter().write(gson.toJson(itemDAO.doRetrieveNameByTagID(itemq,id)));
						break;
					case 3:
						response.getWriter().write(gson.toJson(itemDAO.doRetrieveNameByCValue(itemq,id,doveq.split(":")[2])));
						break;
					default:
						response.getWriter().write(gson.toJson(itemDAO.doRetrieveName(itemq)));
						break;
					}
				} else {
					response.getWriter().write(gson.toJson(itemDAO.doRetrieveName(itemq)));
				}
			} catch (IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (cq!=null&&!cq.equals("")) {
			try {
				response.getWriter().write(gson.toJson(cDAO.doRetrieveName(cq)));
			} catch (IOException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if (tagq!=null&&!tagq.equals("")) {
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