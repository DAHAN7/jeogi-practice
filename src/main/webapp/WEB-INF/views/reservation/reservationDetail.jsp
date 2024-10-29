<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>

<div class="container my-5">
    <h1 class="text-center mb-4">예약 상세 정보</h1>

    <c:if test="${not empty reservation}">
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">예약 ID: ${reservation.reservation_id}</h5>
                <h6 class="card-subtitle mb-2 text-muted">사용자 ID: ${reservation.u_id}</h6>
                <p class="card-text">숙소 ID: ${reservation.accommodation_id}</p>
                <p class="card-text">체크인 날짜: ${reservation.check_in_date}</p>
                <p class="card-text">체크아웃 날짜: ${reservation.check_out_date}</p>
                <p class="card-text">예약 인원 수: ${reservation.number_of_guests}</p>
                <p class="card-text">총 결제 금액: <span class="text-primary">${reservation.total_price}</span> 원</p>
                <p class="card-text">상태: ${reservation.status}</p>
                <a href="${pageContext.request.contextPath}/reservation/list" class="btn btn-secondary">목록으로 돌아가기</a>
            </div>
        </div>
    </c:if>

    <c:if test="${empty reservation}">
        <p class="text-center">예약 정보를 찾을 수 없습니다.</p>
        <a href="${pageContext.request.contextPath}/reservation/list" class="btn btn-secondary">목록으로 돌아가기</a>
    </c:if>
</div>

<%@ include file="../common/footer.jsp"%>
