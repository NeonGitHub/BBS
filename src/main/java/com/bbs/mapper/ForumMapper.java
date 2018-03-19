package com.bbs.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bbs.model.Forum;

@Repository
public interface ForumMapper {

	List<Forum> findForum(String forumType,int page,int pagesize);

	void addForum(Forum forum);

	void deleteforum(String forumId);

	void topforum(String forumId);

	void deleteAllReply(String forumId);

}
