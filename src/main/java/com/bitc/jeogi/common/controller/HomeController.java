package com.bitc.jeogi.common.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.bitc.jeogi.accomodation.service.AccommodationService;
import com.bitc.jeogi.common.util.SearchCriteria;

@Controller
public class HomeController {
	
	// AccommodationService 주입
	private final AccommodationService accommod;

	// 생성자 주입
	public HomeController(AccommodationService accommod) {
	    this.accommod = accommod;
	}
	
	@GetMapping("/")
	public String home(SearchCriteria cri, Model model) throws Exception {
	    // AccommodationService를 통해 데이터를 조회
	    Map<String, Object> map = accommod.list(cri); // list 메서드는 SearchCriteria 기반의 검색 결과를 반환
	    
	    // Model에 조회된 데이터를 추가
	    model.addAllAttributes(map); // Map에 담긴 모든 데이터를 JSP로 전달

	    return "home"; // home.jsp로 이동
	}
	
	@GetMapping("test")
	public String test() {
		return "test";
	}
	
	@PostMapping("test")
	public String test(MultipartFile profileImage) {
		System.out.println(profileImage);
		return "test";
	}
	
}
