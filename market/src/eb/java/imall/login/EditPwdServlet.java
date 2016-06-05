package eb.java.imall.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import eb.java.imall.DbUtil;
import eb.java.imall.tablet.LoginBean;

/**
 * Servlet implementation class EditPwdServlet
 */
@WebServlet("/EditPwdServlet")
public class EditPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String toJSP="";
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String oldpass = request.getParameter("oldpass");
		String newpass = request.getParameter("newpass");
		if(isMiMa(username,oldpass))
		{
			toJSP="fail.jsp";
		}
		else{
			LoginBean login=new LoginBean();
			request.setAttribute("login", login);
			String edit="update userinfo set loginPass='"+newpass+"'where loginName='"+username+"'";
			UserOperation update=new UserOperation();
			try{
				update.updateUser(edit);
			}
			catch(Exception ee)
			{
				System.out.println("发生异常");
			}
			toJSP="success.jsp";
		}
		RequestDispatcher rd=request.getRequestDispatcher(toJSP);
		rd.forward(request, response);
		
	}


public boolean isMiMa(String username,String password){
	boolean b=false;
	String sql="selsct*from userinfo where loginName='"+username+"'and loginPass='"+password+"'";
	UserOperation edit=new UserOperation();
	try{
		ResultSet rs=edit.query(sql);
		if(rs.next())
		{b=true;
		}
		rs.close();
	}
	catch(Exception e)
	{System.out.println("发生查询异常");
		}
	return b;
	}
	
}
