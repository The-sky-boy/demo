package com.zhiyou.dao;

import java.util.List;

import com.zhiyou.model.Notice;

public interface NoticeDao {

	List<Notice> selectByKeyword(int pageNo, String keyword);
	
	void delete(int noticeId);
	
	void update(Notice notice);
	
	void add(Notice notice);
	
	Notice selectByNoticeId(int noticeId);
	
	int selectNoticeCount(String keyword);
	
}
