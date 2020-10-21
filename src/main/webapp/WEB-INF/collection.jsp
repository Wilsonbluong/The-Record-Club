<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Mr+Dafoe&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@1,300&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/collection.css">

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
			<h1 class="title">Our Collection.</h1>
		</div>
		
		<div class="main">
			 <table>
                <tr>
                    <th>Song Title</th>
                    <th>Artist</th>
                </tr>
                <c:forEach items="${songs}" var="song">
                <tr>
                    <td><a class="song" href="/song/${song.id}"><c:out value="${song.title}"/></a></td>
                    <td>
                    	<p class="artist"><c:out value="${song.artist}"/></p>
                </tr>
                </c:forEach>
            </table>
		</div>
			
	</div>
	
	<div>
		<footer>
			
		</footer>
	</div>
</body>
</html>