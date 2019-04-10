<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>TFGView</title>
</head>
<body>

	
   	<shiro:user>
    Welcome back <shiro:principal />! Click <a href="LogoutServlet">here</a> to logout.
	<h2 style="color: blue">Tus TFGs</h2>
	</shiro:user>

		<table border="1">
			<tr>
				<th>Título</th>
				<th>Email alumno</th>
				<th>Nombre del alumno</th>
				<th>Email tutor</th>
				<th>Nombre del tutor</th>
				<th>Estado del TFG</th>
				<th>Memoria</th>
				<th>Acción requerida</th>
			</tr>
			<c:forEach items="${professor.advisedTFGs}" var="tfgi"> <!-- metodo de professor -->
				<tr>
					<td>${tfgi.title }</td>
					<td>${tfgi.email }</td>
					<td>${tfgi.name }</td>
					<td>${tfgi.advisor.email }</td>
					<td>${tfgi.advisor.name }</td>
					<td>${tfgi.status }</td>
					<td><c:if test="${tfgi.status > 3}">
							<form action="ServeFileServlet" method="get">
								<input type="hidden" name="email" value="${tfgi.email}" />
								<button type="submit">Descargar</button>
							</form>
						</c:if></td>
					<td><c:if test="${tfgi.status == 1}">
							<form action="Form2ProfessorServlet" method="post">
								<input type="hidden" name="email" value="${tfgi.email}" />
								<input type="hidden" name="emailTutor" value="${professor.email}" />
								<button type="submit">Aceptar tfg</button>
							</form>
						</c:if></td>
				</tr>
			</c:forEach>
		</table>
	
</body>
</html>