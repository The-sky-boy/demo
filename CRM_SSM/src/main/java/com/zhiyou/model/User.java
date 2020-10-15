package com.zhiyou.model;

import java.sql.Timestamp;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * 用户模型
 */
public class User {

	private Integer user_id;		//员工ID
	private Integer department_id;  //部门ID
	private Integer role_id;  		//角色ID
	private String username;		//姓名
	private Boolean is_male;		//性别
	private String mobile;			//手机
	private Integer age;			//年龄
	private String address;			//地址
	private Boolean is_admin;		//是否管理员
	private Boolean is_system;		//是否为系统内置（不能删除）
	private String password;		//密码
	private String tel;				//座机
	private String id_num;			//身份证
	private String email;			//电子邮箱
	private String hobby;			//爱好
	private Integer education;		//学历
	private String card_num;		//工资卡号
	private String nation;			//民族
	private Integer marry;			//婚姻状况
	private Integer status;			//用户状态
	private String remark;			//操作备注
    @JSONField(format="yyyy-MM-dd HH:mm:ss")	
	private Timestamp create_time;	//添加时间
	private Integer creater;		//添加人
    @JSONField(format="yyyy-MM-dd HH:mm:ss")
	private Timestamp update_time; 	//修改时间
	private Integer updater;		//修改人
	
	public User() {
	}
	public User(Integer user_id, Integer department_id, Integer role_id, String username, Boolean is_male,
			String mobile, Integer age, String address, Boolean is_admin, Boolean is_system, String password,
			String tel, String id_num, String email, String hobby, Integer education, String card_num, String nation,
			Integer marry, Integer status, String remark, Timestamp create_time, Integer creater, Timestamp update_time,
			Integer updater) {
		this.user_id = user_id;
		this.department_id = department_id;
		this.role_id = role_id;
		this.username = username;
		this.is_male = is_male;
		this.mobile = mobile;
		this.age = age;
		this.address = address;
		this.is_admin = is_admin;
		this.is_system = is_system;
		this.password = password;
		this.tel = tel;
		this.id_num = id_num;
		this.email = email;
		this.hobby = hobby;
		this.education = education;
		this.card_num = card_num;
		this.nation = nation;
		this.marry = marry;
		this.status = status;
		this.remark = remark;
		this.create_time = create_time;
		this.creater = creater;
		this.update_time = update_time;
		this.updater = updater;
	}
	
	public Integer getUser_id() {
		return user_id;
	}
	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}
	public Integer getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(Integer department_id) {
		this.department_id = department_id;
	}
	public Integer getRole_id() {
		return role_id;
	}
	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Boolean getIs_male() {
		return is_male;
	}
	public void setIs_male(Boolean is_male) {
		this.is_male = is_male;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Boolean getIs_admin() {
		return is_admin;
	}
	public void setIs_admin(Boolean is_admin) {
		this.is_admin = is_admin;
	}
	public Boolean getIs_system() {
		return is_system;
	}
	public void setIs_system(Boolean is_system) {
		this.is_system = is_system;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getId_num() {
		return id_num;
	}
	public void setId_num(String id_num) {
		this.id_num = id_num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public Integer getEducation() {
		return education;
	}
	public void setEducation(Integer education) {
		this.education = education;
	}
	public String getCard_num() {
		return card_num;
	}
	public void setCard_num(String card_num) {
		this.card_num = card_num;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public Integer getMarry() {
		return marry;
	}
	public void setMarry(Integer marry) {
		this.marry = marry;
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
		return "User [user_id=" + user_id + ", department_id=" + department_id + ", role_id=" + role_id + ", username="
				+ username + ", is_male=" + is_male + ", mobile=" + mobile + ", age=" + age + ", address=" + address
				+ ", is_admin=" + is_admin + ", is_system=" + is_system + ", password=" + password + ", tel=" + tel
				+ ", id_num=" + id_num + ", email=" + email + ", hobby=" + hobby + ", education=" + education
				+ ", card_num=" + card_num + ", nation=" + nation + ", marry=" + marry + ", status=" + status
				+ ", remark=" + remark + ", create_time=" + create_time + ", creater=" + creater + ", update_time="
				+ update_time + ", updater=" + updater + "]";
	}
	
}
