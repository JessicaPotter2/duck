package eb.java.imall.goods;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import eb.java.imall.tablet.addgoodsBean;

/**
 * Servlet implementation class mycollection
 */
@WebServlet("/mycollection")
public class mycollection extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mycollection() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		HttpSession session=request.getSession(false);
		if(session==null){
			request.getRequestDispatcher("index.jsp").forward(request,response);
		}
		Map cart2=(Map)session.getAttribute("cart2");
		addgoodsBean goods=(addgoodsBean)session.getAttribute("AddGoodsToCart");
		if(cart2==null){
			cart2=new HashMap();
			session.setAttribute("cart2", cart2);
		}
		Item cartItem=(Item)cart2.get(goods.getgoodsID());
		if(cartItem!=null){
			cartItem.setQuantity(cartItem.getQuantity()+1);
		}else{
			cart2.put(goods.getgoodsID(),new Item(goods,1));
		}
		request.getRequestDispatcher("shoppingcart/collection.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}

}
