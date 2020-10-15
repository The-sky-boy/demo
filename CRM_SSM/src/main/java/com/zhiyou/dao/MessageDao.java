package com.zhiyou.dao;

import java.util.List;

import com.zhiyou.model.Message;

public interface MessageDao {

	// 收件箱
	List<Message> receiveBox(int pageNo, String keyword, String colName, int receiver);
	// 收件箱条数
	int receiveCount(String keyword, String colName, int receiver);
	// 发件箱
	List<Message> sendBox(int pageNo, String keyword, String colName, int sender);
	// 发件箱条数
	int sendCount(String keyword, String colName, int sender);
	// 草稿箱
	List<Message> draftBox(int pageNo, String keyword, String colName, int sender);
	// 草稿箱条数
	int draftCount(String keyword, String colName, int sender);
	// 垃圾箱
	List<Message> dustBox(int pageNo, String keyword, String colName, int user_id);
	// 垃圾箱条数
	int dustCount(String keyword, String colName, int user_id);
	// 发送邮件
	void sendMessage(Message message);
	// 保存到草稿箱
	void saveMessage(Message message);
	// 发件人删除删除到垃圾箱
	void senderDeleteToDustBox(int messageId);
	// 接收人删除到垃圾箱
	void receiverDeleteToDustBox(int messageId);
	// 发送人彻底删除
	void senderDeleteShift(int messageId);
	// 收件人彻底删除
	void receiverDeleteShift(int messageId);
	// 通过id查找邮件
	Message selectById(int messageId);
	// 修改邮件为已读：
	void read(int messageId);
	// 发送草稿
	void sendDraft(Message message);
	// 再次保存到草稿箱
	void saveAgain(Message message);
	// 发件人撤销删除
	void senderRepeal(int message_id);
	// 收件人撤销删除
	void receiverRepeal(int message_id);

}
