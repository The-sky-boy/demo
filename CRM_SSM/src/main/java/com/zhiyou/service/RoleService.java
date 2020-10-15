package com.zhiyou.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.zhiyou.model.Role;

public interface RoleService {

	List<Role> selectAllRole();
	
	PageInfo<Role> selectByKeyword(int pageNo, String keyword);
	
	void delete(int roleId);
	
	void update(Role role);
	
	void add(Role role);
	
	Role selectByRoleId(int roleId);

	boolean checkRoleNameExist(String role_name);
}
