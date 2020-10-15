package com.zhiyou.dao;

import java.util.List;

import com.zhiyou.model.CustomerCare;

public interface CustomerCareDao {

	List<CustomerCare> selectByKeyword(int pageNo, String keyword, String colName);
	
	void delete(int customerCareId);
	
	void update(CustomerCare customerCare);
	
	void add(CustomerCare customerCare);
	
	CustomerCare selectByCustomerCareId(int customerCareId);
	
	int selectCustomerCareCount(String keyword, String colName);
	
}
