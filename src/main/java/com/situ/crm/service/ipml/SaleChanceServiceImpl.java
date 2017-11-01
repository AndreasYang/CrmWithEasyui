package com.situ.crm.service.ipml;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.situ.crm.common.EasyUIDataGrideResult;
import com.situ.crm.common.ServerResponse;
import com.situ.crm.mapper.SaleChanceMapper;
import com.situ.crm.pojo.SaleChance;
import com.situ.crm.pojo.SaleChanceExample;
import com.situ.crm.pojo.SaleChanceExample.Criteria;
import com.situ.crm.service.ISaleChanceService;
import com.situ.crm.util.Util;

@Service
public class SaleChanceServiceImpl implements ISaleChanceService {
	@Autowired
	private SaleChanceMapper saleChanceMapper;

	@Override
	public EasyUIDataGrideResult findAllWithoutDate(Integer page, Integer rows, SaleChance saleChance) {
		EasyUIDataGrideResult result = new EasyUIDataGrideResult();
		SaleChanceExample saleChanceExample = new SaleChanceExample();
		
		PageHelper.startPage(page, rows);
		
		//查询
		Criteria createCriteria = saleChanceExample.createCriteria();
		if (StringUtils.isNotEmpty(saleChance.getCustomerName())) {
			createCriteria.andCustomerNameLike(Util.formatLike(saleChance.getCustomerName()));
		}
		if (StringUtils.isNotEmpty(saleChance.getOverview())) {
			createCriteria.andOverviewLike(Util.formatLike(saleChance.getOverview()));
		}
		if (StringUtils.isNotEmpty(saleChance.getCreateMan())) {
			createCriteria.andCreateManLike(Util.formatLike(saleChance.getCreateMan()));
		}
		if (saleChance.getStatus() != null) {
			createCriteria.andStatusEqualTo(saleChance.getStatus());
		}
		
		List<SaleChance> saleChanceList = saleChanceMapper.selectByExample(saleChanceExample);
		
		PageInfo<SaleChance> pageInfo = new PageInfo<>(saleChanceList);
		int total = (int) pageInfo.getTotal();
		
		result.setTotal(total);
		result.setRows(saleChanceList);
		return result;
	}
	
	@Override
	public EasyUIDataGrideResult findAll(Integer page, Integer rows, SaleChance saleChance, Date startDate, Date endDate) {
		EasyUIDataGrideResult result = new EasyUIDataGrideResult();
		SaleChanceExample saleChanceExample = new SaleChanceExample();
		
		PageHelper.startPage(page, rows);
		
		//查询
		Criteria createCriteria = saleChanceExample.createCriteria();
		if (StringUtils.isNotEmpty(saleChance.getCustomerName())) {
			createCriteria.andCustomerNameLike(Util.formatLike(saleChance.getCustomerName()));
		}
		if (StringUtils.isNotEmpty(saleChance.getOverview())) {
			createCriteria.andOverviewLike(Util.formatLike(saleChance.getOverview()));
		}
		if (StringUtils.isNotEmpty(saleChance.getCreateMan())) {
			createCriteria.andCreateManLike(Util.formatLike(saleChance.getCreateMan()));
		}
		if (saleChance.getStatus() != null) {
			createCriteria.andStatusEqualTo(saleChance.getStatus());
		}
		if (startDate != null && endDate != null) {
			createCriteria.andCreateTimeBetween(startDate, endDate);
		}
		
		List<SaleChance> saleChanceList = saleChanceMapper.selectByExample(saleChanceExample);
		
		PageInfo<SaleChance> pageInfo = new PageInfo<>(saleChanceList);
		int total = (int) pageInfo.getTotal();
		
		result.setTotal(total);
		result.setRows(saleChanceList);
		return result;
	}

	@Override
	public ServerResponse add(SaleChance saleChance) {
		if(StringUtils.isNotEmpty(saleChance.getAssignMan())){
			saleChance.setStatus(1);//已分配
		}else{
			saleChance.setStatus(0);//0：:未分配
		}
		saleChance.setDevResult(0);
		if (saleChanceMapper.insert(saleChance) > 0) {
			return ServerResponse.createSuccess("添加成功");
		}
		return ServerResponse.createError("添加失败");
	}

	@Override
	public ServerResponse delete(String ids) {
		String[] idArray = ids.split(",");
		for (String id : idArray) {
			saleChanceMapper.deleteByPrimaryKey(Integer.parseInt(id));
		}
		return ServerResponse.createSuccess("删除成功");
	}

	@Override
	public ServerResponse update(SaleChance saleChance) {
		if(StringUtils.isNotEmpty(saleChance.getAssignMan())){
			saleChance.setStatus(1);//已分配
		}else{
			saleChance.setStatus(0);//0：:未分配
		}
		if (saleChanceMapper.updateByPrimaryKey(saleChance) > 0) {
			return ServerResponse.createSuccess("修改成功! ");
		}
		return ServerResponse.createError("修改失败!");
	}

	@Override
	public ServerResponse findById(Integer id) {
		SaleChance saleChance = saleChanceMapper.selectByPrimaryKey(id);
		if (saleChance != null) {
			return ServerResponse.createSuccess("查找成功! ", saleChance);
		}
		return ServerResponse.createError("查找失败!");
	}

	

}
