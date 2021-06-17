package control;

import java.io.IOException;
import java.io.OutputStream;
/*import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;*/
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ImmagineDAO;
import model.ImmagineRetrive;

/**
 * Servlet implementation class MostraImg
 */
@WebServlet(name = "mostraImg", urlPatterns = { "/mostraImg" })
public class MostraImg extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public MostraImg() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int imgID = Integer.valueOf(request.getParameter("imgID"));
		ImmagineDAO iDao=new ImmagineDAO();
		try {
			ImmagineRetrive i=iDao.doRetrieveByKey(imgID);
			response.setContentType(i.getDescrizione());
			OutputStream os=response.getOutputStream();
			os.write(i.getImg());
			os.flush();
			os.close();
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
