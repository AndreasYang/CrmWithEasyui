package com.situ.crm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.crm.common.EasyUIDataGrideResult;
import com.situ.crm.common.ServerResponse;
import com.situ.crm.pojo.Customer;
import com.situ.crm.pojo.CustomerLinkman;
import com.situ.crm.service.ICustomerService;
import com.situ.crm.vo.CustomerConstitue;
import com.situ.crm.vo.CustomerContribute;

@Controller
@RequestMapping("/customer")
public class customerController {
	@Autowired
	private ICustomerService customerService;
	
	@RequestMapping("/index")
	public String index(){
		return "customer_manager";
	}
	
	@RequestMapping("/getAddPage")
	public String getAddPage(){
		return "customer_add";
	}
	
	@RequestMapping("/findAll")
	@ResponseBody
	public EasyUIDataGrideResult findAll(Integer page, Integer rows, Customer customer) {
		return customerService.findAll(page, rows, customer);
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public ServerResponse add(Customer customer){
		return customerService.add(customer);
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public ServerResponse delete(String ids){
		return customerService.delete(ids);
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public ServerResponse update(Customer customer) {
		return customerService.update(customer);
	}
	
	@RequestMapping("/customerLinkMan")
	public String customerLinkMan(){
		return "customer_linkman";
	}
	
	@RequestMapping("/findCustomerById")
	@ResponseBody
	public ServerResponse findCustomerById(Integer id){
		return customerService.findCustomerById(id);
	}
	
	@RequestMapping("/getCustomerContributePage")
	public String getCustomerContributePage() {
		return "customer_contribute";
	}
	
	//客户贡献
	@RequestMapping("/findCustomerContribute")
	@ResponseBody
	public EasyUIDataGrideResult findCustomerContribute(Integer page, Integer rows, CustomerContribute customerContribute) {
		return customerService.findCustomerContribute(page, rows, customerContribute);
	}
	
	
	@RequestMapping("/getCustomerConstitutePage")
	public String getCustomerConstitutePage() {
		return "customer_constitute";
	}
	
	//客户构成
	@RequestMapping("/findCustomerConstitute")
	@ResponseBody
	public ServerResponse findCustomerConstitute(){
		return customerService.findCustomerConstitute();
	}
	
	@RequestMapping("/getCustomerServiceTypePage")
	public String getCustomerServiceTypePage() {
		return "customer_servicetype";
	}
	
	//客户服务分析
	@RequestMapping("/findCustomerServiceType")
	@ResponseBody
	public ServerResponse findCustomerServiceType(){
		return customerService.findCustomerServiceType();
	}
}
