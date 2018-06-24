<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.*,java.math.*,model.User,model.Job,model.Skill,model.Education,model.Listing,model.Comment,model.Article,model.LikeArticle,model.LikeListing"%>
<!-- source: https://stackoverflow.com/questions/6162401/convert-and-format-a-date-in-jsp?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<title>Profile</title>
  	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
  	<link rel="stylesheet" href="./css/start_page.css">
  
</head>
<body>

	<!-- NAVBAR -->
  	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    	<div class="col-md-4">
      		<a class="navbar-brand" href="#">LinkedIn Clone</a>
      		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
        		<span class="navbar-toggler-icon"></span>
      		</button>
    	</div>
    	<div class="col-md-2"></div>
    	<div class="col-md-6">
      		<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
        		<form class="form-inline my-2 my-lg-0" action="UserLogout" method="post" id="userForm">
          			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Log-out</button>
        		</form>
      		</div>
    	</div>
  	</nav>
  	
	<!-- source: https://www.codeply.com/go/5Lu0E8graQ -->

	<div class="pricing-header px-4 py-4 pt-md-4 pb-md-4 mx-auto text-center">
      <h1 class="display-5">${user.getFirstName()} ${user.getLastName()}</h1>
    </div>
    
    <br>
    <c:if test="${not empty userID2}">
    	<a href="UserMessenger?receiverID=${userID2}"> Send a message </a>
  	</c:if>
    
    <br>
    
    <c:if test="${not empty userID2}">
    	<c:if test="${empty noFriendRequest}">
    		<a href="UserSendFriendRequest?userID2=${userID2}&email=${email}"> Send friend request </a>
  		</c:if>
	</c:if>
	
	<br>
	
	<div class="container">
	    <div class="row my-2">
	        <div class="col-lg-8 order-lg-2">
	            <div class="tab-content py-4">
	                <div class="tab-pane active" id="profile">
	                    <div class="row">
	                    
	                    	<div class="col-md-12">
	                            <h5 class="mt-2"><span class="fa fa-clock-o ion-clock float-right"></span>Jobs</h5>
	                            <table class="table table-sm table-hover table-striped">
	                                <tbody>
										<c:if test="${jobs.size() != 0}">
											<c:if test="${jobs.size() <= 3}">
												<c:forEach var="i" begin="0" end="${jobs.size()-1}" step="1">
													<tr>
			                                        	<td>
			                                            	<strong>${jobs.get(i).getJobTitle()}</strong> from <strong><fmt:formatDate value="${jobs.get(i).getJobFrom()}" pattern="yyyy-MM-dd HH:mm:ss" /></strong> to <strong><fmt:formatDate value="${jobs.get(i).getJobTo()}" pattern="yyyy-MM-dd HH:mm:ss" /></strong>
			                                            	<p>${jobs.get(i).getJobDescription()}</p>
			                                        	</td>
			                                    	</tr>
		                                    	</c:forEach>
	                                    	</c:if>
	                                    	<c:if test="${jobs.size() > 3}">
												<c:forEach var="i" begin="0" end="2" step="1">
													<tr>
			                                        	<td>
			                                            	<strong>${jobs.get(i).getJobTitle()}</strong> from <strong><fmt:formatDate value="${jobs.get(i).getJobFrom()}" pattern="yyyy-MM-dd HH:mm:ss" /></strong> to <strong><fmt:formatDate value="${jobs.get(i).getJobTo()}" pattern="yyyy-MM-dd HH:mm:ss" /></strong>
			                                            	<p>${jobs.get(i).getJobDescription()}</p>
			                                        	</td>
			                                    	</tr>
		                                    	</c:forEach>
		                                    	<!-- TODO -->
		                                    	<a class="btn btn-primary" href="UserProfileShowAll?action=jobs&email=${email}" role="button">Show all jobs</a>
	                                    	</c:if>
										</c:if>
										<c:if test="${jobs.size() == 0}">
											<tr>
												<td>
													<p>No jobs provided yet</p>
												</td>
											</tr>
										</c:if>
	                                </tbody>
	                            </table>
	                        </div>
	                    
	                    	<div class="col-md-12">
	                            <h5 class="mt-2"><span class="fa fa-clock-o ion-clock float-right"></span>Education</h5>
	                            <table class="table table-sm table-hover table-striped">
	                                <tbody>                                
	                                    <c:if test="${education.size() != 0}">
											<c:if test="${education.size() <= 3}">
												<c:forEach var="i" begin="0" end="${education.size()-1}" step="1">
													<tr>
			                                        	<td>
			                                            	<strong>${education.get(i).getEducationTitle()}</strong> from <strong><fmt:formatDate value="${education.get(i).getEducationFrom()}" pattern="yyyy-MM-dd HH:mm:ss" /></strong> to <strong><fmt:formatDate value="${education.get(i).getEducationTo()}" pattern="yyyy-MM-dd HH:mm:ss" /></strong>
			                                            	<p>${education.get(i).getEducationDescription()}</p>
			                                        	</td>
			                                    	</tr>
		                                    	</c:forEach>
	                                    	</c:if>
	                                    	<c:if test="${education.size() > 3}">
												<c:forEach var="i" begin="0" end="2" step="1">
													<tr>
			                                        	<td>
			                                            	<strong>${education.get(i).getEducationTitle()}</strong> from <strong><fmt:formatDate value="${education.get(i).getEducationFrom()}" pattern="yyyy-MM-dd HH:mm:ss" /></strong> to <strong><fmt:formatDate value="${education.get(i).getEducationTo()}" pattern="yyyy-MM-dd HH:mm:ss" /></strong>
			                                            	<p>${education.get(i).getEducationDescription()}</p>
			                                        	</td>
			                                    	</tr>
		                                    	</c:forEach>
		                                    	<!-- TODO -->
		                                    	<a class="btn btn-primary" href="UserProfileShowAll?action=education&email=${email}" role="button">Show all education</a>
	                                    	</c:if>
										</c:if>
										<c:if test="${education.size() == 0}">
											<tr>
												<td>
													<p>No education provided yet</p>
												</td>
											</tr>
										</c:if>
	                                </tbody>
	                            </table>
	                        </div>
	                    
	                    	<div class="col-md-12">
	                            <h5 class="mt-2"><span class="fa fa-clock-o ion-clock float-right"></span>Skills</h5>
	                            <table class="table table-sm table-hover table-striped">
	                                <tbody>                                    
	                                    <c:if test="${skills.size() != 0}">
											<c:if test="${skills.size() <= 3}">
												<c:forEach var="i" begin="0" end="${skills.size()-1}" step="1">
													<tr>
			                                        	<td>
			                                            	<strong>${skills.get(i).getSkill()}</strong>
			                                            </td>
			                                    	</tr>
		                                    	</c:forEach>
	                                    	</c:if>
	                                    	<c:if test="${skills.size() > 3}">
												<c:forEach var="i" begin="0" end="2" step="1">
													<tr>
			                                        	<td>
			                                            	<strong>${skills.get(i).getSkill()}</strong>
			                                            </td>
			                                    	</tr>
		                                    	</c:forEach>
		                                    	<!-- TODO -->
		                                    	<a class="btn btn-primary" href="UserProfileShowAll?action=skills&email=${email}" role="button">Show all skills</a>
	                                    	</c:if>
										</c:if>
										<c:if test="${skills.size() == 0}">
											<tr>
												<td>
													<p>No skills provided yet</p>
												</td>
											</tr>
										</c:if>
	                                </tbody>
	                            </table>
	                        </div>
	                    
	                    	<div class="col-md-12">
	                            <h5 class="mt-2"><span class="fa fa-clock-o ion-clock float-right"></span>Articles</h5>
	                            <table class="table table-sm table-hover table-striped">
	                                <tbody>                                    
	                                    <c:if test="${articles.size() != 0}">
											<c:if test="${articles.size() <= 3}">
												<c:forEach var="i" begin="0" end="${articles.size()-1}" step="1">
													<tr>
			                                        	<td>
			                                            	<strong>${articles.get(i).getTitle()}</strong> published <strong><fmt:formatDate value="${articles.get(i).getPubDate()}" pattern="yyyy-MM-dd HH:mm:ss" /></strong>
			                                           	</td>
			                                    	</tr>
		                                    	</c:forEach>
	                                    	</c:if>
	                                    	<c:if test="${articles.size() > 3}">
												<c:forEach var="i" begin="0" end="2" step="1">
													<tr>
			                                        	<td>
			                                            	<strong>${articles.get(i).getTitle()}</strong> published <strong><fmt:formatDate value="${articles.get(i).getPubDate()}" pattern="yyyy-MM-dd HH:mm:ss" /></strong>
			                                           	</td>
			                                    	</tr>
		                                    	</c:forEach>
		                                    	<!-- TODO -->
		                                    	<a class="btn btn-primary" href="UserProfileShowAll?action=articles&email=${email}" role="button">Show all articles</a>
	                                    	</c:if>
										</c:if>
										<c:if test="${articles.size() == 0}">
											<tr>
												<td>
													<p>No articles published yet</p>
												</td>
											</tr>
										</c:if>
	                                </tbody>
	                            </table>
	                        </div>
	                        
	                        <div class="col-md-12">
	                            <h5 class="mt-2"><span class="fa fa-clock-o ion-clock float-right"></span>Listings</h5>
	                            <table class="table table-sm table-hover table-striped">
	                                <tbody>                                  
	                                    <c:if test="${listings.size() != 0}">
											<c:if test="${listings.size() <= 3}">
												<c:forEach var="i" begin="0" end="${listings.size()-1}" step="1">
													<tr>
			                                        	<td>
			                                            	<strong>${listings.get(i).getTitle()}</strong> published <strong><fmt:formatDate value="${listings.get(i).getPubDate()}" pattern="yyyy-MM-dd HH:mm:ss" /></strong>
			                                           		<p>${listings.get(i).getDescription()}</p>
			                                           	</td>
			                                    	</tr>
		                                    	</c:forEach>
	                                    	</c:if>
	                                    	<c:if test="${listings.size() > 3}">
												<c:forEach var="i" begin="0" end="2" step="1">
													<tr>
			                                        	<td>
			                                            	<strong>${listings.get(i).getTitle()}</strong> published <strong><fmt:formatDate value="${listings.get(i).getPubDate()}" pattern="yyyy-MM-dd HH:mm:ss" /></strong>
			                                           		<p>${listings.get(i).getDescription()}</p>
			                                           	</td>
			                                    	</tr>
		                                    	</c:forEach>
		                                    	<!-- TODO -->
		                                    	<a class="btn btn-primary" href="UserProfileShowAll?action=listings&email=${email}" role="button">Show all listings</a>
	                                    	</c:if>
										</c:if>
										<c:if test="${listings.size() == 0}">
											<tr>
												<td>
													<p>No listings published yet</p>
												</td>
											</tr>
										</c:if>
	                                </tbody>
	                            </table>
	                        </div>
	                        
	                        <div class="col-md-12">
	                            <h5 class="mt-2"><span class="fa fa-clock-o ion-clock float-right"></span>Comments</h5>
	                            <table class="table table-sm table-hover table-striped">
	                                <tbody>
	                                    <c:if test="${comments.size() != 0}">
											<c:if test="${comments.size() <= 3}">
												<c:forEach var="i" begin="0" end="${comments.size()-1}" step="1">
													<tr>
			                                        	<!-- substring source: https://stackoverflow.com/questions/1583940/how-do-i-get-the-first-n-characters-of-a-string-without-checking-the-size-or-goi -->
			                                        	<td>
			                                            	<strong>${comments.get(i).getText().substring(0, Math.min(comments.get(i).getText().length(), 20))}</strong> published <strong><fmt:formatDate value="${comments.get(i).getPubDate()}" pattern="yyyy-MM-dd HH:mm:ss" /></strong>
			                                           	</td>
			                                    	</tr>
		                                    	</c:forEach>
	                                    	</c:if>
	                                    	<c:if test="${comments.size() > 3}">
												<c:forEach var="i" begin="0" end="2" step="1">
													<tr>
			                                        	<!-- substring source: https://stackoverflow.com/questions/1583940/how-do-i-get-the-first-n-characters-of-a-string-without-checking-the-size-or-goi -->
			                                        	<td>
			                                            	<strong>${comments.get(i).getText().substring(0, Math.min(comments.get(i).getText().length(), 20))}</strong> published <strong><fmt:formatDate value="${comments.get(i).getPubDate()}" pattern="yyyy-MM-dd HH:mm:ss" /></strong>
			                                           	</td>
			                                    	</tr>
		                                    	</c:forEach>
		                                    	<!-- TODO -->
		                                    	<a class="btn btn-primary" href="UserProfileShowAll?action=comments&email=${email}" role="button">Show all comments</a>
	                                    	</c:if>
										</c:if>
										<c:if test="${comments.size() == 0}">
											<tr>
												<td>
													<p>No comments published yet</p>
												</td>
											</tr>
										</c:if>
	                                </tbody>
	                            </table>
	                        </div>
	                        
	                        <div class="col-md-12">
	                            <h5 class="mt-2"><span class="fa fa-clock-o ion-clock float-right"></span>Liked Articles</h5>
	                            <table class="table table-sm table-hover table-striped">
	                                <tbody>
	                                    <c:if test="${likedArticlesDetails.size() != 0}">
											<c:if test="${likedArticlesDetails.size() <= 3}">
												<c:forEach var="i" begin="0" end="${likedArticlesDetails.size()-1}" step="1">
													<tr>
			                                        	<td>
			                                            	<strong>${likedArticlesDetails.get(i).getTitle()}</strong> published by <strong>${likedArticlesDetails.get(i).getUser().getFirstName} ${likedArticlesDetails.get(i).getUser().getLastName}</strong> at <strong><fmt:formatDate value="${likedArticlesDetails.get(i).getPubDate()}" pattern="yyyy-MM-dd HH:mm:ss" /></strong>
			                                           	</td>
			                                    	</tr>
		                                    	</c:forEach>
	                                    	</c:if>
	                                    	<c:if test="${likedArticlesDetails.size() > 3}">
												<c:forEach var="i" begin="0" end="2" step="1">
													<tr>
			                                        	<td>
			                                            	<strong>${likedArticlesDetails.get(i).getTitle()}</strong> published by <strong>${likedArticlesDetails.get(i).getUser().getFirstName} ${likedArticlesDetails.get(i).getUser().getLastName}</strong> at <strong><fmt:formatDate value="${likedArticlesDetails.get(i).getPubDate()}" pattern="yyyy-MM-dd HH:mm:ss" /></strong>
			                                           	</td>
			                                    	</tr>
		                                    	</c:forEach>
		                                    	<!-- TODO -->
		                                    	<a class="btn btn-primary" href="UserProfileShowAll?action=liked_articles&email=${email}" role="button">Show all liked articles</a>
	                                    	</c:if>
										</c:if>
										<c:if test="${likedArticlesDetails.size() == 0}">
											<tr>
												<td>
													<p>No articles liked so far</p>
												</td>
											</tr>
										</c:if>
	                                </tbody>
	                            </table>
	                        </div>
	                        
	                        <div class="col-md-12">
	                            <h5 class="mt-2"><span class="fa fa-clock-o ion-clock float-right"></span>Liked Listings</h5>
	                            <table class="table table-sm table-hover table-striped">
	                                <tbody>
	                                   <c:if test="${likedListingsDetails.size() != 0}">
											<c:if test="${likedListingsDetails.size() <= 3}">
												<c:forEach var="i" begin="0" end="${likedListingsDetails.size()-1}" step="1">
													<tr>
			                                        	<td>
			                                            	<strong>${likedListingsDetails.get(i).getTitle()}</strong> published by <strong>${likedListingsDetails.get(i).getUser().getFirstName} ${likedListingsDetails.get(i).getUser().getLastName}</strong> at <strong><fmt:formatDate value="${likedListingsDetails.get(i).getPubDate()}" pattern="yyyy-MM-dd HH:mm:ss" /></strong>
			                                           	</td>
			                                    	</tr>
		                                    	</c:forEach>
	                                    	</c:if>
	                                    	<c:if test="${likedListingsDetails.size() > 3}">
												<c:forEach var="i" begin="0" end="2" step="1">
													<tr>
			                                        	<td>
			                                            	<strong>${likedListingsDetails.get(i).getTitle()}</strong> published by <strong>${likedListingsDetails.get(i).getUser().getFirstName} ${likedListingsDetails.get(i).getUser().getLastName}</strong> at <strong><fmt:formatDate value="${likedListingsDetails.get(i).getPubDate()}" pattern="yyyy-MM-dd HH:mm:ss" /></strong>
			                                           	</td>
			                                    	</tr>
		                                    	</c:forEach>
		                                    	<!-- TODO -->
		                                    	<a class="btn btn-primary" href="UserProfileShowAll?action=liked_listings&email=${email}" role="button">Show all liked listings</a>
	                                    	</c:if>
										</c:if>
										<c:if test="${likedListingsDetails.size() == 0}">
											<tr>
												<td>
													<p>No listings liked so far</p>
												</td>
											</tr>
										</c:if>
	                                </tbody>
	                            </table>
	                        </div>
	                        
						</div>
	               	</div>
	         	</div>
	       	</div>
	       	
	        <div class="col-lg-4 order-lg-1 text-center">
	            <img src="${user.getPhotoPath()}" class="mx-auto img-fluid img-circle d-block" alt="avatar">
	            <h6 class="mt-2">Upload a different photo</h6>
	            	<form class="form-photoFileFromProfile" action="UploadPhotoFromProfile" method="post" id="profileUploadPhotoForm" enctype = "multipart/form-data">
	            		<label class="custom-file">
		                	<input class="form-control" id="photo" name="photo" type="file"
	              				accept="image/jpeg,image/gif,image/png,application/pdf,image/x-eps" >
		                	<span class="custom-file-control">Choose new photo file</span>
	            		</label>
		            </form>
	            <br>
	            <br>
	            <br>
	        	<h5>Email:</h5>
	        	<p>${user.getEmail()}</p>
	        	<h5>Phone:</h5>
	        	<p>${user.getPhoneNumber()}</p>
	        	<c:if test="${!user.getCvPath().equals(\"\")}">
	        		<h6><a href="${user.getCvPath()}">Curriculum Vitae</a></h6>
	        	</c:if>
	        	<c:if test="${user.getCvPath().equals(\"\")}">
	        		<h6>Curriculum Vitae</h6>
	        	</c:if>
		        	<form class="form-cvFileFromProfile" action="UploadCvFromProfile" method="post" id="profileUploadCvForm" enctype = "multipart/form-data">
	            		<label class="custom-file">
		                <input class="form-control" id="cv" name="cv" type="file"
	              				accept="application/pdf" >
		                <span class="custom-file-control">Choose new CV file</span>
		            </label>
		        </form>
	        </div>
	    </div>
	</div>

    
	<!-- FOOTER -->
  	<footer class="footer" style="background-color: lightgrey;padding-top: 50px;">
    	<div class="container" >
      		<div class=row>
        		<div class="col-md-4"></div>
      			<div class="col-md-2">
	        		<h4>About Us</h4>
	        		<a href="#"><p style="margin-bottom: 3px;">About</p></a>
	        		<a href="#"><p style="margin-bottom: 3px;">News</p></a>
	        		<a href="#"><p style="margin-bottom: 3px;">Services</p></a>
	        		<a href="#"><p style="margin-bottom: 3px;">FAQ</p></a>
	      		</div>
	      		<div class="col-md-2">
	        		<h4>Contact Us</h4>
	        		<p>tel  : 210 8898985 <br/>
	          			fax: 210 8898900 <br/>
	          			email: tm39@li.com</p>
	        	</div>
        		<div class="col-md-4"></div>

      		</div>  <br>
      		<div class="footer-bottom">
        		<div class="container">
          			<div class="row">
            			<div class="col-md-12">
              				<!--Footer Bottom-->
              				<p class="text-center">&copy; Copyright 2018 - University of Athens Di.  All rights reserved.</p>
            			</div>
          			</div>
        		</div>
      		</div>
      	</div>
    </footer>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBX5iDXPWX9yVKjUC5FD_hX36CttO5DmzQ&callback=initMap">
    </script>

</body>
</html>