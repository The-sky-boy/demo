package com.zhiyou.model;

import java.sql.Timestamp;
/**
 * 部门
 */
public class Department {

	private Integer department_id;		//部门ID
	private String department_name;		//部门名称
	private String department_desc;		//部门描述
	private Integer status;				//部门状态
	private String remark;				//操作备注
	private Timestamp create_time;		//添加时间
	private Integer creater;			//添加人
	private Timestamp update_time;		//修改时间
	private Integer updater;			//修改人
	
	public Department(Integer department_id, String department_name, String department_desc, Integer status,
			String remark, Timestamp create_time, Integer creater, Timestamp update_time, Integer updater) {
		super();
		this.department_id = department_id;
		this.department_name = department_name;
		this.department_desc = department_desc;
		this.status = status;
		this.remark = remark;
		this.create_time = create_time;
		this.creater = creater;
		this.update_time = update_time;
		this.updater = updater;
	}
	public Department() {
	}	
	
	public Integer getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(Integer department_id) {
		this.department_id = department_id;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	public String getDepartment_desc() {
		return department_desc;
	}
	public void setDepartment_desc(String department_desc) {
		this.department_desc = department_desc;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Timestamp getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Timestamp create_time) {
		this.create_time = create_time;
	}
	public Integer getCreater() {
		return creater;
	}
	public void setCreater(Integer creater) {
		this.creater = creater;
	}
	public Timestamp getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(Timestamp update_time) {
		this.update_time = update_time;
	}
	public Integer getUpdater() {
		return updater;
	}
	public void setUpdater(Integer updater) {
		this.updater = updater;
	}
	@Override
	public String toString() {
		return "Department [department_id=" + department_id + ", department_name=" + department_name
				+ ", department_desc=" + department_desc + ", status=" + status + ", remark=" + remark
				+ ", create_time=" + create_time + ", creater=" + creater + ", update_time=" + update_time
				+ ", updater=" + updater + "]";
	}

}
