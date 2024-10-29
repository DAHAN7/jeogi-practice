package com.bitc.jeogi.accomodation.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bitc.jeogi.accomodation.dao.AccommodationDAO;
import com.bitc.jeogi.accomodation.vo.AccommodationVO;
import com.bitc.jeogi.common.util.PageMaker;
import com.bitc.jeogi.common.util.SearchCriteria;
import com.bitc.jeogi.common.util.SearchPageMaker;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AccommodationService {

	private final AccommodationDAO dao;
	
	// 개시글 작성
	public String write(AccommodationVO vo) throws Exception{
		int result = dao.write(vo);
		return result == 1 ? "숙소 등록 성공" : "숙소 등록 실패";
	}
	
	// 게시물 리스트, 페이징 정보 Map 저장
	public Map<String, Object> list(SearchCriteria cri) throws Exception{
		List<AccommodationVO> list = dao.list(cri);
		int totalCount = dao.totalCount(cri);
		PageMaker pm = new SearchPageMaker();
		pm.setCri(cri);
		pm.setTotalCount(totalCount);
		
		System.out.println(pm);
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("pm", pm);
		return map;
	}
	
	// 리뷰 개수 증가
	public void updateReviewCnt(int accommodation_no) throws Exception{
		dao.updateReviewCnt(accommodation_no);
	}
	
	// 숙소 번호로 숙소 정보 검색
	public AccommodationVO read(int accommodation_no) throws Exception{
		return dao.read(accommodation_no);
	}
	
	// 숙소 정보 수정
	public String modify(AccommodationVO acc) throws Exception{
		int result = dao.modify(acc);
		return result == 1 ? "숙소 정보 수정완료" : "숙소 정보 수정실패";
	}
	
	// 숙소 삭제 요청 처리
	public String remove(int accommodation_no) throws Exception{
		int result = dao.remove(accommodation_no);
		return result == 1 ? "숙소 삭제 완료" : "숙소 삭제 실패";
	}
}





