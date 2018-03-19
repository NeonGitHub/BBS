package com.bbs.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bbs.mapper.PageMapper;

@Service("pageService")

public class PageService {
	@Resource
	private PageMapper pageMapper;
	
	public int getkctotalpage(int pageSize,String type){
		int totalPage = 0;
		int total = 0;
		total=pageMapper.getkctotalpage(type);
		if (total%pageSize == 0) {
			totalPage = total / pageSize;
		} else {
			totalPage = total / pageSize + 1;
		}
		return totalPage;
	}
	
	public int getReplyPage(int pageSize,String type){
		int totalPage = 0;
		int total = 0;
		total=pageMapper.getReplyPage(type);
		if (total%pageSize == 0) {
			totalPage = total / pageSize;
		} else {
			totalPage = total / pageSize + 1;
		}
		return totalPage;
	}
	
	
}
