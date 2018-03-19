package com.bbs.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bbs.mapper.ForumMapper;
import com.bbs.model.Forum;

@Service("forumService")
public class ForumService {
	@Resource
	private ForumMapper forumMapper;

	public List<Forum> findForum(String forumType,int page,int pagesize) {
		int page1=(page - 1) * pagesize;
		return forumMapper.findForum(forumType,page1,pagesize);
	}

	public void addForum(Forum forum) {
		forumMapper.addForum(forum);
	}

	public List<Forum> deleteforum(String forumType, String forumId,int page,int pagesize) {
		int page1=(page - 1) * pagesize;
		forumMapper.deleteAllReply(forumId);
		forumMapper.deleteforum(forumId);
		return forumMapper.findForum(forumType,page1,pagesize);

	}

	public List<Forum> topforum(String modType, String forumId,int page,int pagesize) {
		int page1=(page - 1) * pagesize;
		forumMapper.topforum(forumId);
		return forumMapper.findForum(modType,page1,pagesize);

	}

}
