<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<meta charset="UTF-8">
<title>Welcome</title>
</head>
<body>
	<div class="container">
	<h1 class="title">The Record Club</h1>
		<div class="main">
			<div class="register">
			<h1>SIGN UP</h1>
		    <p><form:errors path="user.*"/></p>
			    <form:form method="POST" action="/register" modelAttribute="user">
			    	<p>
			            <form:label path="firstName"></form:label>
			            <form:input type="text" path="firstName" placeholder="First name"/>
			        </p>
			        <p>
			            <form:label path="lastName"></form:label>
			            <form:input type="text" path="lastName" placeholder="Last name"/>
			        </p>
			        <p>
			            <form:label path="email"></form:label>
			            <form:input type="email" path="email" placeholder="Email"/>
			        </p>
			        <p>
			            <form:label path="password"></form:label>
			            <form:password path="password" placeholder="Password"/>
			        </p>
			        <p>
			            <form:label path="passwordConfirmation"></form:label>
			            <form:password path="passwordConfirmation" placeholder="Password Confirmation"/>
			        </p>
			        <input type="submit" value="Register" class="submit"/>
			    </form:form>
		    </div>
		    
		    <div class="login">
		    <h1>SIGN IN</h1>
		    <p><c:out value="${error}" /></p>
			    <form method="post" action="/login">
			        <p>
			            <label for="email"></label>
			            <input type="email" id="email" name="email" placeholder="Your email"/>
			        </p>
			        <p>
			            <label for="password"></label>
			            <input type="password" id="password" name="password" placeholder="Your password"/>
			        </p>
			        <input type="submit" value="Login" class="submit"/>
			    </form>
		    </div>
	    </div>
    </div>
</body>
</html>