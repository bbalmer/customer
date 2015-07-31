package com.brightspirit.crm.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.brightspirit.crm.dao.ConversationDao;
import com.brightspirit.crm.dao.CustomerDao;
import com.brightspirit.crm.dao.ReminderDao;
import com.brightspirit.crm.model.Conversation;
import com.brightspirit.crm.model.Customer;
import com.brightspirit.crm.model.Reminder;

@Service("customerService")
@Transactional
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerDao customerDao;
	
	@Autowired
	private ConversationDao conversationDao;
	
	@Autowired
	private ReminderDao reminderDao;
	
	@Override
	public Customer getCustomer(Integer id) {
		return customerDao.findById(id);
	}

	@Override
	public List<Customer> getCustomers() {
		return customerDao.findAllCusomers();
	}

	@Override
	public Integer saveCustomer(Customer customer) {
		if(customer.getId() > 0) {
			customerDao.updateCustomer(customer);
			return customer.getId();
		} else {
			return customerDao.createCustomer(customer);
		}
	}
	
	@Override
	public void updateCustomer(Customer customer) {
		customerDao.updateCustomer(customer);
	}

	@Override
	public void deleteCustomer(Customer customer) {
		customerDao.deleteCustomer(customer);
	}
	
	@Override
	public List<Customer> searchByName(String query) {
		return customerDao.searchByName(query);
	}
	
	@Override
	public Integer createConversation(Customer customer,
			Conversation conversation) {
		if(customer != null)
			conversation.setCustomerId(customer.getId());
		if(conversation.getId() == 0) {
			return conversationDao.create(conversation);
		} else {
			conversationDao.save(conversation);
			return conversation.getId();
		}
	}
	
	@Override
	public List<Conversation> listConversationsForCustomer(Integer customerId) {
		return conversationDao.listByCustomerId(customerId);
	}
	
	@Override
	public List<Conversation> listConversations() {
		return conversationDao.listAll();
	}
	
	@Override
	public Conversation getConversation(Integer id) {
		return conversationDao.findById(id);
	}

	@Override
	public void deleteConversation(Conversation conversation) {
		conversationDao.deleteLog(conversation);
	}
	
	
	@Override
	public Integer addReminder(Customer customer, Reminder reminder) {
		if(customer != null)
			reminder.setCustomerId(customer.getId());
		return reminderDao.insert(reminder);
	}
	
	@Override
	public void updateReminder(Reminder reminder) {
		reminderDao.update(reminder);
	}
	
	@Override
	public List<Reminder> listReminders(int limitDaysBack, boolean includeAcknowledged) {
		Date sinceDate = null;
		if(limitDaysBack != 0) {
			Calendar now = GregorianCalendar.getInstance();
			now.add(Calendar.DATE, -limitDaysBack);
			sinceDate = now.getTime();
		}
		
		List<Reminder> reminders = reminderDao.findSinceDate(sinceDate, includeAcknowledged);

		for (Reminder reminder : reminders) {
			if (reminder.getCustomerId() > 0) {
				try {
					int customerId = reminder.getCustomerId();
					if (customerId > 0) {
						Customer customer = getCustomer(customerId);
						reminder.setCustomer(customer);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		return reminders;

	}

	@Override
	public void acknowledgeReminder(Integer reminderId) {
		Reminder reminder = reminderDao.getById(reminderId);
		reminder.setAck(true);
		reminderDao.updateReminder(reminder);
	}
	
	@Override
	public List<Reminder> listNonAcknowledgedByCustomer(Integer customerId) {
		if(customerId != null && customerId.intValue() > 0) 
			return reminderDao.listNonAckForCustomer(customerId);
		else
			return new ArrayList<Reminder>();
	}
	
	@Override
	public Reminder getReminder(Integer id) {
		return reminderDao.getById(id);
	}
	
	@Override
	public void deleteReminder(Reminder reminder) {
		reminderDao.delete(reminder);
	}
}
