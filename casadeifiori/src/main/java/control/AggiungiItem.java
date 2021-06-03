package control;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
/*import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;*/
import java.sql.SQLException;

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
import model.TipoItem;

/**
 * Servlet implementation class AggiungiItem
 */
@WebServlet("/AggiungiItem")
@MultipartConfig
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
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace(response.getWriter());
		}
		try (PrintWriter out = response.getWriter()) {
			Part part = request.getPart("img");
			String fileName=part.getSubmittedFileName();
			String path=getServletContext().getRealPath("/"+"files"+File.separator+fileName);
			InputStream in=part.getInputStream();
			Immagine img=uploadFile(in, path);
			img.setDescrizione(fileName);
			ImmagineDAO imgDAO=new ImmagineDAO();
			imgDAO.doSave(img);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace(response.getWriter());
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/addItemPage.jsp");
		dispatcher.forward(request, response);
	}
	public Immagine uploadFile(InputStream in,String path) throws Exception {
		Immagine img=new Immagine();
		byte[] b=new byte[in.available()];
		in.read();
		img.setImg(img.caricaImmagine(b));
		return img;
	}
}
