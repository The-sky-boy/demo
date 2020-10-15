package com.zhiyou.model;

import java.sql.Timestamp;
/**
 * 客户
 */
public class Customer {

	private Integer customer_id;			//客户ID
	private Integer customer_state_id;		//客户状态ID
	private Integer customer_source_id;		//客户来源ID
	private Integer user_id;				//责任员工ID
	private Integer customer_category_id;	//客户类型ID
	private String customer_name;			//客户姓名
	private Boolean customer_is_male;		//客户性别
	private String customer_mobile;			//客户手机
	private String customer_qq;				//客户QQ
	private String customer_address;		//客户地址
	private String customer_email;			//客户邮箱
	private String customer_remark;			//备注
	private String customer_position;		//客户职位
	private String customer_blog;			//客户微博
	private String customer_tel;			//客户座机
	private String customer_birth;			//出生日期
	private String customer_company;		//客户公司
	private Integer status;					//状态
	private String remark;					//备注
	private Timestamp create_time;			//添加时间
	private Integer creater;				//添加人
	private Timestamp update_time;			//修改时间
	private Integer updater;				//修改人
	
	public Customer() {
		
	}

	public Customer(Integer customer_id, Integer customer_state_id, Integer customer_source_id, Integer user_id,
			Integer customer_category_id, String customer_name, Boolean customer_is_male, String customer_mobile,
			String customer_qq, String customer_address, String customer_email, String customer_remark,
			String customer_position, String customer_blog, String customer_tel, String customer_birth,
			String customer_company, Integer status, String remark, Timestamp create_time, Integer creater,
			Timestamp update_time, Integer updater) {
		this.customer_id = customer_id;
		this.customer_state_id = customer_state_id;
		this.customer_source_id = customer_source_id;
		this.user_id = user_id;
		this.customer_category_id = customer_category_id;
		this.customer_name = customer_name;
		this.customer_is_male = customer_is_male;
		this.customer_mobile = customer_mobile;
		this.customer_qq = customer_qq;
		this.customer_address = customer_address;
		this.customer_email = customer_email;
		this.customer_remark = customer_remark;
		this.customer_position = customer_position;
		this.customer_blog = customer_blog;
		this.customer_tel = customer_tel;
		this.customer_birth = customer_birth;
		this.customer_company = customer_company;
		this.status = status;
		this.remark = remark;
		this.create_time = create_time;
		this.creater = creater;
		this.update_time = update_time;
		this.updater = updater;
	}

	public Integer getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(Integer customer_id) {
		this.customer_id = customer_id;
	}

	public Integer getCustomer_state_id() {
		return customer_state_id;
	}

	public void setCustomer_state_id(Integer customer_state_id) {
		this.customer_state_id = customer_state_id;
	}

	public Integer getCustomer_source_id() {
		return customer_source_id;
	}

	public void setCustomer_source_id(Integer customer_source_id) {
		this.customer_source_id = customer_source_id;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public Integer getCustomer_category_id() {
		return customer_category_id;
	}

	public void setCustomer_category_id(Integer customer_category_id) {
		this.customer_category_id = customer_category_id;
	}

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public Boolean getCustomer_is_male() {
		return customer_is_male;
	}

	public void setCustomer_is_male(Boolean customer_is_male) {
		this.customer_is_male = customer_is_male;
	}

	public String getCustomer_mobile() {
		return customer_mobile;
	}

	public void setCustomer_mobile(String customer_mobile) {
		this.customer_mobile = customer_mobile;
	}

	public String getCustomer_qq() {
		return customer_qq;
	}

	public void setCustomer_qq(String customer_qq) {
		this.customer_qq = customer_qq;
	}

	public String getCustomer_address() {
		return customer_address;
	}

	public void setCustomer_address(String customer_address) {
		this.customer_address = customer_address;
	}

	public String getCustomer_email() {
		return customer_email;
	}

	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}

	public String getCustomer_remark() {
		return customer_remark;
	}

	public void setCustomer_remark(String customer_remark) {
		this.customer_remark = customer_remark;
	}

	public String getCustomer_position() {
		return customer_position;
	}

	public void setCustomer_position(String customer_position) {
		this.customer_position = customer_position;
	}

	public String getCustomer_blog() {
		return customer_blog;
	}

	public void setCustomer_blog(String customer_blog) {
		this.customer_blog = customer_blog;
	}

	public String getCustomer_tel() {
		return customer_tel;
	}

	public void setCustomer_tel(String customer_tel) {
		this.customer_tel = customer_tel;
	}

	public String getCustomer_birth() {
		return customer_birth;
	}

	public void setCustomer_birth(String customer_birth) {
		this.customer_birth = customer_birth;
	}

	public String getCustomer_company() {
		return customer_company;
	}

	public void setCustomer_company(String customer_company) {
		this.customer_company = customer_company;
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
		return "Customer [customer_id=" + customer_id + ", customer_state_id=" + customer_state_id
				+ ", customer_source_id=" + customer_source_id + ", user_id=" + user_id + ", customer_category_id="
				+ customer_category_id + ", customer_name=" + customer_name + ", customer_is_male=" + customer_is_male
				+ ", customer_mobile=" + customer_mobile + ", customer_qq=" + customer_qq + ", customer_address="
				+ customer_address + ", customer_email=" + customer_email + ", customer_remark=" + customer_remark
				+ ", customer_position=" + customer_position + ", customer_blog=" + customer_blog + ", customer_tel="
				+ customer_tel + ", customer_birth=" + customer_birth + ", customer_company=" + customer_company
				+ ", status=" + status + ", remark=" + remark + ", create_time=" + create_time + ", creater=" + creater
				+ ", update_time=" + update_time + ", updater=" + updater + "]";
	}
	
}
