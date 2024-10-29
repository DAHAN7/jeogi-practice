package com.bitc.jeogi.reservation.service;

import java.util.List;

import com.bitc.jeogi.reservation.vo.ReservationVO;

public interface ReservationService {
    void createReservation(ReservationVO reservation) throws Exception;
    List<ReservationVO> getReservationsByUserId(int u_id) throws Exception;
}
