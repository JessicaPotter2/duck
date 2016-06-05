package eb.java.imall;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import eb.java.imall.tablet.*;


public class GetDataBean4 {
	public List getGoods(){
		List goodsList= new ArrayList();		
		try {
			Connection conn=DbUtil.getConnection();
			String sql="select * from addgoods where goodsType='笔记本' order by goodsID";
			addgoodsBean goods=null;
			PreparedStatement stmt=conn.prepareStatement(sql);
			ResultSet rs= stmt.executeQuery();
			while(rs.next()){
				goods=new addgoodsBean();
				goods.setgoodsID(rs.getString("goodsID"));
				goods.setgoodsName(rs.getString("goodsName"));
				goods.setgoodsPrice(rs.getDouble("goodsPrice"));
				goods.setDescription(rs.getString("description"));
				goods.setRemark(rs.getString("remark"));
				goods.setquantity(rs.getInt("quantity"));
				goods.setgoodsImage(rs.getString("goodsImage"));
				goods.setgoodsType(rs.getString("goodsType"));
				goodsList.add(goods);
			} 
			stmt.close();
			conn.close();
			rs.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return goodsList;
}
}