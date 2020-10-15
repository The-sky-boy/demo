package com.zhiyou.dao;

import java.util.List;

import com.zhiyou.model.Customer;

public interface CustomerDao {

	List<Customer> selectByKeyword(int pageNo, String keyword, String colName);
	
	void delete(int customerId);
	
	void update(Customer customer);
	
	void add(Customer customer);
	
	Customer selectByCustomerId(int customerId);
	
	int selectCustomerCount(String keyword, String colName);
	
	List<Customer> selectAllCustomer();

	Customer selectByMobile(String customer_mobile);

	Customer selectByBlog(String customer_blog);

	Customer selectByEmail(String customer_email);

	Customer selectByQQ(String customer_qq);

	
}
