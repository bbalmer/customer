package com.brightspirit.crm;

import java.io.PrintWriter;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.brightspirit.crm.model.Customer;
import com.brightspirit.crm.model.Reminder;
import com.brightspirit.crm.service.CustomerService;

@Controller
public class NotificationController {

	@Autowired
	private CustomerService customerService;
	
	private final String customerRef = "CUSTOMER_REF";
	
	@RequestMapping(value = "/notification/add/{customerId}", method = RequestMethod.GET)
	public String showAddUserForm(@PathVariable Integer customerId, Model model, HttpSession session) {
		Reminder reminder = new Reminder();

		reminder.setCustomer(customerService.getCustomer(customerId));
		reminder.setAck(false);
		model.addAttribute("notification", reminder);
		
		session.removeAttribute(customerRef);
		if(reminder.getCustomer() != null) {
			session.setAttribute(customerRef, reminder.getCustomer());
		}
		model.addAttribute("type", "Add");
		
		return "reminder/index";
	}
	
	

	@RequestMapping(value = "/notification/edit/{id}", method = RequestMethod.GET)
	public String showEditNotificationForm(Model model, @PathVariable("id") int id) {
		
		Reminder reminder = customerService.getReminder(id);
		Customer customer = customerService.getCustomer(reminder.getCustomerId());
		
		reminder.setCustomer(customer);
		
		model.addAttribute("notification", reminder);
		model.addAttribute("type", "Edit");
		return "reminder/index";
	}
	

	@RequestMapping(value = "/notification/save", method = RequestMethod.POST)
    public ModelAndView processForm(@ModelAttribute Reminder notification, Model model, HttpSession session) {
       
		notification.setCustomer((Customer) session.getAttribute(customerRef));
		notification.setAck(false);
		int customerId = notification.getCustomerId();
		if(notification.getCustomer() == null && customerId > 0) {
			Customer customer = customerService.getCustomer(customerId);
			notification.setCustomer(customer);
		}
		
		
		if(notification.getId() == 0) {
			customerService.addReminder((Customer) session.getAttribute(customerRef), notification);
		} else {
			customerService.updateReminder(notification);
		}
		if(customerId > 0) {
			return new ModelAndView("redirect:/customer/"+customerId);
		} else {
			return new ModelAndView("redirect:/home");
		}
    }
	

	@RequestMapping(value = "/notification/delete/{id}", method = RequestMethod.GET)
    public void deleteNotification(Model model, @PathVariable("id") int id, PrintWriter out) {
       
		customerService.deleteReminder( customerService.getReminder(id) );
		out.write("");
		out.flush();
		out.close();
    }
	
	
	@RequestMapping(value = "/notification/ack/{notificationId}", method=RequestMethod.GET)
	public ModelAndView acknowledge(@PathVariable Integer notificationId, PrintWriter out){

		customerService.acknowledgeReminder(notificationId);
		
		
		return new ModelAndView("redirect:/home");
	}
	
	@RequestMapping(value = "/notification/list", method = RequestMethod.GET)
	public String showNotifications(Model model) {
		model.addAttribute("reminders", customerService.listReminders(0, true));
		return "reminder/list";
	}
}
