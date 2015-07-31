package com.brightspirit.crm.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("customerDao")
public abstract class BaseDao<T, ID extends Serializable> {

	@Autowired
	protected SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public ID insert(T obj) {
        Serializable id = sessionFactory.getCurrentSession().save(obj);
        return (ID)id;
	}

	@SuppressWarnings("unchecked")
	public List<T> listAll(T type) {
        Session session = sessionFactory.getCurrentSession();
        return session.createCriteria(type.getClass()).list();
	}

	@SuppressWarnings("unchecked")
	public Object findById(ID id, T type) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(type.getClass());
		criteria.add(Restrictions.eq("id", id));
		List<T> value = criteria.list();
		if(value != null && value.size() > 0)
			return value.get(0);
		else return null;
	}

	public void update(T obj) {
		sessionFactory.getCurrentSession().update(obj);
	}

	public void delete(T obj) {
		sessionFactory.getCurrentSession().delete(obj);
	}

}
