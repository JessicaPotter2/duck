package eb.java.imall.shoppingcart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import eb.java.imall.tablet.addgoodsBean;
import eb.java.imall.tablet.goodsOrder;

/**
 * Servlet implementation class orderservlet
 */
@WebServlet("/orderservlet")
public class orderservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public orderservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out= response.getWriter();
		HttpSession session=request.getSession();
		Map cart=(Map)session.getAttribute("cart");
		if(cart==null || cart.size()==0)
		{
			out.println("<p>您的购物车中没有物品</p>");
		}else {
			request.setCharacterEncoding("utf-8");
			String customerName=request.getParameter("name");
			String address=request.getParameter("addr");
			String ZipCode=request.getParameter("zip");
			String telePhone=request.getParameter("tel");
			String notice=request.getParameter("notice");
			String ispaied=request.getParameter("payradio");
			session.setAttribute("ispaied", ispaied);
			String loginName=(String)session.getAttribute("user");
			double totalPrice=((Double)session.getAttribute("total")).doubleValue();
			goodsOrder goodsOrder=new goodsOrder();
			goodsOrder.setCustomerName(customerName);
			goodsOrder.setAddress(address);
			goodsOrder.setZipCode(ZipCode);
			goodsOrder.setTelephone(telePhone);
			goodsOrder.setNotice(notice);
			goodsOrder.setTotalPrice(totalPrice);
			goodsOrder.setispaied(ispaied);
			goodsOrder.setloginName(loginName);
			String content="";
			Set cartItems=cart.keySet();
			Object[] goodsItems=cartItems.toArray();
			for(int i=0;i<goodsItems.length;i++)
			{
				CartItemBean cartItem=(CartItemBean)cart.get((String)goodsItems[i]);
				addgoodsBean goods=cartItem.getGoods();
				int quantity=cartItem.getQuantity();
				String goodsName=goods.getgoodsName();
				String goodsID=goods.getgoodsID();
				String goodsType=goods.getgoodsType();
				content+=goodsID+goodsName+goodsType+quantity+"件. ";
				session.setAttribute("content", content);
			}
			goodsOrder.setContent(content);
			OrderModel om=new OrderModel();
			om.saveOrder(goodsOrder);		
			request.getRequestDispatcher("tellyou").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}

}
