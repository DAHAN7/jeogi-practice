<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="container my-5">
    <h1 class="text-center mb-4">숙소 목록</h1>
    <a href="${pageContext.request.contextPath}/accommodation/write" class="btn btn-primary mb-4">숙소 추가하기</a>
    
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>이름</th>
                <th>주소</th>
                <th>설명</th>
                <th>숙소 유형</th>
                <th>숙소 가격</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${accommodations}" var="accommodation">
                <tr>
                    <td>${accommodation.name}</td>
                    <td>${accommodation.address}</td>
                    <td>${accommodation.description}</td>
                    <td>${accommodation.type}</td>
                    <td>${accommodation.price}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/accommodation/detail?accommodation_id=${accommodation.accommodation_id}" class="btn btn-info">숙소 상세 보기</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div class="pagination justify-content-center">
        <c:if test="${pm.prev}">
            <li class="page-item"><a class="page-link" href="?page=${pm.startPage - 1}">&lt;</a></li>
        </c:if>
        
        <c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
            <c:choose>
                <c:when test="${pm.cri.page eq i}">
                    <li class="page-item active">
                        <a class="page-link" href="?page=${i}">${i}</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="?page=${i}">${i}</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        
        <c:if test="${pm.next}">
            <li class="page-item"><a class="page-link" href="?page=${pm.endPage + 1}">&gt;</a></li>
        </c:if>
    </div>
</div>

<%@ include file="../common/footer.jsp"%>
