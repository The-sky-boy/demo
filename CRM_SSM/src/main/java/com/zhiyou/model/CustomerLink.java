package com.zhiyou.model;

import java.sql.Timestamp;
/**
 * 联系人
 */
public class CustomerLink {

	
	private Integer link_id;			//联系人ID
	private Integer customer_id;		//客户ID
	private String link_name;			//联系人姓名
	private String link_is_male;		//性别
	private String link_position;		//职位
	private String link_mobile;			//联系电话
	private Integer link_age;			//年龄
	private Integer link_relation;		//与客户关系
	private Integer status;				//状态			
	private String remark;				//备注
	private Timestamp next_time;		//下次关怀时间
	private Timestamp create_time;		//添加时间
	private Integer creater;			//添加人
	private Timestamp update_time;		//修改时间
	private Integer updater;			//修改人
	
	public CustomerLink() {
		
	}

	public CustomerLink(Integer link_id, Integer customer_id, String link_name, String link_is_male,
			String link_position, String link_mobile, Integer link_age, Integer link_relation, Integer status,
			String remark, Timestamp next_time, Timestamp create_time, Integer creater, Timestamp update_time,
			Integer updater) {
		super();
		this.link_id = link_id;
		this.customer_id = customer_id;
		this.link_name = link_name;
		this.link_is_male = link_is_male;
		this.link_position = link_position;
		this.link_mobile = link_mobile;
		this.link_age = link_age;
		this.link_relation = link_relation;
		this.status = status;
		this.remark = remark;
		this.next_time = next_time;
		this.create_time = create_time;
		this.creater = creater;
		this.update_time = update_time;
		this.updater = updater;
	}

	public Integer getLink_id() {
		return link_id;
	}

	public void setLink_id(Integer link_id) {
		this.link_id = link_id;
	}

	public Integer getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(Integer customer_id) {
		this.customer_id = customer_id;
	}

	public String getLink_name() {
		return link_name;
	}

	public void setLink_name(String link_name) {
		this.link_name = link_name;
	}

	public String getLink_is_male() {
		return link_is_male;
	}

	public void setLink_is_male(String link_is_male) {
		this.link_is_male = link_is_male;
	}

	public String getLink_position() {
		return link_position;
	}

	public void setLink_position(String link_position) {
		this.link_position = link_position;
	}

	public String getLink_mobile() {
		return link_mobile;
	}

	public void setLink_mobile(String link_mobile) {
		this.link_mobile = link_mobile;
	}

	public Integer getLink_age() {
		return link_age;
	}

	public void setLink_age(Integer link_age) {
		this.link_age = link_age;
	}

	public Integer getLink_relation() {
		return link_relation;
	}

	public void setLink_relation(Integer link_relation) {
		this.link_relation = link_relation;
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
		return "CustomerLink [link_id=" + link_id + ", customer_id=" + customer_id + ", link_name=" + link_name
				+ ", link_is_male=" + link_is_male + ", link_position=" + link_position + ", link_mobile=" + link_mobile
				+ ", link_age=" + link_age + ", link_relation=" + link_relation + ", status=" + status + ", remark="
				+ remark + ", next_time=" + next_time + ", create_time=" + create_time + ", creater=" + creater
				+ ", update_time=" + update_time + ", updater=" + updater + "]";
	}
	
}
