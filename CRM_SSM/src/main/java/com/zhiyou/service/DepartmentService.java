package com.zhiyou.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.zhiyou.model.Department;

public interface DepartmentService {

	List<Department> selectAllDept();
	
	PageInfo<Department> selectByKeyword(int pageNo, String keyword);
	
	void delete(int deptId);
	
	void update(Department dept);
	
	void add(Department dept);
	
	Department selectByDeptId(int deptId);

	boolean checkUsernameExist(String department_name);
}
