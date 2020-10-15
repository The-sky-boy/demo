package com.zhiyou.model;

import java.sql.Timestamp;
/**
 * 客户关怀
 */
public class CustomerCare {

	
	private Integer customer_care_id;	//客户关怀ID
	private Integer customer_id;		//客户ID
	private String care_subject;		//关怀主题
	private String care_type;			//关怀方式
	private Integer status;				//状态			
	private String remark;				//备注
	private Timestamp next_time;		//下次关怀时间
	private Timestamp create_time;		//添加时间
	private Integer creater;			//添加人
	private Timestamp update_time;		//修改时间
	private Integer updater;			//修改人
	
	public CustomerCare() {
		
	}

	public CustomerCare(Integer customer_care_id, Integer customer_id, String care_subject, String care_type,
			Integer status, String remark, Timestamp next_time, Timestamp create_time, Integer creater,
			Timestamp update_time, Integer updater) {
		super();
		this.customer_care_id = customer_care_id;
		this.customer_id = customer_id;
		this.care_subject = care_subject;
		this.care_type = care_type;
		this.status = status;
		this.remark = remark;
		this.next_time = next_time;
		this.create_time = create_time;
		this.creater = creater;
		this.update_time = update_time;
		this.updater = updater;
	}

	public Integer getCustomer_care_id() {
		return customer_care_id;
	}

	public void setCustomer_care_id(Integer customer_care_id) {
		this.customer_care_id = customer_care_id;
	}

	public Integer getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(Integer customer_id) {
		this.customer_id = customer_id;
	}

	public String getCare_subject() {
		return care_subject;
	}

	public void setCare_subject(String care_subject) {
		this.care_subject = care_subject;
	}

	public String getCare_type() {
		return care_type;
	}

	public void setCare_type(String care_type) {
		this.care_type = care_type;
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

	public Timestamp getNext_time() {
		return next_time;
	}

	public void setNext_time(Timestamp next_time) {
		this.next_time = next_time;
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
		return "CustomerCare [customer_care_id=" + customer_care_id + ", customer_id=" + customer_id + ", care_subject="
				+ care_subject + ", care_type=" + care_type + ", status=" + status + ", remark=" + remark
				+ ", next_time=" + next_time + ", create_time=" + create_time + ", creater=" + creater
				+ ", update_time=" + update_time + ", updater=" + updater + "]";
	}
	
}
