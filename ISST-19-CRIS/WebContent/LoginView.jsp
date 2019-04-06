<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login View</title>
</head>
<body>
	<shiro:guest>
		<h2>Login</h2>
		<form action="LoginServlet" method="post">
			Email: <input type="text" name="email" placeholder="Email" />
			Password: <input type="password" name="password"
				placeholder="Password" />
			<button type="submit">Login</button>
		</form>
		
		<h3>Crear TFG nuevo</h3>
		<form action="CreateTFGServlet" method="post">
			<p>
				Titulo: <input type="text" name="title" />
			</p>
			<p>
				Email: <input type="text" name="email" />
			</p>
			<p>
				Name: <input type="text" name="name" />
			</p>
			<p>
				Password: <input type="password" name="pass" />
			</p>
			
			<p>
			Tutor: <select name="advisor">
  				<option value="" disabled selected>Elija un tutor</option>
				  <c:forEach items="${professor_list}" var="professori">
				    <option value="${ professori.email}">
				      ${professori.name}-${professori.email}
				    </option>
				  </c:forEach>
					</select>
			 </p>
			 
			 <p>
				<button type="submit">Crear TFG</button>
			</p>
			
		</form>
	</shiro:guest>
	
	

	<shiro:user>
    Welcome back <shiro:principal />! Click <a href="LogoutServlet">here</a> to logout.
</shiro:user>



</body>
</html>