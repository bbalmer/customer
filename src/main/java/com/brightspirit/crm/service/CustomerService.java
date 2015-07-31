package com.brightspirit.crm.service;

import java.util.List;

import com.brightspirit.crm.model.Conversation;
import com.brightspirit.crm.model.Customer;
import com.brightspirit.crm.model.Reminder;

public interface CustomerService {

	Customer getCustomer(Integer id);
	List<Customer> getCustomers();
	Integer saveCustomer(Customer customer);
	void updateCustomer(Customer customer);
	void deleteCustomer(Customer customer);
	List<Customer> searchByName(String query);
	
	Integer createConversation(Customer customer, Conversation conversation);
	List<Conversation> listConversationsForCustomer(Integer customerId);
	Conversation getConversation(Integer id);
	void deleteConversation(Conversation conversation);
	List<Conversation> listConversations();
	
	Integer addReminder(Customer customer, Reminder reminder);
	List<Reminder> listReminders(int limitDaysBack, boolean includeAcknowledged);
	void updateReminder(Reminder reminder); 
	void acknowledgeReminder(Integer reminderId);
	List<Reminder> listNonAcknowledgedByCustomer(Integer customerId);
	Reminder getReminder(Integer id);
	void deleteReminder(Reminder reminder);
}
