package eb.java.imall.login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegServlet
 */
@WebServlet("/RegServlet")
public class RegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html);charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out=response.getWriter();
		String loginName=request.getParameter("loginName");
		String loginPass=request.getParameter("loginPass");
		String mail=request.getParameter("mail");
		UserOperation u=new UserOperation();
		int num=u.isExists(loginName);
		if(num==0){
			int num1=u.addUser(loginName,loginPass,mail);
			if(num1>0){
				out.print("<script type='text/javascript' language='javascript'>alert('success');location.href='index.jsp';</script>");
			}
			else{
				out.print("<script type='text/javascript' language='javascript'>alert('注册失败');history.go(-1);</script>");
			}
		}else
		{
			out.print("<script type='text/javascript' language='javascript'>alert('this loginName is exists!');history.go(-1);</script>");
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
