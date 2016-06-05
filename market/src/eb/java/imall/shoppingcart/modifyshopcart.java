package eb.java.imall.shoppingcart;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import eb.java.imall.tablet.addgoodsBean;

/**
 * Servlet implementation class modifyshopcart
 */
@WebServlet("/modifyshopcart")
public class modifyshopcart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modifyshopcart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 int quantity=Integer.parseInt(request.getParameter("quantity"));
			response.setContentType("text/html;charset=utf-8");
			HttpSession session=request.getSession(false);
			if(session==null){
				request.getRequestDispatcher("index.jsp").forward(request,response);
			}		
			Map cart=(Map)session.getAttribute("cart");
			addgoodsBean goods=(addgoodsBean)session.getAttribute("ModifyGoodsToCart");
			CartItemBean cartItem=(CartItemBean)cart.get(goods.getgoodsID());
			if(cartItem!=null){
				cartItem.setQuantity(quantity);
			}
			request.getRequestDispatcher("shoppingcart/shopCart.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}

}
