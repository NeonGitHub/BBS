package com.bbs.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bbs.model.Manager;
import com.bbs.model.Moderator;
import com.bbs.model.User;

@Repository
public interface UserMapper {

	public String userlogin(String userId);

	public String modlogin(String modId);

	public User findUserById(String userId);

	public void addUser(User user);

	public Moderator findModeratorById(String modId);
	public Manager findManagerById(String managerId);
	public  void gagUser2(String userId);
	public  void gagUser3(String userId);
	public  void gagUser4(String userId);
	public void gagUser1(String userId);

	public String managerlogin(String managerId);

	public List<User> findAllUser();

}
