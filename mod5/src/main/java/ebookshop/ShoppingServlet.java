package ebookshop;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;
import ebookshop.Book;

/**
 * Servlet implementation class ShoppingServlet
 */
@WebServlet("/eshop")
public class ShoppingServlet extends HttpServlet {
	
	/** 
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		@SuppressWarnings("unchecked")
		Vector<Book> shoplist = (Vector<Book>)session.getAttribute("ebookshop.cart");
		String do_this = request.getParameter("do_this");
		
		// If it is the first time, initialize the list of books, which in real life would be stored in a database on disk
		if (do_this == null) {
			Vector<String> blist = new Vector<String>();
			blist.addElement("Learn HTML5 and JavaScript for iOS. Scott Preston $39.99");
			blist.addElement("Java 7 for Absolute Beginners. Jay Bryant $39.99");
			blist.addElement("Beginning Android 4. Livingston $39.99");
			blist.addElement("Pro Spatial with SQL Server 2012. Alastair Aitchison $59.99");
			blist.addElement("Beginning Database Design. Clare Churcher $34.99");
			session.setAttribute("ebookshop.list", blist);
			ServletContext sc = request.getSession().getServletContext();
			RequestDispatcher rd = sc.getRequestDispatcher("/");
			rd.forward(request, response);
		}
		else {
			// If it is not the first request, it can only be a checkout request or a request to manipulate the list of books being ordered
			if (do_this.equals("checkout")) {
				float dollars = 0;
				int books = 0;
				for (Book aBook: shoplist) {
					float price = aBook.getPrice();
					int qty = aBook.getQuantity();
					dollars += price * qty;
					books += qty;
				}
				request.setAttribute("dollars", dollars+"");
				request.setAttribute("books", books+"");
				ServletContext sc = request.getSession().getServletContext();
				RequestDispatcher rd = sc.getRequestDispatcher("/Checkout.jsp");
				rd.forward(request, response);
			} //if (..checkout..
			
			// Not a checkout request - Manipulate the list of books
			else {
				if (do_this.equals("remove")) {
					String pos = request.getParameter("position");
					shoplist.removeElementAt (Integer.parseInt(pos));
				}
				else if (do_this.equals("add")) {
					boolean found = false;
					Book aBook = getBook(request);
					if (shoplist == null) { // the shopping cart is empty
						shoplist = new Vector<Book>();
						shoplist.addElement(aBook);
					}
					else { // update the #copies if the book is already there
						for (int i = 0; i < shoplist.size() && !found; i++) {
							Book b = (Book)shoplist.elementAt(i);
							if (b.getTitle().equals(aBook.getTitle())) {
								b.setQuantity(b.getQuantity() + aBook.getQuantity());
								shoplist.setElementAt(b,  i);
								found = true;
							}
						} // for (i..
						if (!found) { // if it is a new book => Add it to the shoplist
							shoplist.addElement(aBook);
						}
					} // if (shoplist == null) .. else ..
				} // if (..add..
				
				//Save the updated list of books and return to the home page
				session.setAttribute("ebookshop.cart", shoplist);
				ServletContext sc = getServletContext();
				RequestDispatcher rd = sc.getRequestDispatcher("/");
				rd.forward(request, response);
			} // if (..checkout..else
		} // if (do_this..
	} // doPost
	
	private Book getBook(HttpServletRequest request) {
		String myBook = request.getParameter("book");
		int n = myBook.indexOf('$');
		String title = myBook.substring(0, n);
		String price = myBook.substring(n+1);
		String qty = request.getParameter("qty");
		return new Book(title, Float.parseFloat(price), Integer.parseInt(qty));
	}
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoppingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}





}
