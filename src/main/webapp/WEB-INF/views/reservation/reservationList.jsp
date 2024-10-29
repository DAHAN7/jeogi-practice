<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../common/header.jsp"%>

<style>
.card {
	transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card:hover {
	transform: scale(1.05);
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.card-body {
	padding: 20px;
}

.card-title {
	font-size: 1.25rem;
	color: #333;
}

.card-text {
	font-size: 0.875rem;
	color: #555;
}

.container {
	max-width: 1200px;
}

.text-center {
	text-align: center;
}

.my-5 {
	margin-top: 3rem;
	margin-bottom: 3rem;
}

.page-item {
	display: inline-block;
}
</style>

<div class="container my-5">
	<h1 class="text-center mb-4">예약 목록</h1>

	<c:if test="${empty reservations}">
		<p class="text-center">예약이 없습니다.</p>
	</c:if>

	<c:if test="${not empty reservations}">
		<div class="row">
			<c:forEach var="reservation" items="${reservations}">
				<div class="col-md-4 mb-4">
					<div class="card shadow-sm rounded">
						<div class="card-body">
							<h5 class="card-title">예약 ID: ${reservation.reservation_id}</h5>
							<h6 class="card-subtitle mb-2 text-muted">사용자 ID: ${reservation.u_id}</h6>
							<p class="card-text">숙소 ID: ${reservation.accommodation_id}</p>
							<p class="card-text">체크인 날짜: ${reservation.check_in_date}</p>
							<p class="card-text">체크아웃 날짜: ${reservation.check_out_date}</p>
							<p class="card-text">예약 인원 수: ${reservation.number_of_guests}</p>
							<p class="card-text">총 결제 금액: <span class="text-primary">${reservation.total_price}</span> 원</p>
							<p class="card-text">상태: ${reservation.status}</p>
							<div class="d-flex justify-content-end">
								<a href="#" class="btn btn-primary"
									onclick="detail(${reservation.reservation_id})">자세히 보기</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</c:if>

	<div class="container">
		<ul class="pagination justify-content-center">
			<c:if test="${pm.prev}">
				<li class="page-item"><a class="page-link"
					href="?page=${pm.startPage-1}">&lt;</a></li>
			</c:if>
			<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
				<li class="page-item ${pm.cri.page == i ? 'active' : ''}">
					<a class="page-link" href="?page=${i}">${i}</a>
				</li>
			</c:forEach>
			<c:if test="${pm.next}">
				<li class="page-item"><a class="page-link"
					href="?page=${pm.endPage+1}">&gt;</a></li>
			</c:if>
		</ul>
	</div>

	<div class="text-center my-4">
		<a href="${pageContext.request.contextPath}/reservation/write"
			class="btn btn-primary">예약하기</a>
	</div>
</div>

<script>
	function detail(reservation_id) {
		window.location.href = '${pageContext.request.contextPath}/reservation/detail?reservation_id=' + reservation_id;
	}
</script>

<%@ include file="../common/footer.jsp"%>
