package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ArticleDAO;
import dao.ArticleDAOImpl;
import dao.UserDAO;
import dao.UserDAOImpl;
import jpautils.FileUploadSystem;
import model.Article;

/**
 * Servlet implementation class UserAddPersonalInfo
 */
@WebServlet("/UserAddArticle")
public class UserAddArticle extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		/* TODO: check if alright */
		String redirect = null;
		
		Boolean isUser = (Boolean) session.getAttribute("isUser");
		String userID = (String) session.getAttribute("userID");
		
		if (isUser) {
			
			ArticleDAO articleDAO = new ArticleDAOImpl();
			UserDAO userDAO = new UserDAOImpl();
			
			Article article = new Article();
			
			FileUploadSystem fileUploadSystem = new FileUploadSystem();
			
			article.setText("apple apple");
			article.setTitle("apple");
			article.setUser(userDAO.find(Long.parseLong(userID)));
			article.setPubDate(new Date());			// return current date
			article.setAudioPath(fileUploadSystem.uploadAudio(request));
			article.setPicturePath(fileUploadSystem.uploadPhoto(request));
			article.setVideoPath(fileUploadSystem.uploadVideo(request));
			
			articleDAO.create(article);
			
			redirect = "UserNavigation?action=Homepage";
		}
		else {
			/* TODO: check if alright */
			redirect = "/user_homepage.jsp";
			session.setAttribute("errorMsg", "no authorization");
		}

		request.getRequestDispatcher(redirect).forward(request, response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
