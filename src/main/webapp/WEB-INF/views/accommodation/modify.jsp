<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- modify.jsp -->
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
	.container{
		width:800px;
		margin:0 auto;
	}
</style>
<div class="container">
	<h1>숙소 수정</h1>
	<form action="${path}/accommodation/modify" method="POST">
		<%-- <input type="hidden" name="accommodation_no" value="${board.accommodation_no}"/> --%>
    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <label>숙소이름:</label>
        <input type="text" name="name" required><br>
        <label>위치:</label>
        <input type="text" name="address" required><br>
        <label>숙소 소개:</label>
        <textarea name="description" required></textarea><br>
        <label>타입:</label>
        <input type="text" name="type" required><br>
        <label>가격:</label>
        <input type="number" name="price" required><br>
        <label>썸네일:</label>
        <input type="text" name="mainimages"><br>
        <label>첫번째 그림:</label>
        <input type="text" name="images1" ><br>
        <label>두번째 그림:</label>
        <input type="text" name="images2"><br>
        <input type="submit" value="Add Accommodation">
	</form>
</div>
</body>
</html>