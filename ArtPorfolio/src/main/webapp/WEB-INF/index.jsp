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
<body>
	<div class="d-flex">
		<div class="d-block border border-dark p-4 card mx-auto w-50">
			<h1>Register</h1>
			<form:form modelAttribute="newUser" method="POST" action="/register">
				<div class="row">
					<div class="col-12">
						<form:label path="username" class="form-label">Username</form:label>
						<form:errors path="username" class="text-danger"/>
						<form:input path="username" type="text" class="form-control"/>
					</div>
					<div class="col-12">
						<form:label path="email" class="form-label">Email</form:label>
						<form:errors path="email" class="text-danger"/>
						<form:input path="email" type="email" class="form-control"/>
					</div>
					<div class="col-12">
						<form:label path="password" class="form-label">Password</form:label>
						<form:errors path="password" class="text-danger"/>
						<form:input path="password" type="password" class="form-control"/>
					</div>
					<div class="col-12">
						<form:label path="confirm" class="form-label">Confirm Password</form:label>
						<form:errors path="confirm" class="text-danger"/>
						<form:input path="confirm" type="pasword" class="form-control"/>
					</div>
					<div>
						<button class="btn btn-primary mt-3">Submit</button>
					</div>
				</div>
			</form:form>
		</div>
		<div class="d-block border border-dark p-4 card mx-auto w-25">
			<h1>Log In</h1>
			<form:form modelAttribute="newLogin" method="POST" action="/login">
				<div class="row">
					<div class="col-12">
						<form:label path="email" class="form-label">Email</form:label>
						<form:errors path="email" class="text-danger"/>
						<form:input path="email" type="email" class="form-control"/>
					</div>
					<div class="col-12">
						<form:label path="password" class="form-label">Password</form:label>
						<form:errors path="password" class="text-danger"/>
						<form:input path="password" type="password" class="form-control"/>
					</div>
					<div>
						<button class="btn btn-primary mt-3">Submit</button>
					</div>
				</div>
			</form:form>
		</div>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>