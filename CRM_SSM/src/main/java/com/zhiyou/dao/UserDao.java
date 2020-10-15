package com.zhiyou.dao;

import java.util.List;

import com.zhiyou.model.User;

public interface UserDao {
	
	List<User> select(User user);
	
	List<User> selectLike(String keyword);
	
	void delete(int userId);
	
	void update(User user);
	
	void add(User user);

}
