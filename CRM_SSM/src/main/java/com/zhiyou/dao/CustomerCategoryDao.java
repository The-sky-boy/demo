package com.zhiyou.dao;

import java.util.List;

import com.zhiyou.model.CustomerCategory;


public interface CustomerCategoryDao {

	List<CustomerCategory> selectAllCustomerCategory();

	List<CustomerCategory> selectByKeyword(int pageNo, String keyword, String colName);
	
	void delete(int customerCategoryId);
	
	void update(CustomerCategory customerCategory);
	
	void add(CustomerCategory customerCategory);
	
	CustomerCategory selectByCustomerCategoryId(int customerCategoryId);
	
	int selectCustomerCategoryCount(String keyword, String colName);

	CustomerCategory selectByCustomerCategoryName(String customer_category_name);
	
}
