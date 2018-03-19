package com.bbs.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bbs.mapper.SectionMapper;
import com.bbs.model.Section;

@Service("sectionService")
public class SectionService {

	@Resource
	private SectionMapper sectionMapper;
	
	public List<Section> findSection(){
		return sectionMapper.findSection();
	}

	public int findSectionForum(String forumType) {
		
		return sectionMapper.findSectionForum(forumType);
	}
	
	
	
}
