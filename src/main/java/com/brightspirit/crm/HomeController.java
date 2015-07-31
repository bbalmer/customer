package com.brightspirit.crm;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.brightspirit.crm.model.Reminder;
import com.brightspirit.crm.service.CustomerService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private final Integer MAX_REMINDER_DAYS_OUT = 9;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private CustomerService customerService;
	
	
	@ModelAttribute("customerCount")
	public Integer getCustomerCount() {
		return customerService.getCustomers().size();
	}
	
	@ModelAttribute("reminderCount")
	public Integer getReminderCount() {
		List<Reminder> tmp = customerService.listReminders(MAX_REMINDER_DAYS_OUT, false);
		if(tmp == null) return 0;
		else return tmp.size();
		
		
	}
	
	@ModelAttribute("notifications")
	public List<Reminder> getReminders() {
		return customerService.listReminders(MAX_REMINDER_DAYS_OUT, false);
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
}
