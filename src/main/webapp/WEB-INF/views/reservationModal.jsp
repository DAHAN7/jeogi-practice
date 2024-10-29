<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>숙소 예약하기 모달창</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <style>
        /* 모달의 기본 스타일 */
        * {
            padding: 0;
            margin: 0;
        }
        body {
            height: 100vh;
        }
        .modal {
            display: none; /* 기본적으로 보이지 않음 */
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        /* 모달 콘텐츠 */
        .modal-content {
            background-color: #fff;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 400px;
            border-radius: 10px;
            text-align: center;
        }

        /* 닫기 버튼 */
        .close-btn {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .close-btn:hover,
        .close-btn:focus {
            color: #000;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <!-- 등록하기 버튼 -->
    <button id="openModalBtn">숙소 예약하기</button>

    <!-- 모달 창 -->
    <div id="modal" class="modal">
        <div class="modal-content">
            <span class="close-btn">&times;</span>
            <h2>숙소 예약하기</h2>
            <form id="registerForm" enctype="multipart/form-data" action="${pageContext.request.contextPath}/숙소등록" method="POST">


                <label for="reservationStart">예약 시작일:</label>
                <input type="date" id="reservationStart" name="reservationStart" required><br><br>

                <label for="reservationEnd">예약 종료일:</label>
                <input type="date" id="reservationEnd" name="reservationEnd" required><br><br>

                <label for="guestCount">예약 인원 수:</label>
                <input type="number" id="guestCount" name="guestCount" min="1" required><br><br>


                <button type="submit">등록</button>
            </form>
        </div>
    </div>

    <script>
        // 모달 관련 요소 가져오기
        const modal = document.getElementById("modal");
        const openModalBtn = document.getElementById("openModalBtn");
        const closeModalBtn = document.querySelector(".close-btn");

        // 모달 열기
        openModalBtn.onclick = function() {
            modal.style.display = "block";
        };

        // 모달 닫기
        closeModalBtn.onclick = function() {
            modal.style.display = "none";
        };

        // 모달 외부 클릭 시 닫기
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        };
    </script>
</body>
</html>
