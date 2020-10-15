package com.zhiyou.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.zhiyou.dao.DepartmentDao;
import com.zhiyou.model.Department;
import com.zhiyou.service.DepartmentService;

@Service
public class DepartmentServiceImpl implements DepartmentService {
	@Autowired
	private DepartmentDao departmentDao;

	// 返回所有部门
	public List<Department> selectAllDept() {
		return departmentDao.select(new Department());
	}

	// 模糊查询（分页）
	public PageInfo<Department> selectByKeyword(int pageNo, String keyword) {
		return null;
	}

	// 通过id删除
	public void delete(int deptId) {
		departmentDao.delete(deptId);
	}

	// 修改
	public void update(Department dept) {
		departmentDao.update(dept);
	}

	// 添加
	public void add(Department dept) {
		departmentDao.add(dept);
	}

	// 通过id查询
	public Department selectByDeptId(int deptId) {
		return departmentDao.selectByDeptId(deptId);
	}

	public boolean checkUsernameExist(String department_name) {
		Department department = departmentDao.selectDeptName(department_name);
		if (department != null) {// 如果department不为空 说明已存在此部门
			return false;
		} else {// 反之此部门不存在
			return true;
		}
	}

}
