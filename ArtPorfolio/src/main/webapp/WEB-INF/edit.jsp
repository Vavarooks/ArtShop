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
<link rel="stylesheet" type="text/css" href="/css/styles.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<title>Artist Board</title>
</head>
<body class="splatter">
	<nav class="navbar bg-light">
		<div class="container-fluid">
		<h5>Art Board</h5>
			<a class="btn btn-secondary" href="/view/user">Home</a> <a
				class="btn btn-secondary" href="/gallery/${user.id}">View Your Gallery</a>
			<a class="btn btn-secondary" href="/make/art">Upload a piece</a>
			<%-- 			<c:if test="${newUser == newLogin}"> --%>
			<a class="btn btn-danger" href="/logout">Logout</a>
			<%-- 			</c:if>	 --%>
		</div>
	</nav>
	<br/>
	<div class="d-block border border-dark p-4 card mx-auto w-50">
	<h1 class="text-center">Edit Your Art</h1>
		<form:form modelAttribute="art" action="/changes/${art.id}" method="PUT" enctype="multipart/form-data">
			<form:input type="hidden" path="user" value="${user.id}"/>
			<div class="mb-3">
				<form:label path="artName" class="form-label">Art Name</form:label>
				<form:errors path="artName"/>
				<form:input path="artName" class="form-control" type="text" />
			</div>
			<div class="mb-3">
			<form:label path="painter" class="form-label">Original Artist</form:label>
				<form:errors path="painter"/>
				<form:input path="painter" class="form-control" type="text" />
			</div>
			<div class="mb-3">
				<form:label path="artDescription" for="formFile" class="form-label">Description of the art</form:label>
				<form:errors path="artDescription"/>
				<form:textarea path="artDescription" type="text" class="form-control"></form:textarea>

			</div>
			<div class="mb-3">
				<form:errors path="imageName"/>
				<form:label path="imageName" class="form-label">Put Image URL Here!</form:label>
				<form:input path="imageName" class="form-control" type="text"
					name="image" />
			</div>
			<button class="btn btn-info">Submit</button>
		</form:form>
	</div>

	<script src="https://kit.fontawesome.com/7bd86abbf0.js" crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>