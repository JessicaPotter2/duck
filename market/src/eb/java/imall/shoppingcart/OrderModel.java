package eb.java.imall.shoppingcart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import eb.java.imall.DbUtil;
import eb.java.imall.tablet.goodsOrder;
import eb.java.imall.tablet.orderdetailBean;


public class OrderModel {
	
	public int saveOrder(goodsOrder goodsOrder){
		
		String sql="insert into goodsorderinfo(customerName,address,ZipCode,telephone,notice,totalPrice,content,ispaied,loginName)values(?,?,?,?,?,?,?,?,?)";
		Connection conn=DbUtil.getConnection();
		PreparedStatement pst=null;
		int result=0;
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, goodsOrder.getCustomerName());
			pst.setString(2, goodsOrder.getAddress());
			pst.setString(3, goodsOrder.getZipCode());
			pst.setString(4, goodsOrder.getTelephone());
			pst.setString(5, goodsOrder.getNotice());
			pst.setDouble(6, goodsOrder.getTotalPrice());
			pst.setString(7, goodsOrder.getContent());
			pst.setString(8, goodsOrder.getispaied());
			pst.setString(9,goodsOrder.getloginName());
			result=pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
}
