package com.brightspirit.crm.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.brightspirit.crm.model.Reminder;

@Repository("reminderDao")
public class ReminderDao  extends BaseDao<Reminder, Integer> {

	public Integer create(Reminder reminder) {
		return create(reminder);
	}
	
	public void updateReminder(Reminder reminder) {
		update(reminder);
	}
	
	public Reminder getById(Integer id) {
		Reminder reminder = (Reminder) sessionFactory.getCurrentSession().get(Reminder.class, id);
		return reminder;
	}
	
	@SuppressWarnings("unchecked")
	public List<Reminder> listNonAckForCustomer(Integer customerId) {
		
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Reminder.class);
		criteria.add(Restrictions.eq("ack", new Boolean(false)));
		criteria.add(Restrictions.eq("customerId", customerId));
		criteria.addOrder(Order.asc("dueDt"));
		return criteria.list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Reminder> findSinceDate(Date since, boolean includeAcknowledged) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Reminder.class);
		if(since != null) {
			Criterion current = Restrictions.and(Restrictions.ge("dueDt", since), Restrictions.eq("ack", false));
			Criterion past = Restrictions.and(Restrictions.le("dueDt", since), Restrictions.eq("ack", false));
			criteria.add(Restrictions.or(current, past));
		}
		if(!includeAcknowledged) {
			criteria.add(Restrictions.eq("ack", new Boolean(false)));
		}
		if(includeAcknowledged)
			criteria.addOrder(Order.desc("dueDt"));
		else
			criteria.addOrder(Order.asc("dueDt"));
		
		return criteria.list();
	}
	
}
