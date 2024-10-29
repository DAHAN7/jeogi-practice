package com.bitc.jeogi.reservation.dao;

import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.jeogi.common.util.Criteria;
import com.bitc.jeogi.reservation.vo.ReservationVO;

public interface ReservationDAO {

    // 예약 추가
    @Insert("INSERT INTO reservation (u_id, accommodation_id, check_in_date, check_out_date, number_of_guests, total_price, status) "
            + "VALUES (#{u_id}, #{accommodation_id}, #{check_in_date}, #{check_out_date}, #{number_of_guests}, #{total_price}, #{status})")
    void insert(ReservationVO reservation);

    // 예약 조회
    @Select("SELECT * FROM reservation WHERE reservation_id = #{reservation_id}")
    ReservationVO selectById(int reservation_id);

    // 예약 업데이트
    @Update("UPDATE reservation SET accommodation_id = #{accommodation_id}, check_in_date = #{check_in_date}, "
            + "check_out_date = #{check_out_date}, number_of_guests = #{number_of_guests}, total_price = #{total_price}, "
            + "status = #{status} WHERE reservation_id = #{reservation_id}")
    void update(ReservationVO reservation);

    // 예약 삭제
    @Delete("DELETE FROM reservation WHERE reservation_id = #{reservation_id}")
    void delete(int reservation_id);

    // 특정 사용자 ID에 대한 예약 목록 조회
    @Select("SELECT * FROM reservation WHERE u_id = #{u_id} ORDER BY check_in_date DESC LIMIT #{cri.startRow}, #{cri.perPageNum}")
    List<ReservationVO> selectListByUserId(int u_id, Criteria cri);

    // 총 예약 수 조회
    @Select("SELECT COUNT(*) FROM reservation WHERE u_id = #{u_id}")
    int countByUserId(int u_id);

    // 모든 예약 조회
    @Select("SELECT * FROM reservation")
    List<ReservationVO> getAllList();

    // 특정 예약에 대한 세부정보 조회
    @Select("SELECT * FROM reservation WHERE reservation_id = #{reservation_id}")
    ReservationVO getById(int reservation_id);

    // 전체 예약 수 조회
    @Select("SELECT COUNT(*) FROM reservation")
    int getTotalCount();

    // 페이징된 예약 목록 조회
    @Select("SELECT * FROM reservation ORDER BY reservation_id DESC LIMIT #{startRow}, #{perPageNum}")
    List<ReservationVO> getPageReservation(Criteria cri);

 // 특정 사용자 ID에 대한 예약 목록 조회
    @Select("SELECT * FROM reservation WHERE u_id = #{u_id} ORDER BY check_in_date DESC")
    List<ReservationVO> selectReservationsByUserId(int u_id);

    // 예약 추가 메서드
    @Insert("INSERT INTO reservation (u_id, accommodation_id, check_in_date, check_out_date, number_of_guests, total_price, status) "
            + "VALUES (#{u_id}, #{accommodation_id}, #{check_in_date}, #{check_out_date}, #{number_of_guests}, #{total_price}, #{status})")
    void insertReservation(ReservationVO reservation);
}