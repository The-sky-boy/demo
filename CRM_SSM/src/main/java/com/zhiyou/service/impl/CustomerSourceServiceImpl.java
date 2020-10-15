package com.zhiyou.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.zhiyou.dao.CustomerSourceDao;
import com.zhiyou.model.CustomerSource;
import com.zhiyou.service.CustomerSourceService;

@Service
public class CustomerSourceServiceImpl implements CustomerSourceService {

	@Autowired
	private CustomerSourceDao sourceDao;

	public List<CustomerSource> selectAllCustomerSource() {
		return sourceDao.selectAllCustomerSource();
	}

	public PageInfo<CustomerSource> selectByKeyword(int pageNo, String keyword, String colName) {
		return null;
	}

	public void delete(int customerSourceId) {
		sourceDao.delete(customerSourceId);
	}

	public void update(CustomerSource customerSource) {
		sourceDao.update(customerSource);
	}

	public void add(CustomerSource customerSource) {
		sourceDao.add(customerSource);
	}

	public CustomerSource selectByCustomerSourceId(int customerSourceId) {
		return sourceDao.selectByCustomerSourceId(customerSourceId);
	}

	public boolean checkCustomerSourceNameExist(String customer_source_name) {
		CustomerSource source = sourceDao.selectByCustomerSourceName(customer_source_name);
		if (source != null) {// 如果source不为空 说明已存在此分类名
			return false;
		} else {// 反之此用户名可用
			return true;
		}
	}
}
