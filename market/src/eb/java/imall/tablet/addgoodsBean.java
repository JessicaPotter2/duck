package eb.java.imall.tablet;

public class addgoodsBean {
	private String goodsID;
	private String goodsName;
	private String goodsType;
	private double goodsPrice;
	private String goodsImage;
	private String description;
	private int quantity;
	private String remark;
	public String getDescription(){
		return description;
	}
	public void setDescription(String description){
		this.description=description;
	}
	public String getgoodsID(){
		return goodsID;
	}
	public void setgoodsID(String goodsID){
		this.goodsID=goodsID;
	}
	public String getgoodsName(){
		return goodsName;
	}
	public void setgoodsName(String goodsName){
		this.goodsName=goodsName;
	}
	public double getgoodsPrice(){
		return goodsPrice;
	}
	public void setgoodsPrice(double goodsPrice){
		this.goodsPrice=goodsPrice;
	}
	public String getgoodsImage(){
		return goodsImage;
	}
	public void setgoodsImage(String goodsImage){
		this.goodsImage=goodsImage;
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
	public String getRemark(){
		return remark;
	}
	public void setRemark(String remark){
		this.remark=remark;
	}
}
