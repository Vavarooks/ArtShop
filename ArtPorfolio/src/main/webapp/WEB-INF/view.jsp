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
	<br>
	<h1 class="text-center">Most Recent Post of Today</h1>
	<div class="d-block border border-dark p-4 card mx-auto w-50">
		<div id="carouselExampleCaptions" class="carousel slide"
			data-bs-ride="false">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="/images/Feilds.png" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h5>Title</h5>
						<p>Description</p>
						<a class="btn btn-secondary" href="/view/art">View</a>
					</div>
				</div>
				<div class="carousel-item">
					<img src="/images/Forest.png" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h5>Title</h5>
						<p>Description</p>
						<a class="btn btn-secondary" href="/view/art">View</a>
					</div>
				</div>
				<div class="carousel-item">
					<img src="/images/ocean.png" class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h5>Title</h5>
						<p>Description</p>
						<a class="btn btn-secondary" href="/view/art">View</a>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>