package refund.model.vo;

public class Refund {
	/*
	 * USER_ID	VARCHAR2(20 BYTE)
	   BANK_NAME	VARCHAR2(20 BYTE)
	   ACCOUNT_NUBER	VARCHAR2(100 BYTE)
	   MONEY	NUMBER	
	 	* */
	private String user_id;
	private String bank_name;
	private String account_number;
	private int money;
	
	public Refund() {
		
	}

	public Refund(String user_id, String bank_name, String account_number, int money) {
		super();
		this.user_id = user_id;
		this.bank_name = bank_name;
		this.account_number = account_number;
		this.money = money;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getBank_name() {
		return bank_name;
	}

	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}

	public String getAccount_number() {
		return account_number;
	}

	public void setAccount_number(String account_number) {
		this.account_number = account_number;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	@Override
	public String toString() {
		return "Refund [user_id=" + user_id + ", bank_name=" + bank_name + ", account_number=" + account_number
				+ ", money=" + money + "]";
	}
	
}
