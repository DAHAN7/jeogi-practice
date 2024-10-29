<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>

<div class="container my-5">
    <h1 class="text-center mb-4">예약하기</h1>
    <form action="${pageContext.request.contextPath}/reservation/save" method="post">
        <div class="mb-3">
            <label for="u_id" class="form-label">사용자 ID</label>
            <input type="number" class="form-control" id="u_id" name="u_id" required>
        </div>
        <div class="mb-3">
            <label for="accommodation_id" class="form-label">숙소 ID</label>
            <input type="number" class="form-control" id="accommodation_id" name="accommodation_id" required>
        </div>
        <div class="mb-3">
            <label for="check_in_date" class="form-label">체크인 날짜</label>
            <input type="date" class="form-control" id="check_in_date" name="check_in_date" required>
        </div>
        <div class="mb-3">
            <label for="check_out_date" class="form-label">체크아웃 날짜</label>
            <input type="date" class="form-control" id="check_out_date" name="check_out_date" required>
        </div>
        <div class="mb-3">
            <label for="number_of_guests" class="form-label">예약 인원 수</label>
            <input type="number" class="form-control" id="number_of_guests" name="number_of_guests" required>
        </div>
        <div class="mb-3">
            <label for="total_price" class="form-label">총 결제 금액</label>
            <input type="number" class="form-control" id="total_price" name="total_price" required>
        </div>
        <button type="submit" class="btn btn-primary">예약 완료</button>
        <a href="${pageContext.request.contextPath}/reservation/list" class="btn btn-secondary">취소</a>
    </form>
</div>

<%@ include file="../common/footer.jsp"%>
