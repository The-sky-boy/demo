package com.zhiyou.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.zhiyou.dao.CustomerLinkDao;
import com.zhiyou.model.CustomerLink;
import com.zhiyou.service.CustomerLinkService;

@Service
public class CustomerLinkServiceImpl implements CustomerLinkService {
	@Autowired
	private CustomerLinkDao linkDao;

	public PageInfo<CustomerLink> selectByKeyword(int pageNo, String keyword, String colName) {
		return null;
	}

	public void delete(int linkId) {
		linkDao.delete(linkId);
	}

	public void update(CustomerLink customerLink) {
		linkDao.update(customerLink);
	}

	public void add(CustomerLink customerLink) {
		linkDao.add(customerLink);
	}

	public CustomerLink selectByCustomerLinkId(int linkId) {
		return linkDao.selectByCustomerLinkId(linkId);
	}

}
