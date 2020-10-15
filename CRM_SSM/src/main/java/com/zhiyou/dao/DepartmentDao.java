package com.zhiyou.dao;

import java.util.List;

import com.zhiyou.model.Department;

public interface DepartmentDao {

	List<Department> select(Department department);
	
	List<Department> selectByKeyword(int pageNo, String keyword);
	
	void delete(int deptId);
	
	void update(Department dept);
	
	void add(Department dept);
	
	Department selectByDeptId(int deptId);
	
	int selectDeptCount(String keyword);

	Department selectDeptName(String department_name);
}
