<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<title>Artist Board</title>
</head>
<body>

	<nav class="navbar bg-light">
		<div class="container-fluid">
			<a class="btn btn-secondary" href="/view/user">Home</a> <a
				class="btn btn-secondary" href="/view/gallery">View Your Gallery</a>
			<a class="btn btn-secondary" href="/upload/art">Upload a piece</a>
			<%-- 			<c:if test="${newUser == newLogin}"> --%>
			<a class="btn btn-danger" href="/logout">Logout</a>
			<%-- 			</c:if>	 --%>
		</div>
	</nav>
	<h1 class="text-center">Edit Your Art</h1>
	<form class="d-block border border-dark p-4 card mx-auto w-50">
		<div class="mb-3">
		<label path="artName" class="form-label">Art Name</label>
<%-- 			<form:errors path="artName"/> --%>
			<input path="artName" class="form-control" type="text" placeholder="Name Here"/>
		</div>
		<div class="mb-3">
		<label path="artData" for="formFile" class="form-label">Description of the art</label>
<%-- 			<form:errors path="artDescription"/> --%>
			<textarea path="artDescription" type="text" class="form-control">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illum excepturi ducimus assumenda fuga at sint qui fugit aliquid animi doloribus tempora beatae dolores est. Quae labore ad debitis blanditiis sequi.</textarea>
			
		</div>
		<div class="mb-3">
<%-- 			<form:errors path="artData" /> --%>
			<label path="artData" for="formFile" class="form-label">Image Upload
				example</label>
			<input path="artData" class="form-control" type="file"
				id="formFile" />
		</div>
		<button class="btn btn-info">Submit</button>
	</form>

	<script src="https://kit.fontawesome.com/7bd86abbf0.js" crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>