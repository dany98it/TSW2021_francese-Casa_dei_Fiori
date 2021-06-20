package control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ImmagineDAO;
import model.Mostra;
import model.MostraDAO;

/**
 * Servlet implementation class RemuveImg
 */
@WebServlet(name = "remuveImg", urlPatterns = { "/remuveImg" })
public class RemuveImg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemuveImg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession sessione = request.getSession(true);
		int x;
		synchronized (sessione) {
			x=(int) sessione.getAttribute("idItem");
			if(x==0) {
				return;
			}
		}
		int img=Integer.parseInt(request.getParameter("imgId"));
		Mostra mostra=new Mostra(x,img);
		MostraDAO mostraDAO=new MostraDAO();
		ImmagineDAO iDao=new ImmagineDAO();
		try {
			mostraDAO.doDelete(mostra);
			iDao.doDelete(img);
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
