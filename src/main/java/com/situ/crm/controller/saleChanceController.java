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
import com.situ.crm.pojo.SaleChance;
import com.situ.crm.service.ISaleChanceService;

@Controller
@RequestMapping("/saleChance")
public class saleChanceController {
	@InitBinder 
	public void initBinder(WebDataBinder binder) { 
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
	    dateFormat.setLenient(false); 
	    binder.registerCustomEditor(Date.class,
	           new CustomDateEditor(dateFormat, true));
	}
	
	@Autowired
	private ISaleChanceService saleChanceService;
	
	@RequestMapping("/index")
	public String index(){
		return "sale_chance_manager";
	}
	
	@RequestMapping("/cusDevPlan")
	public String cusDevPlan(){
		return "cus_dev_plan";
	}
	
	@RequestMapping("/findAll")
	@ResponseBody
	public EasyUIDataGrideResult findAll(Integer page, Integer rows, SaleChance saleChance, String sstartDate, String sendDate) {
		if (sstartDate == null && sendDate == null) {
			
			return saleChanceService.findAllWithoutDate(page, rows, saleChance);
		}else {
			DateFormat fmt =new SimpleDateFormat("yyyy-MM-dd");
			Date startDate = null;
			Date endDate = null;
			try {
				startDate = fmt.parse(sstartDate);
				endDate = fmt.parse(sendDate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			System.out.println("startDate" + startDate);
			System.out.println("endDate" + endDate);
			return saleChanceService.findAll(page, rows, saleChance, startDate, endDate);
		}
		
		
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
	
	@RequestMapping("/findById")
	@ResponseBody
	public ServerResponse findById(Integer id){
		return saleChanceService.findById(id);
	}
	
	@RequestMapping("/updateDevResult")
	@ResponseBody
	public ServerResponse updateDevResult(Integer saleChanceId, Integer devResult){
		return saleChanceService.updateDevResult(saleChanceId,devResult);
		
	}
}
