package com.zhiyou.dao;

import java.util.List;

import com.zhiyou.model.CustomerState;

public interface CustomerStateDao {

	List<CustomerState> selectAllCustomerState();
	
	List<CustomerState> selectByKeyword(int pageNo, String keyword, String colName);
	
	void delete(int customerStateId);
	
	void update(CustomerState customerState);
	
	void add(CustomerState customerState);
	
	CustomerState selectByCustomerStateId(int customerStateId);
	
	int selectCustomerStateCount(String keyword, String colName);

	CustomerState selectByCustomerStateName(String customer_state_name);

}
