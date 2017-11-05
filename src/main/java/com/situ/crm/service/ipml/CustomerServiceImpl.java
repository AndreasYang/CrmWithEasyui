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
import com.situ.crm.mapper.CustomerLossMapper;
import com.situ.crm.mapper.CustomerMapper;
import com.situ.crm.mapper.CustomerOrderMapper;
import com.situ.crm.pojo.Customer;
import com.situ.crm.pojo.CustomerExample;
import com.situ.crm.pojo.CustomerExample.Criteria;
import com.situ.crm.pojo.CustomerLoss;
import com.situ.crm.pojo.CustomerOrder;
import com.situ.crm.service.ICustomerService;
import com.situ.crm.util.Util;

@Service
public class CustomerServiceImpl implements ICustomerService {
	@Autowired
	private CustomerMapper customerMapper;
	
	@Autowired
	private CustomerOrderMapper customerOrderMapper;
	
	@Autowired
	private CustomerLossMapper customerLossMapper;

	@Override
	public EasyUIDataGrideResult findAll(Integer page, Integer rows, Customer customer) {
		EasyUIDataGrideResult result = new EasyUIDataGrideResult();
		CustomerExample customerExample = new CustomerExample();
		
		PageHelper.startPage(page, rows);
		
		//查询
		Criteria createCriteria = customerExample.createCriteria();
		if (StringUtils.isNotEmpty(customer.getName())) {
			createCriteria.andNameLike(Util.formatLike(customer.getName()));
		}
		if (StringUtils.isNotEmpty(customer.getNum())) {
			createCriteria.andNumEqualTo(customer.getNum());
		}
		
		List<Customer> customerList = customerMapper.selectByExample(customerExample);
		
		PageInfo<Customer> pageInfo = new PageInfo<>(customerList);
		int total = (int) pageInfo.getTotal();
		
		result.setTotal(total);
		result.setRows(customerList);
		return result;
	}

	@Override
	public ServerResponse add(Customer customer) {
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddhhmmss");
		String num = "KH"+simpleDateFormat.format(date);
		customer.setNum(num);
		if (customerMapper.insert(customer) > 0) {
			return ServerResponse.createSuccess("添加成功");
		}
		return ServerResponse.createError("添加失败");
	}

	@Override
	public ServerResponse delete(String ids) {
		String[] idArray = ids.split(",");
		for (String id : idArray) {
			customerMapper.deleteByPrimaryKey(Integer.parseInt(id));
		}
		return ServerResponse.createSuccess("删除成功");
	}

	@Override
	public ServerResponse update(Customer customer) {
		if (customerMapper.updateByPrimaryKey(customer) > 0) {
			return ServerResponse.createSuccess("修改成功! ");
		}
		return ServerResponse.createError("修改失败!");
	}

	@Override
	public ServerResponse findCustomerById(Integer id) {
		Customer customer = customerMapper.selectByPrimaryKey(id);
		if (customer != null) {
			return ServerResponse.createSuccess("查找成功", customer);
		}
		return ServerResponse.createError("查找失败");
	}

	@Override
	public void checkCustomerLoss() {
		System.out.println("CustomerServiceImpl.checkCustomerLoss()");
		//查找流失客户
		List<Customer> customerList = customerMapper.findLossCustomer();
		for (Customer customer : customerList) {
			//实例化CustomerLoss
			CustomerLoss customerLoss = new CustomerLoss();
			customerLoss.setCustomerNo(customer.getNum());
			customerLoss.setCustomerName(customer.getName());
			customerLoss.setCustomerManager(customer.getManagerName());
			//查找指定而客户最近的一次订单
			CustomerOrder customerOrder = customerOrderMapper.findLastOrderByCustomerId(customer.getId());
			if (customerOrder == null) {
				customerLoss.setLastOrderTime(null);
			}else {
				customerLoss.setLastOrderTime(customerOrder.getOrderDate());
			}
			//添加到客户流失表里面
			customerLossMapper.insert(customerLoss);
			customer.setStatus(1);
			customerMapper.updateByPrimaryKey(customer);
		}
	}



}
