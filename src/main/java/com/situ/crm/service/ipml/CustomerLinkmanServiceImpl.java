package com.situ.crm.service.ipml;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.situ.crm.common.EasyUIDataGrideResult;
import com.situ.crm.common.ServerResponse;
import com.situ.crm.mapper.CustomerLinkmanMapper;
import com.situ.crm.pojo.CustomerLinkman;
import com.situ.crm.pojo.CustomerLinkmanExample;
import com.situ.crm.pojo.CustomerLinkmanExample.Criteria;
import com.situ.crm.service.ICustomerLinkmanService;
import com.situ.crm.util.Util;

@Service
public class CustomerLinkmanServiceImpl implements ICustomerLinkmanService {
	@Autowired
	private CustomerLinkmanMapper customerLinkmanMapper;

	@Override
	public EasyUIDataGrideResult findAllWithoutDate(Integer page, Integer rows, CustomerLinkman customerLinkman) {
		EasyUIDataGrideResult result = new EasyUIDataGrideResult();
		CustomerLinkmanExample customerLinkmanExample = new CustomerLinkmanExample();
		//2、执行查询
		//rows(分页之后的数据)
		Criteria createCriteria = customerLinkmanExample.createCriteria();
		if (customerLinkman.getCustomerId() != null) {
			createCriteria.andCustomerIdEqualTo(customerLinkman.getCustomerId());
		}
		List<CustomerLinkman> customerLinkmanList = customerLinkmanMapper.selectByExample(customerLinkmanExample);
		//total
		int total = customerLinkmanMapper.countByExample(new CustomerLinkmanExample());
		
		result.setTotal(total);
		result.setRows(customerLinkmanList);
		return result;
	}
	
	@Override
	public EasyUIDataGrideResult findAll(Integer page, Integer rows, CustomerLinkman customerLinkman, Date startDate, Date endDate) {
		EasyUIDataGrideResult result = new EasyUIDataGrideResult();
		CustomerLinkmanExample customerLinkmanExample = new CustomerLinkmanExample();
		
		PageHelper.startPage(page, rows);
		
		//查询
		Criteria createCriteria = customerLinkmanExample.createCriteria();
		/*if (StringUtils.isNotEmpty(customerLinkman.getCustomerName())) {
			createCriteria.andCustomerNameLike(Util.formatLike(customerLinkman.getCustomerName()));
		}*/
		
		
		List<CustomerLinkman> customerLinkmanList = customerLinkmanMapper.selectByExample(customerLinkmanExample);
		
		PageInfo<CustomerLinkman> pageInfo = new PageInfo<>(customerLinkmanList);
		int total = (int) pageInfo.getTotal();
		
		result.setTotal(total);
		result.setRows(customerLinkmanList);
		return result;
	}

	@Override
	public ServerResponse add(CustomerLinkman customerLinkman) {
		if (customerLinkmanMapper.insert(customerLinkman) > 0) {
			return ServerResponse.createSuccess("添加成功");
		}
		return ServerResponse.createError("添加失败");
	}

	@Override
	public ServerResponse delete(String ids) {
		String[] idArray = ids.split(",");
		for (String id : idArray) {
			customerLinkmanMapper.deleteByPrimaryKey(Integer.parseInt(id));
		}
		return ServerResponse.createSuccess("删除成功");
	}
	
	@Override
	public ServerResponse deleteById(Integer id) {
		if (customerLinkmanMapper.deleteByPrimaryKey(id) > 0) {
			return ServerResponse.createSuccess("删除数据成功 ");
		}
		return ServerResponse.createSuccess("数据已经成功删除");
	}
	
	@Override
	public ServerResponse update(CustomerLinkman customerLinkman) {
		
		if (customerLinkmanMapper.updateByPrimaryKey(customerLinkman) > 0) {
			return ServerResponse.createSuccess("修改成功! ");
		}
		return ServerResponse.createError("修改失败!");
	}


}
