package com.zhiyou.service;

import com.github.pagehelper.PageInfo;
import com.zhiyou.model.User;

public interface UserService {

	User login(User user);
	
	PageInfo<User> selectByKeyword(int pageNo, String keyword);
	
	void delete(int userId);
	
	void update(User user);
	
	void add(User user);
	
	User selectByUserId(int userId);
//
//	List<User> selectAllUser();
//
//	void changePswd(String password, int user_id);
//	
//	void changePersonalInfo(User user);
//	
//	boolean checkUsernameExist(String username);
//
//	boolean checkMobileExist(String mobile);
//
//	boolean checkIdNumExist(String id_num);
//
//	boolean checkCardNumExist(String card_num);
//
//	boolean checkEmailExist(String email);
}
