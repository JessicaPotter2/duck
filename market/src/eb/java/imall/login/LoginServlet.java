package eb.java.imall.login;
import eb.java.imall.DbUtil;
import eb.java.imall.tablet.LoginBean;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 //TODO Auto-generated method stub
		{
			response.setContentType("text/html;charset=utf-8");
			request.setCharacterEncoding("UTF-8");
			Connection conn=DbUtil.getConnection();
			try{
				PreparedStatement stmt=conn.prepareStatement("select loginPass from userinfo where loginName=?");
				String username = request.getParameter("username");
				stmt.setString(1,username);
				ResultSet rs= stmt.executeQuery();
			while(rs.next()){
			String password = request.getParameter("password");
			if (password.equals( rs.getString("loginPass"))) {
				//login successfully
				HttpSession hs = request.getSession();
				hs.setAttribute("user", username);
				hs.setAttribute("pass", password);
				hs.setAttribute("logined", true);
				//转向登录后的第一个页面
				response.sendRedirect("loginSession.jsp");
			}
			else {
				response.sendRedirect("login.jsp");
				
				
			}stmt.close();
			conn.close();
			}
			}catch (SQLException e){
				e.printStackTrace();}}
			
		}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}

}
	
