package com.brightspirit.crm.dao;

import java.util.List;

import com.brightspirit.crm.model.Customer;

public interface CustomerDao {

	Integer createCustomer(Customer customer);

	List<Customer> findAllCusomers();
	
	Customer findById(Integer id);
	
	void updateCustomer(Customer customer);
	
	void deleteCustomer(Customer customer);
	
	List<Customer> searchByName(String q);
}
