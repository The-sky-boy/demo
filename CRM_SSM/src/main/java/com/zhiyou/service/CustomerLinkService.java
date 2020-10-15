package com.zhiyou.service;

import com.github.pagehelper.PageInfo;
import com.zhiyou.model.CustomerLink;

public interface CustomerLinkService {

	PageInfo<CustomerLink> selectByKeyword(int pageNo, String keyword, String colName);
	
	void delete(int linkId);
	
	void update(CustomerLink customerLink);
	
	void add(CustomerLink customerLink);
	
	CustomerLink selectByCustomerLinkId(int linkId);
	
}
