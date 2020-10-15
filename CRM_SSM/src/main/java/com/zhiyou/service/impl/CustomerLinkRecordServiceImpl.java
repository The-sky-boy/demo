package com.zhiyou.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.zhiyou.dao.CustomerLinkRecordDao;
import com.zhiyou.model.CustomerLinkRecord;
import com.zhiyou.service.CustomerLinkRecordService;

@Service
public class CustomerLinkRecordServiceImpl implements CustomerLinkRecordService {
	@Autowired
	private CustomerLinkRecordDao recordDao;

	public PageInfo<CustomerLinkRecord> selectByKeyword(int pageNo, String keyword, String colName) {
		return null;
	}

	public void delete(int recordId) {
		recordDao.delete(recordId);
	}

	public void update(CustomerLinkRecord customerLinkRecord) {
		recordDao.update(customerLinkRecord);
	}

	public void add(CustomerLinkRecord customerLinkRecord) {
		recordDao.add(customerLinkRecord);
	}

	public CustomerLinkRecord selectByCustomerLinkRecordId(int recordId) {
		return recordDao.selectByCustomerLinkRecordId(recordId);
	}

}
