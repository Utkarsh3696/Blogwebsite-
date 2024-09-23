package com.utkarsh.springmvc.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.google.protobuf.Service;
import com.utkarsh.springmvc.dao.UserDAO;
import com.utkarsh.springmvc.dto.BlogsDTO;
import com.utkarsh.springmvc.dto.Role;
import com.utkarsh.springmvc.dto.User;


@Component
public class UserService {

	@Autowired
	UserDAO userdao;
	
	public User addUser(String userName, String email, long mobile, String password, String role)
	{
		User user = new User();
		
		user.setUserName(userName);
		user.setEmail(email);
		user.setPassword(password);
		user.setMobile(mobile);
		
		if(role.equals("ADMIN"))
		{
			boolean f =  false;
			List<User> allUser = userdao.findAllUser();
			for(User user1 : allUser) {
				if(user1.getRole().equals(Role.ADMIN))
				{
					f = true;
					break;
				}
			}
			
			if(f)
			{
				user.setRole(Role.USER);	
			}
			else {
				user.setRole(Role.ADMIN);
				}
		}
		else {
			user.setRole(Role.USER);
			}
		user.setWebBlogs(new ArrayList<BlogsDTO>());
		try {
			User user2 = userdao.addUser(user);
			return user2;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public  User login(String email, String Password)
	{
		 User user = userdao.login(email, Password);  
		 return user;
	}
	
	public User findUserByUserId(int id) {
		User user;
		
		user = userdao.findUserByUserId(id);
		
		return user;
	}

	public User updateUser(String name,String email, long mobile, String password,HttpSession httpSession)
	{
		try {
			return userdao.updateUser(name, email, mobile, password,httpSession);
			
		}	
		catch (Exception e) {
			return  null;
		}
		
			
	}
		
	
}
