package com.situ.crm.service;

import java.util.Date;

import com.situ.crm.common.EasyUIDataGrideResult;
import com.situ.crm.common.ServerResponse;
import com.situ.crm.pojo.SaleChance;

public interface ISaleChanceService {

	ServerResponse add(SaleChance saleChance);

	ServerResponse delete(String ids);

	ServerResponse update(SaleChance saleChance);

	EasyUIDataGrideResult findAll(Integer page, Integer rows, SaleChance saleChance, Date startDate, Date endDate);

	EasyUIDataGrideResult findAllWithoutDate(Integer page, Integer rows, SaleChance saleChance);

	ServerResponse findById(Integer id);

	ServerResponse updateDevResult(Integer saleChanceId, Integer devResult);

}
