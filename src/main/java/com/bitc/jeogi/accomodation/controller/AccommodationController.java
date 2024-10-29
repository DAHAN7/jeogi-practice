package com.bitc.jeogi.accomodation.controller;


import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.jeogi.accomodation.service.AccommodationService;
import com.bitc.jeogi.accomodation.vo.AccommodationVO;
import com.bitc.jeogi.common.util.SearchCriteria;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/accommodation/*")
@RequiredArgsConstructor
public class AccommodationController {

    private final AccommodationService accommod;

    @GetMapping("list")
    public String list(SearchCriteria cri, Model model) throws Exception {
		Map<String, Object> map = accommod.list(cri);
		model.addAllAttributes(map);
		return "accommodation/list";
	}
    
    @GetMapping("write")
    public String write() throws Exception{
    	return "accommodation/write";
    }
    
    @PostMapping("write")
    public String wirte(
    			AccommodationVO vo,
    			RedirectAttributes rttr
    		)throws Exception{
    	
    	String msg = accommod.write(vo);
    	rttr.addFlashAttribute("msg", msg);
    	return "redirect:/";
    }
    
    // 상세보기
    @GetMapping("detail")
    public String detail(int accommodation_no, Model model) throws Exception{
    	AccommodationVO acc = accommod.read(accommodation_no);
    	model.addAttribute("acc", acc);
    	return "accommodation/detail";
    }
    
    @GetMapping("modify")
	public String modify(int accommodation_no, Model model) throws Exception{
		model.addAttribute("board", accommod.read(accommodation_no));
		return "accommodation/modify";
	}
	
	@PostMapping("modify")
	public String modify(
				AccommodationVO accommodation, // 수정할 게시글 정보
				RedirectAttributes rttr
			) throws Exception{
		String msg = accommod.modify(accommodation);
		rttr.addFlashAttribute("msg", msg);
		rttr.addAttribute("accommodation", accommodation.getAccommodation_no());
		return "redirect:/";
	}
	
	@PostMapping("remove")
	public String remove(int accommodation_no, RedirectAttributes rttr) throws Exception{
		String msg = accommod.remove(accommodation_no);
		rttr.addFlashAttribute("msg", msg);
		return "redirect:/accommodation/list";
	}
    
}
































