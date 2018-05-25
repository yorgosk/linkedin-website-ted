package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ArticleDAO;
import dao.ArticleDAOImpl;
import dao.CommentDAO;
import dao.CommentDAOImpl;
import dao.EducationDAO;
import dao.EducationDAOImpl;
import dao.JobDAO;
import dao.JobDAOImpl;
import dao.LikeArticleDAO;
import dao.LikeArticleDAOImpl;
import dao.LikeListingDAO;
import dao.LikeListingDAOImpl;
import dao.ListingDAO;
import dao.ListingDAOImpl;
import dao.SkillDAO;
import dao.SkillDAOImpl;
import dao.UserDAO;
import dao.UserDAOImpl;
import model.Article;
import model.Comment;
import model.Education;
import model.Job;
import model.LikeArticle;
import model.LikeListing;
import model.Listing;
import model.Skill;
import model.User;

/**
 * Servlet implementation class UserNavigation
 */
@WebServlet("/UserProfile")
public class UserProfile extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String redirect = "/user_profile.jsp";
		
		Boolean isUser = (Boolean) session.getAttribute("isUser");
		
		if (isUser) {
			String userID = (String) session.getAttribute("userID");
			
			UserDAO userDAO = new UserDAOImpl();
			JobDAO jobDAO = new JobDAOImpl();
			SkillDAO skillDAO = new SkillDAOImpl();
			EducationDAO educationDAO = new EducationDAOImpl();
			ListingDAO listingDAO = new ListingDAOImpl();
			CommentDAO commentDAO = new CommentDAOImpl();
			ArticleDAO articleDAO = new ArticleDAOImpl();
			LikeArticleDAO likeArticleDAO = new LikeArticleDAOImpl();
			LikeListingDAO likeListingDAO = new LikeListingDAOImpl();
			
			User user = userDAO.find(Long.parseLong(userID));
			List<Job> userJobs = jobDAO.getUserJobs(Long.parseLong(userID));
			List<Skill> userSkills = skillDAO.getUserSkills(Long.parseLong(userID));
			List<Education> userEducation = educationDAO.getUserEducation(Long.parseLong(userID));
			List<Listing> userListings = listingDAO.getUserListings(Long.parseLong(userID));
			List<Comment> userComments = commentDAO.getUserComments(Long.parseLong(userID));
			List<Article> userArticles = articleDAO.getUserArticles(Long.parseLong(userID));
			List<LikeArticle> userLikeArticles = likeArticleDAO.getUserLikeArticles(Long.parseLong(userID));
			List<LikeListing> userLikeListings = likeListingDAO.getUserLikeListings(Long.parseLong(userID));
			
			request.setAttribute("user", user);
			request.setAttribute("userJobs", userJobs);
			request.setAttribute("userSkills", userSkills);
			request.setAttribute("userEducation", userEducation);
			request.setAttribute("userListings", userListings);
			request.setAttribute("userComments", userComments);
			request.setAttribute("userArticles", userArticles);
			request.setAttribute("userLikeArticles", userLikeArticles);
			request.setAttribute("userLikeListings", userLikeListings);
		}
		else {
			redirect = "/start_page.jsp";
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