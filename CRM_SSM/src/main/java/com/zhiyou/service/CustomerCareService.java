package com.zhiyou.service;

import com.github.pagehelper.PageInfo;
import com.zhiyou.model.CustomerCare;

public interface CustomerCareService {

	PageInfo<CustomerCare> selectByKeyword(int pageNo, String keyword, String colName);
	
	void delete(int customerCareId);
	
	void update(CustomerCare customerCare);
	
	void add(CustomerCare customerCare);
	
	CustomerCare selectByCustomerCareId(int customerCareId);
}
