package com.situ.crm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.situ.crm.common.EasyUIDataGrideResult;
import com.situ.crm.common.ServerResponse;
import com.situ.crm.pojo.DataDic;
import com.situ.crm.service.IDataDicService;

@Controller
@RequestMapping("/dataDic")
public class dataDicController {
	@Autowired
	private IDataDicService dataDicService;
	
	@RequestMapping("/index")
	public String index(){
		return "data_dic_manager";
	}
	
	@RequestMapping("/findAll")
	@ResponseBody
	public EasyUIDataGrideResult findAll(Integer page, Integer rows, DataDic dataDic) {
		return dataDicService.findAll(page, rows, dataDic);
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public ServerResponse add(DataDic dataDic){
		return dataDicService.add(dataDic);
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public ServerResponse delete(String ids){
		return dataDicService.delete(ids);
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public ServerResponse update(DataDic dataDic) {
		return dataDicService.update(dataDic);
	}
	
	@RequestMapping("/findDataDicName")
	@ResponseBody
	public List<DataDic> findDataDicName(){
		return dataDicService.findDataDicName();
	}
	
	@RequestMapping("/getCustomerLevel")
	@ResponseBody
	public List<DataDic> getCustomerLevel(){
		return dataDicService.getCustomerLevel();
	}
}
