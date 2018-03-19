package com.bbs.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bbs.mapper.UserMapper;
import com.bbs.model.Manager;
import com.bbs.model.Moderator;
import com.bbs.model.User;

@Service("userService")
public class UserService {

	@Resource
	private UserMapper userMapper;

	public String userlogin(String userId, String pass) {
		if (pass.equals(userMapper.userlogin(userId))) {
			return "success";
		} else {
			return "default";
		}
	}

	public String modlogin(String modId, String pass) {
		if (pass.equals(userMapper.modlogin(modId))) {
			return "success";
		} else {
			return "default";
		}
	};

	public User findUserById(String userId) {
		return userMapper.findUserById(userId);
	}

	public void addUser(User user) {
		userMapper.addUser(user);
	}

	public Moderator findModeratorById(String modId) {
		return userMapper.findModeratorById(modId);
	}

	public void gagUser(String userId, String forumType) {
		switch (forumType) {
		case "校园热点":
			userMapper.gagUser1(userId);
			break;
		case "社团活动":
			userMapper.gagUser2(userId);
			break;
		case "学术交流":
			userMapper.gagUser3(userId);
			break;
		case "失物招领":
			userMapper.gagUser4(userId);
			break;
		default:
			break;
		}

	}

	public String managerlogin(String managerId, String pass) {
		if (pass.equals(userMapper.managerlogin(managerId))) {
			return "success";
		} else {
			return "default";
		}
	}

	public Manager findManagerById(String managerId) {
		return userMapper.findManagerById(managerId);
	}

	public List<User> findAllUser() {
		return userMapper.findAllUser();
	}

}
