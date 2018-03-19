package com.bbs.mapper;

import org.springframework.stereotype.Repository;

@Repository
public interface PageMapper {
	int getkctotalpage(String type);
	int getReplyPage(String forumId);
}
