package control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.html2pdf.HtmlConverter;
import com.itextpdf.kernel.pdf.PdfWriter;

import model.ContenutoOrdine;
import model.ContenutoOrdineDao;
import model.Item;
import model.ItemDAO;
import model.Ordine;
import model.OrdineDAO;
import model.User;
import model.UserDAO;

/**
 * Servlet implementation class GenerateFattura
 */
@WebServlet(name = "generateFattura", urlPatterns = { "/generateFattura" })
public class GenerateFattura extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GenerateFattura() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int ordine = Integer.parseInt(request.getParameter("ordine"));
		try {
			Ordine o=new OrdineDAO().doRetrieveByKey(ordine);
		
		String htmltopdf="<html>\r\n"
					+ "<head>\r\n"
					+ "    <style>\r\n"
					+ "        body{\r\n"
					+ "            padding: 20px;\r\n"
					+ "        }\r\n"
					+ "        .info{\r\n"
					+ "            float: right;\r\n"
					+ "            text-align: right;\r\n"
					+ "            border: 2px solid;\r\n"
					+ "            padding-right: 20px;\r\n"
					+ "            width: 50%;\r\n"
					+ "            margin-bottom: 30px;\r\n"
					+ "        }\r\n"
					+ "        table{\r\n"
					+ "            width: 100%;\r\n"
					+ "            margin-top: 30px;\r\n"
					+ "            border: solid 2px;\r\n"
					+ "        }\r\n"
					+ "        .fattura{\r\n"
					+ "            margin: 0;\r\n"
					+ "        }\r\n"
					+ "        td,th{\r\n"
					+ "            padding: 2px;\r\n"
					+ "            text-align: center;\r\n"
					+ "        }\r\n"
					+ "    </style>\r\n"
					+ "</head>\r\n"
					+ "<body>\r\n"
					+ "    <div class=\"info\">\r\n"
					+ "        <h3>Casa dei fiori</h3>\r\n"
					+ "        <p>Corso Vittorio Veneto, 148 <br> </br>\r\n"
					+ "            Grottaminarda (AV) 83035 <br> </br>\r\n"
					+ "            Tel. 0825441420 <br> </br>\r\n"
					+ "        </p>\r\n"
					+ "    </div>\r\n"
					+ "    <table>\r\n"
					+ "        <tr>\r\n"
					+ "            <th>nome</th>\r\n"
					+ "            <th>cognome</th>\r\n"
					+ "            <th>telefono</th>\r\n"
					+ "            <th>email</th>\r\n"
					+ "        </tr>\r\n";
				User u=new UserDAO().doRetrieveByKey(o.getUser());
				htmltopdf+= "<tr>\r\n"
					+ "            <td>"+u.getNome()+"</td>\r\n"
					+ "            <td>"+u.getCognome()+"</td>\r\n"
					+ "            <td>"+u.getTelefono()+"</td>\r\n"
					+ "            <td>"+u.getEmail()+"</td>\r\n"
					+ "        </tr>"
					+ "    </table>\r\n"
					+ "    <table>\r\n"
					+ "        <tr>\r\n"
					+ "            <th rowspan=\"2\"><h2 class=\"fattura\">Fattura</h2></th>\r\n"
					+ "            <th>numero</th>\r\n"
					+ "            <th>data</th>\r\n"
					+ "        </tr>\r\n"
					+ "        <tr>\r\n"
					+ "            <td>"+ordine+"</td>\r\n"
					+ "            <td>"+o.getDataOrdine()+"</td>\r\n"
					+ "        </tr>\r\n"
					+ "    </table>\r\n"
					+ "    <table>\r\n"
					+ "        <tr>\r\n"
					+ "            <th>codice</th>\r\n"
					+ "            <th>Nome</th>\r\n"
					+ "            <th>Qta</th>\r\n"
					+ "            <th>Prezzo</th>\r\n"
					+ "            <th>Importo</th>\r\n"
					+ "            <th>Al.IVA</th>\r\n"
					+ "        </tr>\r\n";
				Collection<ContenutoOrdine> c=new ContenutoOrdineDao().doRetrieveByOrder(ordine);
				double totSenzaIva=0;
				double totIva=0;
				for (ContenutoOrdine contenutoOrdine : c) {
					Item i=new ItemDAO().doRetrieveByKey(contenutoOrdine.getItem());
					htmltopdf+="<tr>\r\n"
							+ "            <td>"+contenutoOrdine.getItem()+"</td>\r\n"
							+ "            <td>"+i.getNome()+"</td>\r\n"
							+ "            <td>"+contenutoOrdine.getQuantita()+"</td>\r\n"
							+ "            <td>"+String.format(Locale.ENGLISH,"%.2f", contenutoOrdine.getQuantita()*contenutoOrdine.getPrezzoVendita())+"€</td>\r\n"
							+ "            <td>"+String.format(Locale.ENGLISH,"%.2f", contenutoOrdine.getPrezzoVendita())+"€</td>\r\n"
							+ "            <td>"+contenutoOrdine.getIvaVendita()+"%</td>\r\n"
							+ "        </tr>";
					totSenzaIva+=contenutoOrdine.getQuantita()*contenutoOrdine.getPrezzoVendita();
					totIva+=contenutoOrdine.getQuantita()*contenutoOrdine.getPrezzoVendita()*contenutoOrdine.getIvaVendita()/100;
				}
				htmltopdf+= "    </table>\r\n"
					+ "    <table>\r\n"
					+ "        <tr>\r\n"
					+ "            <th>Modalità pagamento</th>\r\n"
					+ "            <th>Tot.Imponibile</th>\r\n"
					+ "            <th>Tot.Imposta</th>\r\n"
					+ "            <th>Totale Documento</th>\r\n"
					+ "        </tr>\r\n"
					+ "        <tr>\r\n"
					+ "            <td>"+o.getTipoPagamento().toString()+"</td>\r\n"
					+ "            <td>"+String.format(Locale.ENGLISH,"%.2f", totSenzaIva)+"€</td>\r\n"
					+ "            <td>"+String.format(Locale.ENGLISH,"%.2f", totIva)+"€</td>\r\n"
					+ "            <td>"+String.format(Locale.ENGLISH,"%.2f", o.getPrezzoTotale())+"€</td>\r\n"
					+ "        </tr>\r\n"
					+ "    </table>\r\n"
					+ "</body>\r\n"
					+ "</html>";
			PdfWriter writer=new PdfWriter(response.getOutputStream());
			HtmlConverter.convertToPdf(htmltopdf,writer);
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
