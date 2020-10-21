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

}

body{
    font-family: 'Poppins', sans-serif;
    overflow: hidden;
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

.errors {
	text-align: center;
}

input {
	display: inline-block;
	margin-bottom: 10px;
	height: 35px;
	width: 300px;
	font-size:14pt;
	text-align: center;
}

.submit {
	font-size: 12px;
	color: white;
	line-height: 42px;
	display: block;
	width: 100%;
	height: 42px;
	cursor: pointer;
	vertical-align: middle;
	letter-spacing: 2px;
	text-transform: uppercase;
	border: 1px solid;
	background: transparent;
}

.submit:hover {
    color: #ffffff;
    background: #f6b93b;
    border-color: #f6b93b;
    transition: all 0.4s ease 0s;
}

.edit {
	margin-top: 15px;
	text-decoration: none;
	text-align: center;
	color: white;
	font-size: 12px;
	line-height: 42px;
	display: block;
	width: 100%;
	height: 42px;
	cursor: pointer;
	vertical-align: middle;
	letter-spacing: 2px;
	text-transform: uppercase;
	border: 1px solid;
	background: transparent;
}

.edit:hover {
    color: #ffffff;
    background: #f6b93b;
    border-color: #f6b93b;
    transition: all 0.4s ease 0s;
}

.button {
	display: flex;
	justify-content: center;
}

</style>
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
			<h1 class="title">Edit song.</h1>
		</div>
		
		<div class="main">
			<form:form action="/add" method="post" modelAttribute="song">		
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
		    <input type="submit" value="Update" class="submit"/>	 
		    
		    <div class="button">
				<a class="edit" href="/song/${song.id}/delete">Delete</a>
			</div>
			
			<div class="button">
				<a class="edit" href="/song/${song.id}">Cancel</a>
			</div>
		</form:form>

			
		</div>
		
		<footer>
			
		</footer>
	</div>
</body>
</html>