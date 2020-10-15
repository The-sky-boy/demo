package com.zhiyou.dao;

import java.util.List;

import com.zhiyou.model.CustomerSource;

public interface CustomerSourceDao {

	List<CustomerSource> selectAllCustomerSource();

	List<CustomerSource> selectByKeyword(int pageNo, String keyword, String colName);
	
	void delete(int customerSourceId);
	
	void update(CustomerSource customerSource);
	
	void add(CustomerSource customerSource);
	
	CustomerSource selectByCustomerSourceId(int customerSourceId);
	
	int selectCustomerSourceCount(String keyword, String colName);
	
	CustomerSource selectByCustomerSourceName(String customer_source_name);

}
