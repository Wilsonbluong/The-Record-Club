<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Mr+Dafoe&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@1,300&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/members.css">

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
			<h1 class="title">The members.</h1>
		</div>
		
		<div class="main">
                <c:forEach items="${users}" var="user">
                <ul class="list">
                    <li class="item"><a class="member" href="/members/${user.id}"><c:out value="${user.firstName}"/> <c:out value="${user.lastName}"/></a></li>
                </ul>
                </c:forEach>
		</div>
			
	</div>
	
	<div>
		<footer>
			
		</footer>
	</div>
</body>
</html>