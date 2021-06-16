package control;

import java.io.IOException;
/*import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;*/
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Immagine;
import model.ImmagineDAO;
import model.Mostra;
import model.MostraDAO;

/**
 * Servlet implementation class SaveImg
 */
@WebServlet(name = "saveImg", urlPatterns = { "/saveImg" })
@MultipartConfig(fileSizeThreshold = 1024*1024*2,
					maxFileSize = 1024*1024*10,
					maxRequestSize = 1024*10241*50)
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
		int x=10;
		for (Part part : request.getParts()) {
			ImmagineDAO imgDAO=new ImmagineDAO();
			int y;
			try {
				y = imgDAO.doGetMaxItemId()+1;
				Immagine img=new Immagine(y, part.getInputStream(), part.getSubmittedFileName());
				imgDAO.doSave(img);
				Mostra m=new Mostra();
				MostraDAO mDao=new MostraDAO();
				m.setImmagine(y);
				m.setItem(x);
				mDao.doSave(m);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
