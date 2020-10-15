package com.zhiyou.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.zhiyou.dao.MessageDao;
import com.zhiyou.model.Message;
import com.zhiyou.service.MessageService;

@Service
public class MessageServiceImpl implements MessageService {
	@Autowired
	private MessageDao messageDao;

	// 收件箱
	public PageInfo<Message> receiveBox(int pageNo, String keyword, String colName, int receiver) {
		return null;
	}

	// 发件箱
	public PageInfo<Message> sendBox(int pageNo, String keyword, String colName, int sender) {
		return null;
	}

	// 草稿箱
	public PageInfo<Message> draftBox(int pageNo, String keyword, String colName, int sender) {
		return null;
	}

	// 垃圾箱
	public PageInfo<Message> dustBox(int pageNo, String keyword, String colName, int user_id) {
		return null;
	}

	// 发送邮件
	public void sendMessage(Message message) {
		messageDao.sendMessage(message);
	}

	// 保存草稿
	public void saveMessage(Message message) {
		messageDao.saveMessage(message);
	}

	// 发送放删除到垃圾箱
	public void senderDeleteToDustBox(int messageId) {
		messageDao.senderDeleteToDustBox(messageId);
	}

	// 接收方删除到垃圾箱
	public void receiverDeleteToDustBox(int messageId) {
		messageDao.receiverDeleteToDustBox(messageId);
	}

	// 通过id查询
	public Message selectById(int messageId) {
		return messageDao.selectById(messageId);
	}

	// 接收方阅读邮件
	public void read(int messageId) {
		messageDao.read(messageId);
	}

	// 从垃圾箱彻底删除
	public void dustDeleteShift(int messageId, int user_id, int sender) {
		if (user_id == sender) {
			// 当前登录用户与邮件的发件人一致，故作为发送方删除
			messageDao.senderDeleteShift(messageId);
		} else {
			messageDao.receiverDeleteShift(messageId);
		}
	}

	// 发送方彻底删除(包括彻底删除草稿)
	public void senderDeleteShift(int messageId) {
		messageDao.senderDeleteShift(messageId);
	}

	// 接受方彻底删除
	public void receiverDeleteShift(int messageId) {
		messageDao.receiverDeleteShift(messageId);
	}

	// 草稿发送
	public void sendDraft(Message message) {
		messageDao.sendDraft(message);
	}

	// 再次保存草稿
	public void saveAgain(Message message) {
		messageDao.saveAgain(message);
	}

	// 撤销删除
	public void repeal(int message_id, int sender, int user_id) {
		if (sender == user_id) {
			messageDao.senderRepeal(message_id);
		} else {
			messageDao.receiverRepeal(message_id);
		}
	}

}
