package com.zhiyou.dao;

import java.util.List;

import com.zhiyou.model.CustomerLink;

public interface CustomerLinkDao {

	List<CustomerLink> selectByKeyword(int pageNo, String keyword, String colName);
	
	void delete(int linkId);
	
	void update(CustomerLink customerLink);
	
	void add(CustomerLink customerLink);
	
	CustomerLink selectByCustomerLinkId(int linkId);
	
	int selectCustomerLinkCount(String keyword, String colName);
	
	
}
