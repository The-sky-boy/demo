package com.zhiyou.model;

import java.sql.Timestamp;
/**
 * 公告
 */
public class Notice{
	
	private Integer notice_id;		//公告信息id
	private Integer receive_id;		//接受部门id
	private String subject;			//公告主题
	private String text;			//公告内容
	private Timestamp pub_time;		//发布时间
	private Timestamp expire_time;	//过期时间
	private Integer status;			//公告状态
	private String remark;			//备注
	private Timestamp create_time;	//添加时间
	private Integer creater;		//添加人
	private Timestamp update_time;	//修改时间
	private Integer updater;		//修改人
	
	public Notice() {
	}
	
	public Notice(Integer notice_id, Integer receive_id, String subject, String text, Timestamp pub_time,
			Timestamp expire_time, Integer status, String remark, Timestamp create_time, Integer creater,
			Timestamp update_time, Integer updater) {
		this.notice_id = notice_id;
		this.receive_id = receive_id;
		this.subject = subject;
		this.text = text;
		this.pub_time = pub_time;
		this.expire_time = expire_time;
		this.status = status;
		this.remark = remark;
		this.create_time = create_time;
		this.creater = creater;
		this.update_time = update_time;
		this.updater = updater;
	}

	public Integer getNotice_id() {
		return notice_id;
	}
	public void setNotice_id(Integer notice_id) {
		this.notice_id = notice_id;
	}
	public Integer getReceive_id() {
		return receive_id;
	}
	public void setReceive_id(Integer receive_id) {
		this.receive_id = receive_id;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Timestamp getPub_time() {
		return pub_time;
	}
	public void setPub_time(Timestamp pub_time) {
		this.pub_time = pub_time;
	}
	public Timestamp getExpire_time() {
		return expire_time;
	}
	public void setExpire_time(Timestamp expire_time) {
		this.expire_time = expire_time;
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
		return "Notice [notice_id=" + notice_id + ", receive_id=" + receive_id + ", subject=" + subject + ", text="
				+ text + ", pub_time=" + pub_time + ", expire_time=" + expire_time + ", status=" + status + ", remark="
				+ remark + ", create_time=" + create_time + ", creater=" + creater + ", update_time=" + update_time
				+ ", updater=" + updater + "]";
	}
	
}
