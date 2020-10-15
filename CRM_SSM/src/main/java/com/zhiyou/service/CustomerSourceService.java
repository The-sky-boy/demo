package com.zhiyou.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.zhiyou.model.CustomerSource;

public interface CustomerSourceService {
	
	List<CustomerSource> selectAllCustomerSource();
	
	PageInfo<CustomerSource> selectByKeyword(int pageNo, String keyword, String colName);
	
	void delete(int customerSourceId);
	
	void update(CustomerSource customerSource);
	
	void add(CustomerSource customerSource);
	
	CustomerSource selectByCustomerSourceId(int customerSourceId);
	
	boolean checkCustomerSourceNameExist(String customer_source_name);
}
