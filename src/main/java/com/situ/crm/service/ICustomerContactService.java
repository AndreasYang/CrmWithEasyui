package com.situ.crm.service;

import java.util.Date;

import com.situ.crm.common.EasyUIDataGrideResult;
import com.situ.crm.common.ServerResponse;
import com.situ.crm.pojo.CustomerContact;

public interface ICustomerContactService {

	ServerResponse add(CustomerContact customerContact);

	ServerResponse delete(String ids);

	ServerResponse update(CustomerContact customerContact);

	EasyUIDataGrideResult findAll(Integer page, Integer rows, CustomerContact customerContact, Date startDate, Date endDate);

	EasyUIDataGrideResult findAllWithoutDate(Integer page, Integer rows, CustomerContact customerContact);

	ServerResponse deleteById(Integer id);

}
