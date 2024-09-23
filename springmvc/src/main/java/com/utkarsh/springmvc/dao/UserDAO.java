package com.utkarsh.springmvc.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.servlet.http.HttpSession;

import org.hibernate.annotations.Check;
import org.springframework.stereotype.Component;

import com.utkarsh.springmvc.dto.BlogsDTO;
import com.utkarsh.springmvc.dto.User;

@Component
public class UserDAO {

	private EntityManager entityManager;
	private EntityTransaction entityTransaction;
	private EntityManagerFactory entityManagerFactory;

	public User addUser(User user) {
		openConnection();
		entityTransaction.begin();
		entityManager.persist(user);
		entityTransaction.commit();
		closeConnection();
		return user;
	}
	
	public List<User> findAllUser()
	{
		openConnection();
		Query query = entityManager.createQuery("SELECT user from User user");
		@SuppressWarnings("unchecked")
		List<User> resultList = (List<User>)query.getResultList();
		
		closeConnection();
		return resultList;
	}

	public User login(String email, String password) {
		User user;
		openConnection();
		Query query = entityManager.createQuery("SELECT  user FROM User user WHERE user.email = ?1 and user.password = ?2");
		query.setParameter(1, email);
		query.setParameter(2, password);
		try {
			user = (User) query.getSingleResult();
		} catch (NoResultException e) {
			user = null;
		}
		closeConnection();
		return user;
	}

	public User findUserByUserId(int id) {
		User user;
		openConnection();
		user = entityManager.find(User.class, id);
		closeConnection();
		return user;
	}
	
	public void blgoandUserMap(int userid, int blogid)
	{
		System.out.println("blgoandUserMap()");
		openConnection();
		User user = entityManager.find(User.class, userid);
		BlogsDTO blog = entityManager.find(BlogsDTO.class, blogid);
		
		List<BlogsDTO> blogs = user.getWebBlogs();
		blogs.add(blog);
		
		user.setWebBlogs(blogs);
		entityTransaction.begin();
		entityManager.persist(user);
		entityTransaction.commit();
	
	
		closeConnection();
	}
	
	public User updateUser(String name,String email, long mobile, String password,HttpSession httpSession)
	{
		openConnection();
		User user1 = (User) httpSession.getAttribute("user");
		User user = entityManager.find(User.class ,user1.getId());
		user.setEmail(email);
		user.setMobile(mobile);
		user.setUserName(name);
		user.setPassword(password);		
		
		entityTransaction.begin();
		entityManager.persist(user);
		entityTransaction.commit();
		closeConnection();
		
		return user;	
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

}
