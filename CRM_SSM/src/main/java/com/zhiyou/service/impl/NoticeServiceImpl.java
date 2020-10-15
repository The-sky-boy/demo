package com.zhiyou.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.zhiyou.dao.NoticeDao;
import com.zhiyou.model.Notice;
import com.zhiyou.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDao noticeDao;

	// 模糊查询（分页）
	public PageInfo<Notice> selectByKeyword(int pageNo, String keyword) {
		return null;
	}

	// 删除公告
	public void delete(int noticeId) {
		noticeDao.delete(noticeId);
	}

	// 更新公告
	public void update(Notice notice) {
		noticeDao.update(notice);
	}

	// 添加公告
	public void add(Notice notice) {
		noticeDao.add(notice);
	}

	// 通过id查找公告
	public Notice selectByNoticeId(int noticeId) {
		return noticeDao.selectByNoticeId(noticeId);
	}

}
