package com.zhiyou.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.zhiyou.dao.RoleDao;
import com.zhiyou.model.Role;
import com.zhiyou.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleDao roleDao;

	// 查询所有的角色信息（不分页，用于制作select下拉框）
	public List<Role> selectAllRole() {
		return roleDao.select(new Role());
	}

	// 分页查询角色信息（可模糊）
	public PageInfo<Role> selectByKeyword(int pageNo, String keyword) {
		return null;
	}

	// 删除角色
	public void delete(int roleId) {
		roleDao.delete(roleId);
	}

	// 更新角色信息
	public void update(Role role) {
		roleDao.update(role);
	}

	// 添加角色
	public void add(Role role) {
		roleDao.add(role);
	}

	// 通过id查询角色信息
	public Role selectByRoleId(int roleId) {
		return roleDao.selectByRoleId(roleId);
	}

	public boolean checkRoleNameExist(String role_name) {
		Role role = roleDao.selectByRoleName(role_name);
		if (role != null) {// 如果role不为空 说明已存在此用户名
			return false;
		} else {// 反之此用户名可用
			return true;
		}
	}

}
