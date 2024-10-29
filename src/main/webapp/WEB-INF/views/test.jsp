<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <form id="joinForm" action="${path}/test" method="POST" enctype="multipart/form-data">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<input type="file" id="profileImage" name="profileImage" accept="image/*"/>
			<button>Submit</button>
</form>
</body>
</html>