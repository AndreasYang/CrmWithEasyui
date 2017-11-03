package com.situ.crm.service;

import java.util.Date;

import com.situ.crm.common.EasyUIDataGrideResult;
import com.situ.crm.common.ServerResponse;
import com.situ.crm.pojo.CustomerLinkman;

public interface ICustomerLinkmanService {

	ServerResponse add(CustomerLinkman customerLinkman);

	ServerResponse delete(String ids);

	ServerResponse update(CustomerLinkman customerLinkman);

	EasyUIDataGrideResult findAll(Integer page, Integer rows, CustomerLinkman customerLinkman, Date startDate, Date endDate);

	EasyUIDataGrideResult findAllWithoutDate(Integer page, Integer rows, CustomerLinkman customerLinkman);

	ServerResponse deleteById(Integer id);

}
