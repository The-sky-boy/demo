package com.zhiyou.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.zhiyou.dao.CustomerCareDao;
import com.zhiyou.model.CustomerCare;
import com.zhiyou.service.CustomerCareService;

@Service
public class CustomerCareServiceImpl implements CustomerCareService {

	@Autowired
	private CustomerCareDao customerCareDao;

	public PageInfo<CustomerCare> selectByKeyword(int pageNo, String keyword, String colName) {
		return null;
	}

	public void delete(int customerCareId) {
		customerCareDao.delete(customerCareId);
	}

	public void update(CustomerCare customerCare) {
		customerCareDao.update(customerCare);
	}

	public void add(CustomerCare customerCare) {

		customerCareDao.add(customerCare);

	}

	public CustomerCare selectByCustomerCareId(int customerCareId) {
		return customerCareDao.selectByCustomerCareId(customerCareId);
	}

}
