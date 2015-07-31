package com.brightspirit.crm.dao;

import java.io.Serializable;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.brightspirit.crm.model.Customer;

@Repository("customerDao")
public class CustomerDaoImpl implements CustomerDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public Integer createCustomer(Customer customer) {
        Serializable id = sessionFactory.getCurrentSession().save(customer);
        return (Integer)id;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Customer> findAllCusomers() {
        Session session = sessionFactory.getCurrentSession();
        return session.createCriteria(Customer.class).list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Customer findById(Integer id) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Customer.class);
		criteria.add(Restrictions.eq("id", id));
		List<Customer> value = criteria.list();
		if(value != null && value.size() > 0)
			return value.get(0);
		else return null;
	}

	@Override
	public void updateCustomer(Customer customer) {
		sessionFactory.getCurrentSession().update(customer);
	}

	@Override
	public void deleteCustomer(Customer customer) {
		sessionFactory.getCurrentSession().delete(customer);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Customer> searchByName(String q) {
		String query = StringUtils.trimToEmpty(q);
		if(query.length() == 0)
			return null;
		
		query += "%";
		
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Customer.class);
		Criterion a = Restrictions.like("firstName", query);		
		Criterion b = Restrictions.like("lastName", query);
		
		criteria.add(Restrictions.or(a, b));	
		return criteria.list();
	}
}
