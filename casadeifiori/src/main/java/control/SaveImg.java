package control;

import java.io.IOException;
/*import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;*/
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.ImmagineDAO;
import model.ImmagineSave;
import model.Mostra;
import model.MostraDAO;

/**
 * Servlet implementation class SaveImg
 */
@WebServlet(name = "saveImg", urlPatterns = { "/saveImg" })
@MultipartConfig(fileSizeThreshold = 1024*1024*2,
					maxFileSize = 16177216)
public class SaveImg extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public SaveImg() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession sessione = request.getSession(true);
		int x;
		synchronized (sessione) {
			x=(int) sessione.getAttribute("idItem");
			if(x==0) {
				return;
			}
		}
		for (Part part : request.getParts()) {
			ImmagineDAO imgDAO=new ImmagineDAO();
			int y;
			try {
				synchronized (sessione){
					y = imgDAO.doGetMaxItemId()+1;
					ImmagineSave img=new ImmagineSave(y, part.getInputStream(), part.getContentType());
					imgDAO.doSave(new ImmagineSave(y, null, null));	
					imgDAO.doUpdate(img);
					Mostra m=new Mostra();
					MostraDAO mDao=new MostraDAO();
					m.setImmagine(y);
					m.setItem(x);
					mDao.doSave(m);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		response.sendRedirect("/addItemPage.jsp");
	}
}