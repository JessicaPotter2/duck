package eb.java.imall.login;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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

import com.sun.mail.util.MailSSLSocketFactory;

import eb.java.imall.DbUtil;

/**
 * Servlet implementation class SendMailSSL
 */
@WebServlet("/searchservlet")
public class searchservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public searchservlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String loginPass="";
		Connection conn=DbUtil.getConnection();
		String mail=request.getParameter("email");
		Statement stmt=null;
		try{
			stmt=conn.createStatement();
		}catch(SQLException e){
			e.printStackTrace();
		}
		ResultSet rs=null;
		try{
			rs=stmt.executeQuery("select loginPass from userinfo where mail='"+mail+"'");
		}catch(SQLException e){
			e.printStackTrace();}
		try{
			if(rs.next()){
				loginPass=rs.getString("loginPass");
				request.setAttribute("loginPass", loginPass);
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
		Session session = Session.getDefaultInstance(props,
				new Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(username,
								password);
					}
				});

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(username));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(mail));
			message.setSubject("找回密码");
			message.setText("这是你的密码："+loginPass);

			Transport.send(message);

			System.out.println("Done");

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request,response);

	}

}