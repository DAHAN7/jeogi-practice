package com.bitc.jeogi.reservation.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bitc.jeogi.reservation.dao.ReservationDAO; // ReservationDAO를 임포트
import com.bitc.jeogi.reservation.vo.ReservationVO; // ReservationVO를 임포트

@Service
public class ReservationServiceImpl implements ReservationService {
    private ReservationDAO reservationDAO;

    public ReservationServiceImpl(ReservationDAO reservationDAO) {
        this.reservationDAO = reservationDAO;
    }

    @Override
    public void createReservation(ReservationVO reservation) throws Exception {
        try {
            reservationDAO.insertReservation(reservation); // DAO 메서드를 통해 예약을 DB에 추가
        } catch (Exception e) {
            throw new Exception("예약 생성에 실패했습니다.", e);
        }
    }

    @Override
    public List<ReservationVO> getReservationsByUserId(int u_id) throws Exception {
        try {
            return reservationDAO.selectReservationsByUserId(u_id); // DAO 메서드를 통해 예약 목록을 가져옴
        } catch (Exception e) {
            throw new Exception("사용자 ID로 예약 목록을 가져오는 데 실패했습니다.", e);
        }
    }
}
