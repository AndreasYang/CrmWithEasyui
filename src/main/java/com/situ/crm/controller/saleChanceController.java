package com.situ.crm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.crm.common.EasyUIDataGrideResult;
import com.situ.crm.common.ServerResponse;
import com.situ.crm.pojo.SaleChance;
import com.situ.crm.service.ISaleChanceService;

@Controller
@RequestMapping("/saleChance")
public class saleChanceController {
	@Autowired
	private ISaleChanceService saleChanceService;
	
	@RequestMapping("/index")
	public String index(){
		return "sale_chance_manager";
	}
	
	
	@RequestMapping("/findAll")
	@ResponseBody
	public EasyUIDataGrideResult findAll(Integer page, Integer rows, SaleChance saleChance) {
		return saleChanceService.findAll(page, rows, saleChance);
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public ServerResponse add(SaleChance saleChance){
		return saleChanceService.add(saleChance);
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public ServerResponse delete(String ids){
		return saleChanceService.delete(ids);
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public ServerResponse update(SaleChance saleChance) {
		return saleChanceService.update(saleChance);
	}
}
