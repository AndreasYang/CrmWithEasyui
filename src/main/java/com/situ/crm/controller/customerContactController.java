package com.situ.crm.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.crm.common.EasyUIDataGrideResult;
import com.situ.crm.common.ServerResponse;
import com.situ.crm.pojo.CustomerContact;
import com.situ.crm.service.ICustomerContactService;

@Controller
@RequestMapping("/customerContact")
public class customerContactController {
	@InitBinder 
	public void initBinder(WebDataBinder binder) { 
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
	    dateFormat.setLenient(false); 
	    binder.registerCustomEditor(Date.class,
	           new CustomDateEditor(dateFormat, true));
	}
	
	@Autowired
	private ICustomerContactService customerContactService;
	
	@RequestMapping("/index")
	public String index(){
		return "customer_linkman";
	}
	
	@RequestMapping("/customerContact")
	public String customerContact(){
		return "cus_dev_plan";
	}
	
	@RequestMapping("/findAll")
	@ResponseBody
	public EasyUIDataGrideResult findAll(Integer page, Integer rows, CustomerContact customerContact) {
		return customerContactService.findAllWithoutDate(page, rows, customerContact);
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public ServerResponse add(CustomerContact customerContact){
		return customerContactService.add(customerContact);
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public ServerResponse delete(String ids){
		return customerContactService.delete(ids);
	}
	
	@RequestMapping("/deleteById")
	@ResponseBody
	public ServerResponse deleteById(Integer id){
		return customerContactService.deleteById(id);
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public ServerResponse update(CustomerContact customerContact) {
		return customerContactService.update(customerContact);
	}
	
}
