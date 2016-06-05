package eb.java.imall.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import eb.java.imall.DbUtil;
import eb.java.imall.tablet.LoginBean;

public class UserOperation {
public int isExists(String loginName){
	String sql="select*from userinfo where loginName=?";
	Connection conn=DbUtil.getConnection();
	PreparedStatement psm=null;
	ResultSet rs=null;
	LoginBean user=null;
	try{
		psm=(PreparedStatement)conn.prepareStatement(sql);
		psm.setString(1, loginName);
		rs=(ResultSet)psm.executeQuery();
		if(rs.next())
		{
			user=new LoginBean();
			user.setUserID(rs.getInt("userID"));
			user.setLoginName(rs.getString("loginName"));
		}
	}catch(SQLException e){
		e.printStackTrace();
	}
	if(user!=null){
		return 1;
	}
	return 0;
}
public int addUser(String loginName,String loginPass,String mail){
	
	String sql="insert into userinfo(loginName,loginPass,mail)values(?,?,?)";
	Connection conn=DbUtil.getConnection();
	PreparedStatement psm=null;
	int num=0;
	try{
		psm=(PreparedStatement)conn.prepareStatement(sql);
		psm.setString(1, loginName);
		psm.setString(2, loginPass);
		psm.setString(3, mail);
		num=psm.executeUpdate();
	}catch (SQLException e){
		e.printStackTrace();
	}
	return num;
}
public void updateUser(String sql){
	try{
	Connection conn=DbUtil.getConnection();
	Statement stmt=conn.createStatement();
	stmt.executeUpdate(sql);
	stmt.close();
	conn.close();
	}catch (SQLException ee){
		System.out.println(ee.getMessage());
	}
}
public ResultSet query(String sql) throws Exception {
	// TODO Auto-generated method stub
	ResultSet rs=null;
	try{
		Connection conn=DbUtil.getConnection();
		Statement stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);
		return rs;
	}
	catch (SQLException e){
		System.out.println(e.getMessage());
	}
	return null;
}	
}

	
