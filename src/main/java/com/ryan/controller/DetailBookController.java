package com.ryan.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ryan.domain.BookGradeVO;
import com.ryan.domain.BookLikeVO;
import com.ryan.domain.EBookVO;
import com.ryan.domain.HashtagVO;
import com.ryan.service.DetailBookService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/book/*")
@Log4j
public class DetailBookController {
	
	@Autowired
	private DetailBookService service;
	
	//상세보기 페이지 
	@RequestMapping("/search")
	public String searchEBook(@RequestParam("booknumber") int booknumber, Model model) {
		
		EBookVO vo = service.searchEBook(booknumber);
				
		model.addAttribute("bookdetail", vo);
		
		model.addAttribute("bookreview", service.searchReview(booknumber));		
		
		model.addAttribute("booklist", service.interestbooks(vo.getCategory()));
		
		BookLikeVO likevo = service.bookLike(booknumber);		
		model.addAttribute("booklike", likevo);
		
		model.addAttribute("bookgrade", service.bookGrade(booknumber));
		
		model.addAttribute("hashtag", service.hashtag(booknumber));
		
		//좋아요 한 사람들 랜덤 조회
		model.addAttribute("likepeople", service.likepeople(likevo.getMemberId()));
		
		return "view";				
	}
	
	@RequestMapping("/inserthashtag")
	public String insertHashtag(HashtagVO vo, HttpServletRequest request, HttpServletResponse response) {		
		service.hashtagCookie(vo, request, response);

		return "view";
	}
	
	//평점 입력
	@RequestMapping("/insertgrade")
	public String insertGrade(BookGradeVO vo) {
		int num = service.insertGrade(vo);
		if(num==1) {
			return "view";
		}else {
			log.info("입력실패");
			return "view";
		}

	}
	
	//좋아요 입력
	@RequestMapping("/insertlike")
	public @ResponseBody String insertLike(BookLikeVO vo) {
		service.insertLike(vo);	
		
		return "view";
	}
	
	//좋아요 취소
	@RequestMapping("/deletelike")
	public @ResponseBody String deleteLike(BookLikeVO vo) {
		service.deleteLike(vo);
		return "view";
	}
}
