package com.brightspirit.crm;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.brightspirit.crm.model.Conversation;
import com.brightspirit.crm.model.Customer;
import com.brightspirit.crm.model.Reminder;
import com.brightspirit.crm.service.CustomerService;

@Controller
public class CustomerController {

	@Autowired
	private CustomerService customerService;

	@RequestMapping(value = "/customer/list", method = RequestMethod.GET)
	public String showCustomers(Model model) {
		model.addAttribute("customers", customerService.getCustomers());
		return "customer/list";
	}
	
	
	@RequestMapping(value = "/customer/edit/{customerId}", method = RequestMethod.GET)
	public String showEditUserForm(@PathVariable Integer customerId, Model model) {
		
		Customer customer = customerService.getCustomer(customerId);
		
		model.addAttribute("customer", customer);
		return "customer/index";
	}
	
	@RequestMapping(value = "/customer/delete/{customerId}", method = RequestMethod.GET)
	public void deleteUserForm(@PathVariable Integer customerId, PrintWriter out) {
		
		Customer customer = customerService.getCustomer(customerId);
		customerService.deleteCustomer(customer);
		out.write("");
		out.flush();
		out.close();
	}
	
	
	
	@RequestMapping(value = "/customer/add", method = RequestMethod.GET)
	public String showAddUserForm(Model model) {
		Customer customer = new Customer();
		customer.setState("IL");
		model.addAttribute("customer", customer);
		return "customer/index";
	}
	

	@RequestMapping(value = "/customer/add", method = RequestMethod.POST)
    public ModelAndView processForm(@ModelAttribute Customer customer, Model model) {
      
		customerService.saveCustomer(customer);
		
        return new ModelAndView("redirect:/home");
    }
	
	@RequestMapping(value = "/customer/{customerId}", method=RequestMethod.GET)
	public String showCustomer(@PathVariable Integer customerId, Model model){
		Customer customer = null;
		List<Conversation> logs = new ArrayList<Conversation>();
		List<Reminder> reminders = new ArrayList<Reminder>();
		try {
			customer = customerService.getCustomer(new Integer(customerId));
			if(customer != null) {
				logs = customerService.listConversationsForCustomer(customer.getId());
			}
			
			reminders = customerService.listNonAcknowledgedByCustomer(customer.getId());
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("customer", customer);
		model.addAttribute("logs", logs);
		model.addAttribute("reminders", reminders);
		return "customer/overview";
	}
	
	@RequestMapping(value = "/customer/search", method=RequestMethod.GET) 
	public void searchCustomerByName(@RequestParam("term") String q, PrintWriter out) {
		List<Customer> customers = customerService.searchByName(q);
		JSONArray data = new JSONArray();
		if(customers != null) {
			for(Customer customer : customers) {
				JSONObject obj = new JSONObject();
				obj.put("id", customer.getFullName());
				obj.put("label", customer.getFullName());
				obj.put("value", customer.getFullName());
				data.add(obj);
			}
		}
	
		out.write(data.toString());
		out.flush();
		out.close();
	}
	

	
	@RequestMapping(value = "/log/{logId}", method=RequestMethod.GET)
	public String showLog(@PathVariable Integer logId,Model model){
		Conversation conversation = customerService.getConversation(logId);
	
		model.addAttribute("log", conversation);
		model.addAttribute("customer", null);
		return "conversation/index";
	}
	

	
	@RequestMapping(value = "/logs", method=RequestMethod.GET)
	public String showLogs(Model model){
		List<Conversation> conversation = customerService.listConversations();
	
		model.addAttribute("logs", conversation);
		model.addAttribute("customer", null);
		return "conversation/list";
	}
	


	@RequestMapping(value = "/log/edit", method = RequestMethod.GET)
	public String showEditLogForm(Model model, @RequestParam("id") int id) {

		Conversation conversation = customerService.getConversation(id);
		
		Customer customer = customerService.getCustomer(conversation.getCustomerId());
		model.addAttribute("log", conversation);
		model.addAttribute("customer", customer);
		return "conversation/index";
	}
	

	@RequestMapping(value = "/log/add", method = RequestMethod.GET)
	public String showAddLogForm(Model model, @RequestParam("id") int id) {
		Conversation conversation = new Conversation();

		Customer customer = customerService.getCustomer(id);
		conversation.setCustomerId(id);
		conversation.setContactDate(new Date());
		model.addAttribute("log", conversation);
		model.addAttribute("customer", customer);
		return "conversation/index";
	}
	
	@RequestMapping(value = "/log/delete/{logId}", method = RequestMethod.GET)
	public void showDeleteLogForm(@PathVariable Integer logId, PrintWriter out) {

		Conversation conversation = customerService.getConversation(logId);
		customerService.deleteConversation(conversation);
		out.write("");
		out.flush();
		out.close();
	}
	

	@RequestMapping(value = "/log/save", method = RequestMethod.POST)
    public ModelAndView processAddLogForm(@ModelAttribute Conversation conversation, Model model) {
       
		if(conversation.getContactDate() == null) {
			conversation.setContactDate(new Date());
		}
		customerService.createConversation(null, conversation);
		return new ModelAndView("redirect:/customer/"+conversation.getCustomerId());
    }
	
}
