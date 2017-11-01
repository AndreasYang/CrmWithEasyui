package com.situ.crm.service;

import java.util.Date;

import com.situ.crm.common.EasyUIDataGrideResult;
import com.situ.crm.common.ServerResponse;
import com.situ.crm.pojo.CusDevPlan;

public interface ICusDevPlanService {

	ServerResponse add(CusDevPlan cusDevPlan);

	ServerResponse delete(String ids);

	ServerResponse update(CusDevPlan cusDevPlan);

	EasyUIDataGrideResult findAll(Integer page, Integer rows, CusDevPlan cusDevPlan, Date startDate, Date endDate);

	EasyUIDataGrideResult findAllWithoutDate(Integer page, Integer rows, CusDevPlan cusDevPlan);

}
