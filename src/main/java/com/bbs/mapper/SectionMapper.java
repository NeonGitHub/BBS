package com.bbs.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bbs.model.Section;
@Repository
public interface SectionMapper {

	public List<Section> findSection();

	public int findSectionForum(String forumType);

}
