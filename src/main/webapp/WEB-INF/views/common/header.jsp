<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>저기 어때</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css">
</head>
<body>
		
	<header>
		<a href="/">
			<div class="logo-img-area" style="background-image: url('${pageContext.request.contextPath}/resources/logo.jpg')"></div>
		</a>
		<form method="POST" action="${pageContext.request.contextPath}/user/login">
		<!-- 인증된 사용자 -->
		<sec:authorize access="isAuthenticated()">
			<sec:authentication var="user" property="principal.user"/>
			<c:if test="${!empty user.u_profile}">
					<img class="profile"
						src="${path}/displayFile?fileName=${user.u_profile}" />
				</c:if>
				<c:if test="${empty user.u_profile}">
					<!-- 프로필 이미지 없음. -->
					<img class="profile" src="${path}/resources/img/profile.jpg" />
				</c:if>
				${user.u_name}님 
				<a href="${path}/user/logout">
				<button>로그아웃</button>
			</a>
		</sec:authorize>
		<!-- 인증되지 않은 익명 사용자 -->
		<sec:authorize access="isAnonymous()">
			<div class="right-header">
					<c:if test="${!empty user.u_profile}">
					<img class="profile"
						src="${path}/displayFile?fileName=${user.u_profile}" />
					</c:if>
					<c:if test="${empty user.u_profile}">
						<!-- 프로필 이미지 없음. -->
						<img class="profile" src="${path}/resources/img/profile.jpg" />
					</c:if>
					${user.u_name}님 
					<a href="${path}/user/logout">
					<button>로그아웃</button>
					</a>
					<a href="${path}/user/login">
						<button>로그인</button> 
					</a>
					<a href="${path}/user/join">
						<button>회원가입</button>
					</a>
				<div class="ham-img-area"></div>
			</div>
		</sec:authorize>
		</form>
	</header>