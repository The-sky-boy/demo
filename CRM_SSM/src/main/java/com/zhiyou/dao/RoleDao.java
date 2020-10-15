package com.zhiyou.dao;

import java.util.List;

import com.zhiyou.model.Role;

public interface RoleDao {

	List<Role> select(Role role);

	List<Role> selectByKeyword(int pageNo, String keyword);
	
	void delete(int roleId);
	
	void update(Role role);
	
	void add(Role role);
	
	Role selectByRoleId(int roleId);
	
	int selectRoleCount(String keyword);

	Role selectByRoleName(String role_name);
}
