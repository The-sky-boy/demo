package com.zhiyou.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zhiyou.dao.UserDao;
import com.zhiyou.model.User;
import com.zhiyou.service.UserService;
import com.zhiyou.utils.Md5Utils;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserDao userDao;

	public User login(User user) {
		user.setPassword(Md5Utils.md5(user.getPassword()));
		List<User> list = userDao.select(user);
		return list.size()==0?null:list.get(0);
	}

	public PageInfo<User> selectByKeyword(int pageNo, String keyword) {
		PageHelper.startPage(pageNo,5);
		List<User> list = userDao.selectLike(keyword);
		return new PageInfo<User>(list);
	}

	public void delete(int userId) {
		userDao.delete(userId);
	}

	public void update(User user) {
		user.setPassword(Md5Utils.md5(user.getPassword()));
		userDao.update(user);
	}

	public void add(User user) {
		user.setPassword(Md5Utils.md5(user.getPassword()));
		userDao.add(user);
	}

	public User selectByUserId(int userId) {
		User user = new User();
		user.setUser_id(userId);
		List<User> list = userDao.select(user);
		return list.size()==0?null:list.get(0);
	}
//
//	public List<User> selectAllUser() {
//		return userDao.selectAllUser();
//	}
//
//	public void changePswd(String password, int user_id) {
//		userDao.changePswd(password, user_id);
//	}
//
//	public void changePersonalInfo(User user) {
//		userDao.changePersonalInfo(user);
//	}
//
//	public boolean checkUsernameExist(String username) {
//		User user = userDao.selectByUsername(username);
//		if (user != null) {// 如果user不为空 说明已存在此用户名
//			return false;
//		} else {// 反之此用户名可用
//			return true;
//		}
//	}
//
//	public boolean checkMobileExist(String mobile) {
//		User user = userDao.selectByMobile(mobile);
//		if (user != null) {// 如果user不为空 说明已存在此手机号
//			return false;
//		} else {// 反之此用户名可用
//			return true;
//		}
//	}
//
//	public boolean checkIdNumExist(String id_num) {
//		User user = userDao.selectByIdNum(id_num);
//		if (user != null) {// 如果user不为空 说明已存在此身份证号
//			return false;
//		} else {// 反之此用户名可用
//			return true;
//		}
//	}
//
//	public boolean checkCardNumExist(String card_num) {
//		User user = userDao.selectByCardNum(card_num);
//		if (user != null) {// 如果user不为空 说明已存在此工资卡号
//			return false;
//		} else {// 反之此用户名可用
//			return true;
//		}
//	}
//
//	public boolean checkEmailExist(String email) {
//		User user = userDao.selectByEmail(email);
//		if (user != null) {// 如果user不为空 说明已存在此邮箱
//			return false;
//		} else {// 反之此用户名可用
//			return true;
//		}
//	}
}
