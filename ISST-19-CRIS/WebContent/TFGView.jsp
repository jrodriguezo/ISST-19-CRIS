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
	<h2 style="color: blue">Tus TFG</h2>
	
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
	
				<tr>
					<td>${tfg.title }</td>
					<td>${tfg.email }</td>
					<td>${tfg.name }</td>
					<td>${tfg.advisor.email }</td>
					<td>${tfg.advisor.name }</td>
					<td>${tfg.status }</td>
					<td><c:if test="${tfg.status > 3}">
							<form action="ServeFileServlet" method="get">
								<input type="hidden" name="email" value="${tfg.email}" />
								<button type="submit">Descargar</button>
							</form>
						</c:if></td>
					<td><c:if test="${tfg.status == 3}">
							<form action="Form4TFGServlet" method="post" enctype="multipart/form-data">
								<input type="hidden" name="email" value="${tfg.email}" />
   								<input type="file" name="file"/>
								<button type="submit">Subir memoria</button>
							</form>
						</c:if></td>
				</tr>
		</table>
	</shiro:user>
</body>
</html>