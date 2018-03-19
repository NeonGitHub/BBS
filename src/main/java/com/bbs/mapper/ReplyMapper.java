package com.bbs.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bbs.model.Forum;
import com.bbs.model.Reply;

@Repository
public interface ReplyMapper {

	Forum findForumOne(String forumId);

	List<Reply> findReplyById(String forumId,int page,int pagesize);

	void addReply(Reply reply);

	String findFidById(String replyId);

	void deletereply(String replyId);

}
