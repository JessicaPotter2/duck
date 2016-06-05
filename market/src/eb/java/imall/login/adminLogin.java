package eb.java.imall.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import eb.java.imall.DbUtil;

/**
 * Servlet implementation class adminLogin
 */
@WebServlet("/adminLogin")
public class adminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		Connection conn=DbUtil.getConnection();
		PrintWriter pw = response.getWriter();
		try{
			PreparedStatement stmt=conn.prepareStatement("select adminPass from administrator where adminName=?");
			String username = request.getParameter("username");
			stmt.setString(1,username);
			ResultSet rs= stmt.executeQuery();
		while(rs.next()){
		String password = request.getParameter("password");
		if (password.equals( rs.getString("adminPass"))) {
			//login successfully
			HttpSession hs = request.getSession();
			hs.setAttribute("user", username);
			hs.setAttribute("logined", true);
			//转向登录后的第一个页面
			response.sendRedirect("myTree.jsp");
		}
		else {
			response.sendRedirect("adminlogin.jsp");
			
			pw.close();
		}stmt.close();
		conn.close();
		}
		}catch (SQLException e){
			e.printStackTrace();}}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}

}
