package eb.java.imall.tablet;

public class goodsOrder {
	private int orderID;
	private String customerName;
	private String address;
	private String ZipCode;
	private String telephone;
	private String notice;
	private double totalPrice;
	private String content;
	private String ispaied;
	private String loginName;
	public goodsOrder(){}
	public int getorderID(){
		return orderID;
	}
	public void setorderID(int orderID){
		this.orderID=orderID;
	}
	public String getAddress(){
		return address;
	}
	public void setAddress(String address){
		this.address=address;
	}
	public String getCustomerName(){
		return customerName;
	}
	public void setCustomerName(String customerName){
		this.customerName=customerName;
	}
	public String getNotice(){
		return notice;
	}
	public void setNotice(String notice){
		this.notice=notice;
	}
	public String getTelephone(){
		return telephone;
	}
	public void setTelephone(String telephone){
		this.telephone=telephone;
	}
	public double getTotalPrice(){
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice){
		this.totalPrice=totalPrice;
	}
	public String getZipCode(){
		return ZipCode;
	}
	public void setZipCode(String ZipCode){
		this.ZipCode=ZipCode;
	}
	public String getContent(){
		return content;
	}
	public void setContent(String content){
		this.content=content;
	}
	public String getispaied(){
	return ispaied;
	}
	public void setispaied(String ispaied){
		this.ispaied=ispaied;
	}
	public String getloginName(){
		return loginName;
	}
	public void setloginName(String loginName) {
		// TODO Auto-generated method stub
		this.loginName=loginName;
	}
}
