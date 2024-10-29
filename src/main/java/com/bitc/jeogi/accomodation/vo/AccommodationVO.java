package com.bitc.jeogi.accomodation.vo;


import lombok.Data;

@Data
public class AccommodationVO {
	
    private int accommodation_no;  // 테이블의 'accommodation_id'에 해당 (숙소 고유 ID)
    private String name;            // 테이블의 'name'에 해당 (숙소 이름)
    private String address;         // 테이블의 'address'에 해당 (숙소 주소)
    private String description;     // 테이블의 'description'에 해당 (숙소 설명)
    private String type;            // 테이블의 'type'에 해당 (숙소 유형: 호텔, 모텔 등)
    private int price;          // 테이블의 'price'에 해당 (숙소 가격)
    private String mainimages;      // 테이블의 'mainimages'에 해당 (주 이미지 경로)
    private String images1;         // 테이블의 'images1'에 해당 (추가 이미지 경로 1)
    private String images2;         // 테이블의 'images2'에 해당 (추가 이미지 경로 2)
    private int review_count;       // 테이블의 'review_count'에 해당 (리뷰 개수)
    
}
