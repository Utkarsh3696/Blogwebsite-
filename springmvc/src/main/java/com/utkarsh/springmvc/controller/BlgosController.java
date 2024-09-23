package com.utkarsh.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.utkarsh.springmvc.dto.BlogsDTO;
import com.utkarsh.springmvc.dto.User;
import com.utkarsh.springmvc.service.BlogServices;
import com.utkarsh.springmvc.service.UserService;

@Controller
public class BlgosController {

	@Autowired
	private UserService service;
	
	@Autowired
	private BlogServices blogServices;
	

	
	@RequestMapping(value = "/addblog",method = RequestMethod.GET)
	protected String getAddBlogpage(ModelMap modelMap) {
		
		modelMap.addAttribute("message","");
		return "addblog";
	}
	@RequestMapping(value = "/addblog",method = RequestMethod.POST)
	protected String getAddBlog(@RequestParam("title") String title, @RequestParam("content") String content,@RequestParam("author") String author,HttpSession httpSession,ModelMap modelMap) {
		
		BlogsDTO blogsDTO = blogServices.addBlogsDTO(title, content, author, httpSession);		
		modelMap.addAttribute("message","adding a blog is done!");
		return "addblog";
	}
	
	
	@RequestMapping(value = "/updateblogs",method = RequestMethod.GET)
	protected String updateblog() {
		
		return "updateblogs";
	}
	@RequestMapping(value = "/updateblogs",method = RequestMethod.POST)
	protected String updateblogs(@RequestParam("bid") int bid,@RequestParam("title") String title, @RequestParam("content") String content,@RequestParam("author") String author,ModelMap modelMap,HttpSession httpSession) {
		
		BlogsDTO updatedblog = blogServices.updateblog(title,content,author,bid);
		
		
		List<BlogsDTO> listofblogs = blogServices.getListofblogs(httpSession);
		List<BlogsDTO> allblogslist = blogServices.getALlListofblogs();
		System.out.println(allblogslist);
		modelMap.addAttribute("allblogs", allblogslist);
		
		if(listofblogs!=null)
		modelMap.addAttribute("blogs", listofblogs);
		
		else {
			modelMap.addAttribute("blogs", null);
			
		}
		return "myblogs";
	}
	
	@RequestMapping(value = "update-blog",method = RequestMethod.GET)
	protected String updateblogs(@RequestParam("bid") int blogid, HttpSession httpSession,ModelMap modelMap) {
		
		//User user = (User)httpSession.getAttribute("user");
		BlogsDTO blog = blogServices.findBlogById(blogid);
		modelMap.addAttribute("blog", blog);
		
		return "updateblogs";
		
	}
	
	@RequestMapping(value = "/myblogs",method = RequestMethod.GET)
	protected String getMyBlogs(HttpSession httpSession,ModelMap modelMap) {
		
		List<BlogsDTO> listofblogs = blogServices.getListofblogs(httpSession);
		List<BlogsDTO> allblogslist = blogServices.getALlListofblogs();
		System.out.println(allblogslist);
		modelMap.addAttribute("allblogs", allblogslist);
		
		if(listofblogs!=null)
		modelMap.addAttribute("blogs", listofblogs);
		
		else {
			modelMap.addAttribute("blogs", null);
			
		}
		return "myblogs";
	}	
	
	@RequestMapping(value = "/manageblogs",method = RequestMethod.GET)
	protected String getManageBlogs(HttpSession httpSession,ModelMap modelMap) {
		
		
		List<BlogsDTO> allblogslist = blogServices.getALlListofblogs();
		User user = (User) httpSession.getAttribute("user");
		modelMap.addAttribute("allblogs", allblogslist);
		modelMap.addAttribute("user", user);
		return "manageblogs";
	}
	
	@RequestMapping(value = "/homepage", method = RequestMethod.GET)
	protected String getHomepage(ModelMap modelMap) {
		List<BlogsDTO> allblogslist = blogServices.getALlListofblogs();
		
		modelMap.addAttribute("allblogs", allblogslist);
		return "homepage";
	}
	
	@RequestMapping(value = "/deleteblog",method = RequestMethod.GET)
	protected String deeteblogbyadmin(@RequestParam("blogid") int bid, HttpSession httpSession,ModelMap modelMap) {
	 
		blogServices.deleteblog(bid);
	
		
		return "manageblogs";
	}
	
	@RequestMapping(value = "/delete-blog",method = RequestMethod.GET)
	protected String deeteblog(@RequestParam("id") int bid, HttpSession httpSession,ModelMap modelMap,HttpServletRequest httpServletRequest) {
		
		User user = (User)httpSession.getAttribute("user");
		BlogsDTO deleteblog = blogServices.deleteblog(bid, user.getId());
		
		List<BlogsDTO> listofblogs = blogServices.getListofblogs(httpSession);
		List<BlogsDTO> allblogslist = blogServices.getALlListofblogs();
		System.out.println(allblogslist);
		modelMap.addAttribute("allblogs", allblogslist);
		
		
		
		if(listofblogs!=null)
		modelMap.addAttribute("blogs", listofblogs);
		
		else {
			modelMap.addAttribute("blogs", null);
			
		}
		
		if(deleteblog!=null)
		{
			modelMap.addAttribute("message", "blog is deleted");
		}
		else {
			modelMap.addAttribute("message", "something went wrong");
		}
		return "myblogs";
		
	}

	
	
}
