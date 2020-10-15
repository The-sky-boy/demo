package com.zhiyou.service;

import com.github.pagehelper.PageInfo;
import com.zhiyou.model.Message;

public interface MessageService {

	// 收件箱
	PageInfo<Message> receiveBox(int pageNo, String keyword, String colName, int receiver);
	// 发件箱
	PageInfo<Message> sendBox(int pageNo, String keyword, String colName, int sender);
	// 草稿箱
	PageInfo<Message> draftBox(int pageNo, String keyword, String colName, int sender);
	// 垃圾箱
	PageInfo<Message> dustBox(int pageNo, String keyword, String colName, int user_id);
	// 发送邮件
	void sendMessage(Message message);
	// 保存到草稿箱
	void saveMessage(Message message);
	// 发件人删除到垃圾箱
	void senderDeleteToDustBox(int messageId);
	// 收件人删除到垃圾箱
	void receiverDeleteToDustBox(int messageId);
	// 从垃圾箱彻底删除
	void dustDeleteShift(int messageId,int user_id, int sender);
	// 发送者(草稿箱)彻底删除
	void senderDeleteShift(int messageId);
	// 接受者(草稿箱)彻底删除
	void receiverDeleteShift(int messageId);
	// 通过id查找邮件
	Message selectById(int messageId);
	// 修改邮件为已读：
	void read(int messageId);
	// 将草稿发送：
	void sendDraft(Message message);
	// 再次保存草稿：
	void saveAgain(Message message);
	// 撤销删除
	void repeal(int message_id, int sender, int user_id);
}
