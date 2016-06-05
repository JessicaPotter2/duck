package eb.java.imall.shoppingcart;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import eb.java.imall.DbUtil;

/**
 * Servlet implementation class tellyou
 */
@WebServlet("/tellyou")
public class tellyou extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public tellyou() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		Connection conn=DbUtil.getConnection();
		String sendtext="";
		String mail="";
		HttpSession session=request.getSession();
		String ispaied=(String)session.getAttribute("ispaied");
		
		String loginName=(String)session.getAttribute("user");
		Statement stmt=null;
		try{
			stmt=conn.createStatement();
		}catch(SQLException e){
			e.printStackTrace();
		}
		ResultSet rs=null;
		try{
			rs=stmt.executeQuery("select mail from userinfo where loginName='"+loginName+"'");
		}catch(SQLException e){
			e.printStackTrace();}
		try{
			if(rs.next()){
				mail=rs.getString("mail");
				request.setAttribute("mail", mail);
			}
		}catch(SQLException e){
			e.printStackTrace();
			}
		final String username = "cumtyeyunjiao@163.com";//邮箱（全称，含@）
		final String password = "20061102abcde";//邮箱密码
		Properties props = new Properties();
		props.setProperty("mail.smtp.auth", "true");
		props.setProperty("mail.smtp.ssl.enable", "true");//启用SSL
		props.setProperty("mail.smtp.host", "smtp.163.com");
		props.put("mail.smtp.ssl.socketFactory",
				"javax.net.ssl.SSLSocketFactory");
		props.setProperty("mail.smtp.port", "465");
		Session session2 = Session.getDefaultInstance(props,
				new Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(username,
								password);
					}
				});

		try {
			if(ispaied.equals("paied")){
				sendtext="您已完成支付，订单已完成";
			}else{
				sendtext="您还未支付，请尽快支付";
			}
			Message message = new MimeMessage(session2);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(mail));
			message.setSubject("订单状态通知");
			message.setText(sendtext);

			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
		request.getRequestDispatcher("shoppingcart/seeYou.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);
	}

}
