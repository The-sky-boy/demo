package com.zhiyou.model;

import java.sql.Timestamp;
/**
 * 客户状态
 */
public class CustomerState {

	private Integer customer_state_id;	//状态id
	private String customer_state_name;	//状态名称
	private String customer_state_desc;	//状态描述
	private Integer status;				//状态
	private String remark;				//备注
	private Timestamp create_time;		//添加时间
	private Integer creater;			//添加人
	private Timestamp update_time;		//修改时间
	private Integer updater;			//修改人
	
	public CustomerState() {
	}
	
	public CustomerState(Integer customer_state_id, String customer_state_name, String customer_state_desc,
			Integer status, String remark, Timestamp create_time, Integer creater, Timestamp update_time,
			Integer updater) {
		this.customer_state_id = customer_state_id;
		this.customer_state_name = customer_state_name;
		this.customer_state_desc = customer_state_desc;
		this.status = status;
		this.remark = remark;
		this.create_time = create_time;
		this.creater = creater;
		this.update_time = update_time;
		this.updater = updater;
	}

	public Integer getCustomer_state_id() {
		return customer_state_id;
	}
	public void setCustomer_state_id(Integer customer_state_id) {
		this.customer_state_id = customer_state_id;
	}
	public String getCustomer_state_name() {
		return customer_state_name;
	}
	public void setCustomer_state_name(String customer_state_name) {
		this.customer_state_name = customer_state_name;
	}
	public String getCustomer_state_desc() {
		return customer_state_desc;
	}
	public void setCustomer_state_desc(String customer_state_desc) {
		this.customer_state_desc = customer_state_desc;
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
		return "CustomerState [customer_state_id=" + customer_state_id + ", customer_state_name=" + customer_state_name
				+ ", customer_state_desc=" + customer_state_desc + ", status=" + status + ", remark=" + remark
				+ ", create_time=" + create_time + ", creater=" + creater + ", update_time=" + update_time
				+ ", updater=" + updater + "]";
	}
	
}
