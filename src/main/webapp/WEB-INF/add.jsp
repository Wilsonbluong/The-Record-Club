<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/add.css">
<link href="https://fonts.googleapis.com/css2?family=Mr+Dafoe&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>The Record Club</title>
</head>
<body>
	<div class="container">
		<div class="nav">
			<ul class="nav">
                <li><a href="/home">Home</a></li>
                <li><a href="/add">Add Music</a></li>
                <li><a href="/collection">Collection</a></li>
                <li><a href="/${user.id}/yourcollection"><c:out value="${user.firstName}"/>'s songs</a></li>
                <li><a href="/members">Members</a></li>
                <li><a href="/logout">Logout</a></li>
            </ul>
		</div>
		
		<div class="jumbotron">
			<h1 class="title">Add a new song.</h1>
		</div>
		
		<div class="main">
			<form:form action="/add" method="post" modelAttribute="addNew">		
			<p class="errors">
				<form:errors path="title"/>
			</p> 
		    <h2>
		        <form:label path="title"></form:label>
		        <form:input path="title" placeholder="Title"/>
		        
		    </h2>
		    <p class="errors">
				<form:errors path="artist"/>
			</p>
		    <h2>
		        <form:label path="artist"></form:label>
		        <form:input path="artist" placeholder="Artist"/>
		    </h2>
		    <input type="submit" value="Add Song" class="submit"/>	 
		</form:form>
			
		</div>
		
		<footer>
			
		</footer>
	</div>
</body>
</html>