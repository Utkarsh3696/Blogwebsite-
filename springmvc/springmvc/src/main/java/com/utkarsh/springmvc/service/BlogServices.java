package com.utkarsh.springmvc.service;

import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.utkarsh.springmvc.dao.BlogDAO;
import com.utkarsh.springmvc.dao.UserDAO;
import com.utkarsh.springmvc.dto.BlogsDTO;
import com.utkarsh.springmvc.dto.User;

@Component
public class BlogServices {

	@Autowired
	private BlogDAO blogDAO;

	@Autowired
	private UserDAO userDao;

	public BlogsDTO addBlogsDTO(String title, String content, String author, HttpSession httpSession) {
		BlogsDTO blogs = new BlogsDTO();
		blogs.setAuthor(author);
		blogs.setContent(content);
		blogs.setTitle(title);
		blogs.setDate(new Date(System.currentTimeMillis()));
		User user = (User)httpSession.getAttribute("user");
		
		try {
			blogs.setUserid(user.getId());
			// System.out.println(user);

			blogs = blogDAO.addBlogs(blogs);
			userDao.blgoandUserMap(user.getId(), blogs.getId());
			return blogs;
		} catch (Exception e) {

			e.printStackTrace();
			return null;
		}

	}

	public List<BlogsDTO> getListofblogs(HttpSession httpSession) {
		List<BlogsDTO> blogListByUserId = blogDAO.getBlogListByUserId(httpSession);
		return blogListByUserId;
	}

	public List<BlogsDTO> getALlListofblogs() {
		List<BlogsDTO> blogList = blogDAO.getAllBlogs();
		System.out.println(blogList);
		return blogList;
	}

	public void removeblog(int id) {

		blogDAO.removeblog(id);

	}

	public BlogsDTO deleteblog(int bid, int uid) {
		try {
		BlogsDTO deletedblog = blogDAO.deleteblog(bid,uid);
		return  deletedblog;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
				
	}

	public BlogsDTO  findBlogById(int blogid)
	{
		return blogDAO.findBlogById(blogid);
	}
	public BlogsDTO updateblog(String title, String content, String author, int blogid) {
		try {
			return blogDAO.updateblog(title,content,author,blogid);
		} catch (Exception e) {
			e.printStackTrace();	
			}
		
		return null;
		
	}

	public void deleteblog(int bid) {
		
		blogDAO.deleteblog(bid);
		
	}

	public List<BlogsDTO> sortblogs(int index) {
		List<BlogsDTO> blogs = blogDAO.getAllBlogs();
		Collections.sort(blogs,Comparator.comparing(BlogsDTO::getDate));	
		if (index==1) {
			blogs = blogs.reversed();
		}
		return blogs;	}

	public List<BlogsDTO> sortblogs(int index, HttpSession httpSession) {
		List<BlogsDTO> blogs = blogDAO.getBlogListByUserId(httpSession);
		Collections.sort(blogs,Comparator.comparing(BlogsDTO::getDate));	
		if (index==1) {
			blogs = blogs.reversed();
		}
		return blogs;
	}

	public List<BlogsDTO> searchblog(String query) {
		List<BlogsDTO> searchblog = (List<BlogsDTO>)blogDAO.searchblog(query);
		return searchblog;
	}

}
