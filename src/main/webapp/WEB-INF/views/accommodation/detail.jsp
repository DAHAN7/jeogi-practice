<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session" />
<html>
<head>
    <title>숙소 상세보기</title>
</head>
<body>
    <c:choose>
    <c:when test="${!empty acc}">
        <!-- 단일 객체 'acc'에 대해 반복이 아닌 바로 값에 접근 -->
        <a href="${path}/accommodation/detail?accommodation_no=${acc.accommodation_no}">
            <div class="com">
                <c:choose>
                    <c:when test="${not empty acc.mainimages}">
                        <img src="${path}/displayFile?fileName=${acc.mainimages}" alt="리뷰 이미지" class="card-img-top"
                             style="height: 200px; object-fit: cover;">
                    </c:when>
                    <c:otherwise>
                        <div class="com-img-area" style="width: 100%; height: 200px; overflow: hidden;">
                            <img src="${path}/resources/default-image.png" 
                                 alt="${acc.name} 이미지"
                                 style="width: 100px; height: 150px; object-fit: cover;">
                        </div>
                    </c:otherwise>
                </c:choose>
                	<p>${acc.type}</p>
                	<p>${acc.name}</p>
                	<p>${acc.address}</p>
                	<p>
                    	<fmt:formatNumber value="${acc.price}" pattern="#,###" /> 원
                	</p>
            </div>
        </a>
    </c:when>
    <c:otherwise>
        <p>Accommodation information is not available.</p>
    </c:otherwise>
</c:choose>
<a href="${path}/accommodation/write">숙소 추가하기</a>
<a href="${path}/accommodation/modify?accommodation_no=${acc.accommodation_no}">수정하기</a>
<a href="${paht}/review/list">리뷰작성</a>
</body>
</html>
