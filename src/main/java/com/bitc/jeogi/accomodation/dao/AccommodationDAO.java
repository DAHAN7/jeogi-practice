package com.bitc.jeogi.accomodation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;

import com.bitc.jeogi.accomodation.provider.AccommodationQueryProvider;
import com.bitc.jeogi.accomodation.vo.AccommodationVO;
import com.bitc.jeogi.common.util.SearchCriteria;

public interface AccommodationDAO {
    
    // 모든 숙소 정보 조회\
	@SelectProvider(type = AccommodationQueryProvider.class, method="searchSelectSql")
    List<AccommodationVO> list(SearchCriteria cri) throws Exception;

    // 새로운 숙소 정보 추가
    @Insert("INSERT INTO accommodation (name, address, description, type, price, mainimages, images1, images2) "
            + "VALUES (#{name}, #{address}, #{description}, #{type}, #{price}, #{mainimages}, #{images1}, #{images2})")
    int write(AccommodationVO vo) throws Exception;
    
    @SelectProvider(type = AccommodationQueryProvider.class, method="searchSelectCount")
    int totalCount(SearchCriteria cri) throws Exception;
    
    // 숙소 리뷰 카운터 증가
    @Update("UPDATE accommodation SET review_count = review_count + 1 WHERE accommodation_no = #{accommodation_no}")
    void updateReviewCnt(int accommodation_no) throws Exception;
    
    @Select("SELECT * FROM accommodation WHERE accommodation_no = #{accommodation_no}")
    AccommodationVO read(int accommodation_no) throws Exception;
    
    // 숙소 정보 수정
    @Update("UPDATE accommodation SET "
            + "name = #{name}, "
            + "address = #{address}, "
            + "description = #{description}, "
            + "price = #{price}, "
            + "mainimages = #{mainimages}, "
            + "images1 = #{images1}, "
            + "images2 = #{images2}"
            + "WHERE accommodation_no = #{accommodation_no}")
    int modify(AccommodationVO accommodation) throws Exception;
    
    // 숙소 삭제
    @Delete("DELETE FROM accommodation WHERE accommodation_no = #{accommodation_no}")
    int remove(int accommodation_no) throws Exception;

}
