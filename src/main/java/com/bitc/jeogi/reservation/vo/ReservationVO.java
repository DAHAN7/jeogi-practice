package com.bitc.jeogi.reservation.vo;

import lombok.Data;

@Data
public class ReservationVO {
	
    private int reservation_id;           // 예약 고유 ID
    private int u_id;                     // 예약한 사용자 ID
    private int accommodation_id;         // 예약된 숙소 ID
    private String  check_in_date;        // 체크인 날짜
    private String check_out_date;        // 체크아웃 날짜
    private int number_of_guests;         // 예약 인원 수
    private int  total_price ;            // 총 결제 금액
    private String status;                // 예약 상태 (예약 완료, 취소 등)
}