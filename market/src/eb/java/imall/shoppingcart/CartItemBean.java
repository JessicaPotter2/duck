package eb.java.imall.shoppingcart;

import eb.java.imall.tablet.addgoodsBean;


public class CartItemBean {
	private addgoodsBean goods;
	private int quantity;
	
	public CartItemBean(){}
	
	public CartItemBean(addgoodsBean goods, int quantity) {
		this.goods = goods;
		this.quantity = quantity;
		
	}
	
	public addgoodsBean getGoods() {
		return goods;
	}
	public void setGoods(addgoodsBean goods) {
		this.goods = goods;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
