<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session" />
<style>
.review_list_paging {
      margin: 0 auto;
   }
   
   .review_list_paging ul {
      margin: 0 auto;
      width: 500px;
      display: flex;
      align-content: center;
   }
   
 .pagingBox{
   margin-left: auto;
   margin-right: auto;
   }
   
   .review_list_paging ul li {
      text-align: center;   
      margin-left: 10px;
   }
   
      .review_list_paging ul li:nth-child(1){
      margin-left: 0px;
      }
   
   .review_list_paging ul li a {
      display: inline-block;
      line-height: 40px;
      color: black;
      font-weight: bold;
      font-size: 15px;
      width: 40px;
   }
   
   .review_currentPage {
      background-color: #c7b199;
   }
   
   #review_currentPage_a {
      color: white;
   }
   
</style>
<!DOCTYPE html>
<html lang="en">
<head>
<title>저기 어때</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css">
</head>
<body>
		
	<%-- <header>
		<a href="/">
			<div class="logo-img-area" style="background-image: url('${pageContext.request.contextPath}/resources/logo.jpg')"></div>
		</a>
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
	</header> --%>
	
	<main>
		<div class="main-header">
			<div class="title">
				<p>국내부터 해외까지</p>
				<p>여행할때 저기어때</p>
			</div>
			<div class="section-box">
				<p>숙소 검색</p>
				<form class="section-content" id="search-form" action="/stay"
					method="GET">
					<input type="text" id="search-text-area" placeholder="검색어를 입력하세요"
						name="name">
					<button type="submit" id="search-submit">검색</button>
				</form>
			</div>
		</div>

		<div class="main-content">
			<div class="main-content-header">
				<p class="list-name">숙소 리스트</p>
				<a href="accommodation/write" class="list-name">숙소 등록</a>
			</div>

			<div class="reserve-list-area">
			<c:choose>
				<c:when test="${!empty list}">
					<c:forEach var="accommodation" items="${list}">
						<a href="${path}/accommodation/detail?accommodation_no=${accommodation.accommodation_no}">
							<div class="com">
								<c:choose>
									<c:when test="${not empty accommodation.mainimages}">
										<img src="${path}/displayFile?fileName=${accommodation.mainimages}" alt="리뷰 이미지" class="card-img-top"
											style="height: 200px; object-fit: cover;">
									</c:when>
									<c:otherwise>
										<div class="com-img-area"
										     style="width: 100%; height: 200px; overflow: hidden;">
										    <img src="${path}/resources/default-image.png" 
										         alt="${accommodation.name} 이미지"
										         style="width: 100%; height: 100%; object-fit: cover;">
										</div>
									</c:otherwise>
								</c:choose>
								<p>${accommodation.type}</p>
								<p>${accommodation.name}</p>
								<p>${accommodation.address}</p>
								<p>
									<fmt:formatNumber value="${accommodation.price}" pattern="#,###" />
									원
								</p>
							</div>
						</a>
					</c:forEach>
				</c:when>
				<c:otherwise>
						<tr>
							<td></td>
							<td></td>
							<td>아무 것도 없습니다.</td>
							<td></td>
							<td></td>
						</tr>
				</c:otherwise>
			</c:choose>
			</div>
			
			<div class="review_list_paging">
            <ul>
            <div class="pagingBox">
               <c:if test="${pm.first}">
                  <li><a href="${path}?page=1">&lt;&lt;</a></li>
               </c:if>
               <c:if test="${pm.prev}">
                  <li><a href="${path}?page=${pm.startPage-5}">&lt;</a></li>
               </c:if>
               <c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
                  <c:choose>
                     <c:when test="${pm.cri.page eq i}">
                        <li class="review_currentPage"><a id="review_currentPage_a">${i}</a></li>
                     </c:when>
                     <c:otherwise>
                        <li><a href="${path}?page=${i}">${i}</a></li>
                     </c:otherwise>
                  </c:choose>
   
               </c:forEach>
               <c:if test="${pm.next}">
                  <li><a href="${path}?page=${pm.endPage+1}">&gt;</a></li>
               </c:if>
               <c:if test="${pm.endPage !=0 }">
               <c:if test="${pm.last}">
                  <li><a href="${path}?page=${pm.maxPage}">&gt;&gt;</a></li>
               </c:if>
               </c:if>
               </div>
            </ul>
         </div>
			<%-- <div class="container">
				<ul class="pagination justify-content-center">
					<c:if test="${pm.prev}">
						<li class="page-item"><a class="page-link"
							href="?page=${pm.startPage-1}">&lt;</a></li>
					</c:if>
					<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
						<c:choose>
							<c:when test="${pm.cri.page eq i}">
								<li class="page-item ${pm.cri.page == i ? 'active' : ''}">
									<a class="page-link" href="?page=${i}">${i}</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="?page=${i}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pm.next}">
						<li class="page-item"><a class="page-link"
							href="?page=${pm.endPage+1}">&gt;</a></li>
					</c:if>
				</ul>
			</div> --%>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
