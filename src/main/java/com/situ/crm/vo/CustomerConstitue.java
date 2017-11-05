package com.situ.crm.vo;

public class CustomerConstitue {
	//客户等级
	private String customerLevel;
	//数量
	private Integer levelCount;
	
	public CustomerConstitue() {
		super();
	}
	public CustomerConstitue(String customerLevel, Integer levelCount) {
		super();
		this.customerLevel = customerLevel;
		this.levelCount = levelCount;
	}
	public String getCustomerLevel() {
		return customerLevel;
	}
	public void setCustomerLevel(String customerLevel) {
		this.customerLevel = customerLevel;
	}
	public Integer getLevelCount() {
		return levelCount;
	}
	public void setLevelCount(Integer levelCount) {
		this.levelCount = levelCount;
	}
	@Override
	public String toString() {
		return "CustomerConstitue [customerLevel=" + customerLevel + ", levelCount=" + levelCount + "]";
	}
}
