package com.zhiyou.dao;

import java.util.List;

import com.zhiyou.model.CustomerLinkRecord;

public interface CustomerLinkRecordDao {
	
	List<CustomerLinkRecord> selectByKeyword(int pageNo, String keyword, String colName);
	
	void delete(int recordId);
	
	void update(CustomerLinkRecord customerLinkRecord);
	
	void add(CustomerLinkRecord customerLinkRecord);
	
	CustomerLinkRecord selectByCustomerLinkRecordId(int recordId);
	
	int selectCustomerLinkRecordCount(String keyword, String colName);
	
}
