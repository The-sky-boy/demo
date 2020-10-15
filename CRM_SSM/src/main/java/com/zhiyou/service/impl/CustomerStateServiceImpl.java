package com.zhiyou.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.zhiyou.dao.CustomerStateDao;
import com.zhiyou.model.CustomerState;
import com.zhiyou.service.CustomerStateService;

@Service
public class CustomerStateServiceImpl implements CustomerStateService {
	@Autowired
	private CustomerStateDao stateDao;

	public List<CustomerState> selectAllCustomerState() {
		return stateDao.selectAllCustomerState();
	}

	public PageInfo<CustomerState> selectByKeyword(int pageNo, String keyword, String colName) {
		return null;
	}

	public void delete(int customerStateId) {
		stateDao.delete(customerStateId);
	}

	public void update(CustomerState customerState) {
		stateDao.update(customerState);
	}

	public void add(CustomerState customerState) {
		stateDao.add(customerState);
	}

	public CustomerState selectByCustomerStateId(int customerStateId) {
		return stateDao.selectByCustomerStateId(customerStateId);
	}

	public boolean checkCustomerStateNameExist(String customer_state_name) {
		CustomerState state = stateDao.selectByCustomerStateName(customer_state_name);
		if (state != null) {// 如果state不为空 说明已存在此分类名
			return false;
		} else {// 反之此用户名可用
			return true;
		}
	}

}
