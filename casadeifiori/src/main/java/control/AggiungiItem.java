package control;

import java.io.IOException;
import java.io.InputStream;
/*import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;*/
import java.sql.SQLException;
import java.util.Base64;

import com.mysql.cj.jdbc.Blob;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.Immagine;
import model.ImmagineDAO;
import model.Item;
import model.ItemDAO;
import model.Mostra;
import model.MostraDAO;
import model.TipoItem;

/**
 * Servlet implementation class AggiungiItem
 */
@WebServlet("/AggiungiItem")
@MultipartConfig(fileSizeThreshold = 1024*1024*2,
		maxFileSize = 1024*1024*10,
		maxRequestSize = 1024*10241*50)
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
		
	
		try {
			itemDAO.doSave(item);
			for (Part part : request.getParts()) {
				if (part.getSubmittedFileName()!=null&&!part.getSubmittedFileName().equals("")) {
					ImmagineDAO imgDAO=new ImmagineDAO();
					int y=imgDAO.doGetMaxItemId()+1;
					byte[] imageBytes = part.getInputStream().readAllBytes();
					String imageStr = Base64.getEncoder().encodeToString(imageBytes);
					Immagine img=new Immagine(y, imageStr, part.getSubmittedFileName());
					imgDAO.doSave(img);
					Mostra m=new Mostra();
					MostraDAO mDao=new MostraDAO();
					m.setImmagine(y);
					m.setItem(x);
					mDao.doSave(m);
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace(response.getWriter());
		}
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/addItemPage.jsp");
		dispatcher.forward(request, response);
	}
}
