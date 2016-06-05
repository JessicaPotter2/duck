package eb.java.imall.tablet;

public class orderdetailBean {
	private int orderID;
	private String goodsID;
	private String goodsType;
	private double goodsPrice;
	private int quantity;
	public int getorderID(){
		return orderID;
	}
	public void setorderID(int orderID){
		this.orderID=orderID;
	}
	public String getgoodsID(){
		return goodsID;
	}
	public void setgoodsID(String goodsID){
		this.goodsID=goodsID;
	}
	public double getgoodsPrice(){
		return goodsPrice;
	}
	public void setgoodsPrice(double goodsPrice){
		this.goodsPrice=goodsPrice;
	}
	public int getquantity(){
		return quantity;
	}
	public void setquantity(int quantity){
		this.quantity=quantity;
}
	public String getgoodsType(){
		return goodsType;
	}
	public void setgoodsType(String goodsType){
		this.goodsType=goodsType;
}
}
