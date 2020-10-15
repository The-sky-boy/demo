package com.zhiyou.service;

import com.github.pagehelper.PageInfo;
import com.zhiyou.model.Notice;

public interface NoticeService {
	
	PageInfo<Notice> selectByKeyword(int pageNo, String keyword);
	
	void delete(int noticeId);
	
	void update(Notice notice);
	
	void add(Notice notice);
	
	Notice selectByNoticeId(int noticeId);
}
