package com.situ.crm.quartz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.situ.crm.service.ICustomerService;

@Component
public class FindLossCustomerJob {
	@Autowired
	private ICustomerService customerService;
	
	@Scheduled(cron="0/10 * * * * ?")
	public void work() {
		System.out.println("FindLossCustomerJob.work()");
		customerService.checkCustomerLoss();
	}
}
