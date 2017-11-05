package com.situ.crm.vo;

public class CustomerServiceType {
	//服务类型
	private String serviceType;
	//数量
	private Integer typeCount;
	
	public CustomerServiceType() {
		super();
	}

	public CustomerServiceType(String serviceType, Integer typeCount) {
		super();
		this.serviceType = serviceType;
		this.typeCount = typeCount;
	}

	public String getServiceType() {
		return serviceType;
	}

	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}

	public Integer getTypeCount() {
		return typeCount;
	}

	public void setTypeCount(Integer typeCount) {
		this.typeCount = typeCount;
	}

	@Override
	public String toString() {
		return "CustomerServiceType [serviceType=" + serviceType + ", typeCount=" + typeCount + "]";
	}
	
}
