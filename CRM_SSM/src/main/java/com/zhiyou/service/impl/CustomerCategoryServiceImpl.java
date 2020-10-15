package com.zhiyou.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.zhiyou.dao.CustomerCategoryDao;
import com.zhiyou.model.CustomerCategory;
import com.zhiyou.service.CustomerCategoryService;

@Service
public class CustomerCategoryServiceImpl implements CustomerCategoryService {

	@Autowired
	private CustomerCategoryDao categoryDao;

	public List<CustomerCategory> selectAllCustomerCategory() {
		return categoryDao.selectAllCustomerCategory();
	}

	public PageInfo<CustomerCategory> selectByKeyword(int pageNo, String keyword, String colName) {
		return null;
	}

	public void delete(int customerCategoryId) {
		categoryDao.delete(customerCategoryId);
	}

	public void update(CustomerCategory customerCategory) {
		categoryDao.update(customerCategory);
	}

	public void add(CustomerCategory customerCategory) {
		categoryDao.add(customerCategory);
	}

	public CustomerCategory selectByCustomerCategoryId(int customerCategoryId) {
		return categoryDao.selectByCustomerCategoryId(customerCategoryId);
	}

	public boolean checkCategoryNameExist(String customer_category_name) {
		CustomerCategory category = categoryDao.selectByCustomerCategoryName(customer_category_name);
		if (category != null) {// 如果category不为空 说明已存在此分类名
			return false;
		} else {// 反之此用户名可用
			return true;
		}
	}

}
