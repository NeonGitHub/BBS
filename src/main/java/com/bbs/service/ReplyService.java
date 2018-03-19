package com.bbs.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bbs.mapper.ReplyMapper;
import com.bbs.model.Forum;
import com.bbs.model.Reply;

@Service("replyService")
public class ReplyService {

	@Resource
	private ReplyMapper replyMapper;
	
	
	
	public List<Reply> findReplyById(String forumId,int page,int pagesize) {
		int page1=(page - 1) * pagesize;
		return replyMapper.findReplyById(forumId,page1,pagesize);
		
	}

	public Forum findForumOne(String forumId) {
		return replyMapper.findForumOne(forumId);
	}

	public void addReply(Reply reply) {
		replyMapper.addReply(reply);
	}

	public String findFidById(String replyId) {
		return replyMapper.findFidById(replyId);
	}

	public List<Reply> deletereply(String forumId, String replyId,int page,int pagesize) {
		int page1=(page - 1) * pagesize;
		replyMapper.deletereply(replyId);
		return replyMapper.findReplyById(forumId,page1,pagesize);
	}

}
