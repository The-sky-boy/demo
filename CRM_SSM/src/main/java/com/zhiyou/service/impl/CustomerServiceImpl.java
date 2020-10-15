package com.zhiyou.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.zhiyou.dao.CustomerDao;
import com.zhiyou.model.Customer;
import com.zhiyou.service.CustomerService;

@Service
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	private CustomerDao customerDao;

	// 模糊查询
	public PageInfo<Customer> selectByKeyword(int pageNo, String keyword, String colName) {
		return null;
	}

	// 删除
	public void delete(int customerId) {
		customerDao.delete(customerId);
	}

	// 更新
	public void update(Customer customer) {
		customerDao.update(customer);
	}

	// 添加
	public void add(Customer customer) {
		customerDao.add(customer);
	}

	// 通过客户的id查询
	public Customer selectByCustomerId(int customerId) {
		return customerDao.selectByCustomerId(customerId);
	}

	public List<Customer> selectAllCustomer() {
		return customerDao.selectAllCustomer();
	}

	public boolean checkMobileExist(String customer_mobile) {
		Customer customer = customerDao.selectByMobile(customer_mobile);
		if (customer != null) {// 如果customer不为空 说明已存在此手机号
			return false;
		} else {// 反之此用户名可用
			return true;
		}
	}

	public boolean checkBlogExist(String customer_blog) {
		Customer customer = customerDao.selectByBlog(customer_blog);
		if (customer != null) {// 如果customer不为空 说明已存在此微博
			return false;
		} else {// 反之此用户名可用
			return true;
		}
	}

	public boolean checkEmailExist(String customer_email) {
		Customer customer = customerDao.selectByEmail(customer_email);
		if (customer != null) {// 如果customer不为空 说明已存在此邮箱
			return false;
		} else {// 反之此用户名可用
			return true;
		}
	}

	public boolean checkQQExist(String customer_qq) {
		Customer customer = customerDao.selectByQQ(customer_qq);
		if (customer != null) {// 如果customer不为空 说明已存在此QQ
			return false;
		} else {// 反之此用户名可用
			return true;
		}
	}

}
