package com.brightspirit.crm.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.brightspirit.crm.model.Conversation;

@Repository("conversationDao")
public class ConversationDao extends BaseDao<Conversation, Integer> {

	public Integer create(Conversation obj) {
		return insert(obj);
	}
	
	public Conversation findById(Integer id) {
		return (Conversation)sessionFactory.getCurrentSession().get(Conversation.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<Conversation> listAll() {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Conversation.class);
		criteria.addOrder(Order.desc("contactDate"));
		return criteria.list();
	}
	
	public void save(Conversation obj) {
		update(obj);
	}
	
	public void deleteLog(Conversation obj) {
		delete(obj);
	}
	
	@SuppressWarnings("unchecked")
	public List<Conversation> listByCustomerId(Integer id) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Conversation.class);
		criteria.add(Restrictions.eq("customerId", id));
		criteria.addOrder(Order.desc("contactDate"));
		return criteria.list();
	}
}
