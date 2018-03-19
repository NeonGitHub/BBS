package com.bbs.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bbs.mapper.AnnouceMapper;


@Service("annouceService")
public class AnnouceService {

	@Resource
	private AnnouceMapper annouceMapper;
	
	
	public String findAnnouce() {
		return annouceMapper.findAnnouce();
	}

}
