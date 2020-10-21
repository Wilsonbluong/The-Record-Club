<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<style>
	* {
	margin: 0;
	padding: 0;
	height: auto;

}

body{
    font-family: 'Poppins', sans-serif;
    
    background: #659999;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #f4791f, #659999);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #f4791f, #659999); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
    
}

.nav {
    margin: 0px;
    padding:10px 10px 10px 20px;
}

.nav ul {
	display: flex;
  	flex-direction: row;
  	justify-content: center;
  	align-items: center;
}

.nav li {
    display: inline-block;
    margin: auto;
    vertical-align: bottom;
    color:black;
    background-color: white;
    border: 1px black solid;
    text-transform: uppercase;
    font-weight: lighter;
    text-decoration: none;
    list-style-type: none;
    padding: 10px 20px;
    margin: 5px;
    height: 15px;
}


.nav a {
	text-decoration: none;
}

li:hover {
  color: #ff7a59;
  border: #ff7a59 solid 1px;
  background:#fff;
    }


.main {
	display: flex;
	justify-content: center;
}

.title {
	font-family: 'Mr Dafoe', cursive;
	text-align: center;
	color: white;
	font-weight: lighter;
	font-size: 100px;
}

th, td { 
   	width:400px; 
    text-align:center; 
    padding-bottom: 10px;
}

.song {
	text-decoration: none;
	color: white;
	font-family: 'Oswald', sans-serif;
	font-size: 40px;
}

.artist {
	font-family: 'Oswald', sans-serif;
	font-size: 40px;
}
</style>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Mr+Dafoe&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@1,300&display=swap" rel="stylesheet">
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
			<h1 class="title">Your Collection.</h1>
		</div>
		
		<div class="main">
			 <table>
                <tr>
                    <th>Song Title</th>
                    <th>Artist</th>
                </tr>
                <c:forEach items="${user.songs}" var="song">
                <tr>
                    <td><a class="song" href="/song/${song.id}"><c:out value="${song.title}"/></a></td>
                    <td>
                    	<p class="artist"><c:out value="${song.artist}"/></p>
                    </td> 
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