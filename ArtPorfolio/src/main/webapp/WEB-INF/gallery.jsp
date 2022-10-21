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
		<h5>Art Board</h5>
			<a class="btn btn-secondary" href="/view/user">Home</a> <a
				class="btn btn-secondary" href="/gallery/${user.id}">View Your Gallery</a>
			<a class="btn btn-secondary" href="/make/art">Upload a piece</a>
			<%-- 			<c:if test="${newUser == newLogin}"> --%>
			<a class="btn btn-danger" href="/logout">Logout</a>
			<%-- 			</c:if>	 --%>
		</div>
	</nav>
	<h1 class="text-center">User Gallery</h1>
	<div class="d-block p-4 mx-auto w-50">
		<div class="row g-4">
		<c:forEach items="${user.art}" var="art">
				<div class="col-6">
					<div class="card">
						<img src="${art.imageName}" class="card-img-top image"
							alt="${art.artName}">
						<div class="card-body">
							<h5 class="card-title">Art Name: ${art.artName}</h5>
							<p class="card-text fst-italic">Description: ${art.artDescription}</p>
							<p class="card-text fw-lighter  fst-italic">Original Artist: ${art.painter}</p>
							<a class="btn btn-warning" href="/edit/${art.id}">Edit</a><a
								class="btn btn-danger" href="/delete/${art.id}">Delete</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>