package com.zhiyou.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.zhiyou.model.Customer;

public interface CustomerService {
	PageInfo<Customer> selectByKeyword(int pageNo, String keyword, String colName);
	
	void delete(int customerId);
	
	void update(Customer customer);
	
	void add(Customer customer);
	
	Customer selectByCustomerId(int customerId);
	
	List<Customer> selectAllCustomer();

	boolean checkMobileExist(String customer_mobile);

	boolean checkBlogExist(String customer_blog);

	boolean checkEmailExist(String customer_email);

	boolean checkQQExist(String customer_qq);
}
