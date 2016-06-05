package eb.java.imall.goods;

import eb.java.imall.tablet.addgoodsBean;

public class Item {
	
		private addgoodsBean goods;
		private int quantity;
		
		public Item(){}
		
		public Item(addgoodsBean goods, int quantity) {
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

