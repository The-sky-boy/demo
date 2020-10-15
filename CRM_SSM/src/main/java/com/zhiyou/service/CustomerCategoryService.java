package com.zhiyou.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.zhiyou.model.CustomerCategory;

public interface CustomerCategoryService {
	
	List<CustomerCategory> selectAllCustomerCategory();
	
	PageInfo<CustomerCategory> selectByKeyword(int pageNo, String keyword, String colName);
	
	void delete(int customerCategoryId);
	
	void update(CustomerCategory customerCategory);
	
	void add(CustomerCategory customerCategory);
	
	CustomerCategory selectByCustomerCategoryId(int customerCategoryId);

	boolean checkCategoryNameExist(String customer_category_name);
	
	
}
