package com.zhiyou.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.zhiyou.model.CustomerState;

public interface CustomerStateService {
	
	List<CustomerState> selectAllCustomerState();
	
	PageInfo<CustomerState> selectByKeyword(int pageNo, String keyword, String colName);
	
	void delete(int customerStateId);
	
	void update(CustomerState customerState);
	
	void add(CustomerState customerState);
	
	CustomerState selectByCustomerStateId(int customerStateId);

	boolean checkCustomerStateNameExist(String customer_state_name);
	
}
