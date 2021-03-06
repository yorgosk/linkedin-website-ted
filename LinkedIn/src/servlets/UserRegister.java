package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import dao.UserDAOImpl;
import jpautils.FileUploadSystem;
import jpautils.PasswordAuthentication;
import model.User;


/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserRegister")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class UserRegister extends HttpServlet {

	private static final long serialVersionUID = 1L;
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Obtain a database connection:
//        EntityManagerFactory emf =
//           (EntityManagerFactory)getServletContext().getAttribute("emf");
//        EntityManager em = emf.createEntityManager();
		UserDAO dao = new UserDAOImpl();
		HttpSession session = request.getSession();
        
        String redirect = "/user_homepage.jsp";
        
//        try {
        	String email = request.getParameter("email");
        	String password = request.getParameter("password");
        	String confirmPassword = request.getParameter("confirmPassword");
        	String firstName = request.getParameter("firstName");
        	String lastName = request.getParameter("lastName");
        	String phoneNumber = request.getParameter("phoneNumber");
        	System.out.println("A");
        	
        	User user = new User();
        	user.setEmail(email);
        	if (password.equals(confirmPassword)) {
        		User temp = dao.find(email);
        		if (temp == null) {
        			FileUploadSystem fileUploadSystem = new FileUploadSystem();
        			
        			PasswordAuthentication pa = new PasswordAuthentication();
        			@SuppressWarnings("deprecation")
					String passwordHashed = pa.hash(password);
        			//user.setUserID("6");
            		user.setPasswordHashed(passwordHashed);	// TODO: hash
                	user.setFirstName(firstName);
                	user.setLastName(lastName);
                	user.setEmail(email);
                	user.setPhoneNumber(phoneNumber);
                	user.setPhotoPath(fileUploadSystem.uploadPhoto(request));
                	user.setCvPath(fileUploadSystem.uploadCV(request));
                	System.out.println("B");
                	
                	// TODO: may need checking
//                	em.getTransaction().begin();
//                    em.persist(user);
//                    em.getTransaction().commit();
                	dao.create(user);
                	System.out.println("C");
                    
//                    List<User> users = em.createQuery("SELECT u FROM user u", User.class).getResultList();
//                	List<User> users = dao.list();
                    User userRegistered = dao.find(email);
                    request.setAttribute("user", userRegistered);
                    session.setAttribute("isUser", true);
                    session.setAttribute("userID", userRegistered.getUserID() );
                    
                	System.out.println("D");
                	
                	redirect = "UserNavigation?action=Homepage";
        		}
        		else {
        			redirect = "signup_error.jsp";
        			session.setAttribute("errorMsg", "email already exists");
        		}
        	}
        	else {
        		redirect = "signup_error.jsp";
    			session.setAttribute("errorMsg", "passwords do not match");
        	}
//        }
//        finally {
        	 // Close the database connection:
//            if (em.getTransaction().isActive())
//                em.getTransaction().rollback();
//            em.close();
//        }
        
        request.getRequestDispatcher(redirect).forward(request, response);
	}
}
