package com.utkarsh.springmvc.dao;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

import com.mysql.cj.x.protobuf.MysqlxCrud.Find;
import com.utkarsh.springmvc.dto.BlogsDTO;
import com.utkarsh.springmvc.dto.User;

@Component
public class BlogDAO {

	private EntityManager entityManager;
	private EntityTransaction entityTransaction;
	private EntityManagerFactory entityManagerFactory;

	public BlogsDTO addBlogs(BlogsDTO blogsDTO) {
		openConnection();

		entityTransaction.begin();
		entityManager.persist(blogsDTO);
		entityTransaction.commit();

		closeConnection();

		return blogsDTO;
	}

	public List<BlogsDTO> getBlogListByUserId(HttpSession httpSession) {

		openConnection();
		User user = (User) httpSession.getAttribute("user");
		User user1 = entityManager.find(User.class, user.getId());

		List<BlogsDTO> webBlogs = user1.getWebBlogs();
		closeConnection();

		return webBlogs;

	}

	@SuppressWarnings("unchecked")
	public List<BlogsDTO> getAllBlogs() {

		openConnection();
		Query query = entityManager.createQuery("SELECT blog from BlogsDTO blog");
		List<BlogsDTO> resultList = (List<BlogsDTO>) query.getResultList();
		closeConnection();

		return resultList;
	}

	public void removeblog(int id) {

		openConnection();

		BlogsDTO blog = entityManager.find(BlogsDTO.class, id);

		entityTransaction.begin();
		entityManager.remove(blog);
		entityTransaction.commit();
		closeConnection();
	}

	private void openConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		entityManagerFactory = Persistence.createEntityManagerFactory("springmvc");
		entityManager = entityManagerFactory.createEntityManager();
		entityTransaction = entityManager.getTransaction();
	}

	private void closeConnection() {
		if (entityManagerFactory != null) {
			entityManagerFactory.close();
		}
		if (entityManager != null) {
			entityManager.close();
		}
		if (entityTransaction != null) {
			if (entityTransaction.isActive()) {
				entityTransaction.rollback();
			}

		}
	}

	public BlogsDTO deleteblog(int bid, int uid) {
		openConnection();
		BlogsDTO blog = entityManager.find(BlogsDTO.class, bid);
		User user = entityManager.find(User.class, uid);
		List<BlogsDTO> blogs = user.getWebBlogs();
		BlogsDTO blogToBedelete = null;
		for (BlogsDTO b : blogs) {
			if (b.equals(blog)) {
				blogToBedelete = blog;
			}
		}
		blogs.remove(blogToBedelete);
		entityTransaction.begin();
		entityManager.persist(user);
		entityManager.remove(blog);
		entityTransaction.commit();
		closeConnection();
		return blog;
	}

	
	public BlogsDTO  findBlogById(int blogid)
	{
		openConnection();
		BlogsDTO blogs = entityManager.find(BlogsDTO.class, blogid);
		closeConnection();
		return blogs;
				
	}
	public BlogsDTO updateblog(String title, String content, String author, int blogid) {
		openConnection();
		BlogsDTO blog = entityManager.find(BlogsDTO.class, blogid);
		blog.setAuthor(author);
		blog.setContent(content);
		blog.setTitle(title);
		blog.setDate(new Date(System.currentTimeMillis()));
		
		entityTransaction.begin();
		entityManager.persist(blog);
		entityTransaction.commit();
		closeConnection();
		
		return blog;
				}

	 public void deleteblog(int bid) {
		 openConnection();
		 BlogsDTO blog = entityManager.find(BlogsDTO.class, bid);
		 int userid = blog.getUserid();
		 User user = entityManager.find(User.class, userid);
		 List<BlogsDTO> blogs = user.getWebBlogs();
		 
		 BlogsDTO blogToBedelete = null;
		 for (BlogsDTO b : blogs) {
			if(b.equals(blog)) {
				blogToBedelete = blog;
				break;
			}
		}
		 blogs.remove(blogToBedelete);
		 user.setWebBlogs(blogs);
		 entityTransaction.begin();
		 entityManager.persist(user);
		 entityManager.remove(blog);
		 entityTransaction.commit();
		 closeConnection();
		 
	}
	@SuppressWarnings("unchecked")
	public List<BlogsDTO> searchblog(String query) {
		openConnection();
		String quryString = "";
		Query query2 = entityManager.createQuery("SELECT blogs FROM BlogsDTO blogs WHERE blogs.title LIKE '%" + query
				+ "%' OR blogs.content LIKE '%" + query + "%' OR blogs.author LIKE '%" + query + "%'");
		//Query query2 = entityManager.createQuery("SELECT blogs FROM BlogDTO blogs WHERE blogs.title like %'"+query+"'% or blogs.content like %'"+query+"'% or blogs.author like %'"+query+"'%");
		List<BlogsDTO> resultList = (List<BlogsDTO>)query2.getResultList();
		closeConnection();
		return resultList;
		
	}

}
