package com.utkarsh.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.utkarsh.springmvc.dto.BlogsDTO;
import com.utkarsh.springmvc.dto.Role;
import com.utkarsh.springmvc.dto.User;
import com.utkarsh.springmvc.service.UserService;

@Controller
public class UserController {

	@Autowired
	UserService service;

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	protected String getSignUpPage() {
		return "signup";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	protected String getLogin() {
		return "login";
	}

	@RequestMapping(value = "/add-user", method = RequestMethod.POST)
	protected String addUser(@RequestParam(name = "username") String name, @RequestParam(name = "email") String email,
			@RequestParam(name = "mobile") long mobile, @RequestParam(name = "password") String password,
			@RequestParam(name = "role") String role, ModelMap modelMap) {
		User addedUser = service.addUser(name, email, mobile, password, role);
		if (addedUser != null) {
			modelMap.addAttribute("message", "User added..");
			return "login";
		} else {
			modelMap.addAttribute("message", "Something went wrong..");
			return "signup";
		}
	}

	@RequestMapping(value = "/landingpage", method = RequestMethod.GET)
	protected String getlandingpage(HttpSession httpSession,ModelMap modelMap) {
		User user = (User) httpSession.getAttribute("user");
		httpSession.setAttribute("user", user);
		httpSession.setMaxInactiveInterval(30 * 24 * 60 * 60);
		modelMap.addAttribute("user", user);
		return "landingpage";
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	protected String getslandingpage( HttpSession httpSession,ModelMap modelMap) {
		User user = (User) httpSession.getAttribute("user");
		httpSession.setAttribute("user", user);
		modelMap.addAttribute("user", user);
		return "landingpage";
		
	}

	@RequestMapping(value = "/manageaccount", method = RequestMethod.GET)
	protected String getmanageaccount(ModelMap modelMap, HttpSession httpSession) {

		User user = (User) httpSession.getAttribute("user");
		// User user = service.findUserByUserId(id);
		modelMap.addAttribute("user", user);
		return "manageaccount";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	protected String getlogin(@RequestParam(name = "email") String email,
			@RequestParam(name = "password") String password, ModelMap modelMap, HttpSession httpSession) {
		User user = service.login(email, password);
		if (user != null) {
			if(user.isBlock())
			{
				modelMap.addAttribute("message", "Your Are Blocked Please Contact to Admin!!!");
				return "login";
			}else {
				httpSession.setAttribute("user", user);
				httpSession.setMaxInactiveInterval(30 * 24 * 60 * 60);
				modelMap.addAttribute("user", user);
				return "landingpage";
			}
		} else {
			
			modelMap.addAttribute("message", "Invalid Username or Password!!");
			return "login";
		}

	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	protected String getLogout(HttpSession httpSession, HttpServletResponse response) {
		httpSession.invalidate();

		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);

		return "redirect:/login";
	}

	// update-account

	@RequestMapping(value = "/update-account", method = RequestMethod.POST)
	protected String userupadate(@RequestParam("username") String username, @RequestParam("email") String email,
			@RequestParam("password") String password, @RequestParam("mobile") long mobile, ModelMap modelMap,
			HttpSession httpSession) {

		User user = service.updateUser(username, email, mobile, password, httpSession);

		if (user != null) {
			modelMap.addAttribute("user", user);
			modelMap.addAttribute("message", "update sucess");
		} else {
			modelMap.addAttribute("message", "something went wrong!!!");
		}
		return "manageaccount";
	}

	@RequestMapping(value = "/users", method = RequestMethod.GET)
	protected String getUsers(ModelMap modelMap,HttpSession httpSession) {	
		
		User user = (User) httpSession.getAttribute("user");
	
		if (user!=null) {
			if((user.getRole()).equals(Role.ADMIN)) {
				
				List<User> findallUsers = service.findallUsers();
				
				modelMap.addAttribute("users", findallUsers);
				
				return "users";
				}
		}
		else {
			return "login";		}
		return "login";
		
	}

	@RequestMapping(value = "user-block", method = RequestMethod.GET)
	protected String userblog(@RequestParam("id") int id, ModelMap modelMap, HttpSession httpSession) {

		User user = (User) httpSession.getAttribute("user");
		
		if (user != null) {
			if (user.getRole().equals(Role.ADMIN)) {
				User blockUser = service.blockUser(id);
				if (blockUser != null) {
					List<User> findallUsers = service.findallUsers();
					modelMap.addAttribute("users", findallUsers);
					return "users";
				
			}
		} }else {
			return "login";
		}
		return "login";
	}

}
