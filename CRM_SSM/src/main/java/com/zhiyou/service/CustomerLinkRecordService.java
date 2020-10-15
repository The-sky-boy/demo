package com.zhiyou.service;

import com.github.pagehelper.PageInfo;
import com.zhiyou.model.CustomerLinkRecord;

public interface CustomerLinkRecordService {

	PageInfo<CustomerLinkRecord> selectByKeyword(int pageNo, String keyword, String colName);
	
	void delete(int recordId);
	
	void update(CustomerLinkRecord customerLinkRecord);
	
	void add(CustomerLinkRecord customerLinkRecord);
	
	CustomerLinkRecord selectByCustomerLinkRecordId(int recordId);
	
}
