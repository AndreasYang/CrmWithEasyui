package com.situ.crm.service;

import java.util.List;

import com.situ.crm.common.EasyUIDataGrideResult;
import com.situ.crm.common.ServerResponse;
import com.situ.crm.pojo.Customer;
import com.situ.crm.vo.CustomerContribute;

public interface ICustomerService {

	EasyUIDataGrideResult findAll(Integer page, Integer rows, Customer customer);

	ServerResponse add(Customer customer);

	ServerResponse delete(String ids);

	ServerResponse update(Customer customer);

	ServerResponse findCustomerById(Integer id);

	void checkCustomerLoss();

	EasyUIDataGrideResult findCustomerContribute(Integer page, Integer rows, CustomerContribute customerContribute);

	ServerResponse findCustomerConstitute();

	ServerResponse findCustomerServiceType();

}
