package com.ryan.mapper;

import java.util.List;

import com.ryan.domain.BookGradeVO;
import com.ryan.domain.BookLikeVO;
import com.ryan.domain.EBookVO;
import com.ryan.domain.HashtagVO;
import com.ryan.domain.MemberVO;
import com.ryan.domain.ReviewVO;

public interface DetailBookMapper {	
	
	//책 상세보기 조회
	public EBookVO searchEBook(int booknumber);
	
	//상세보기 페이지 리뷰조회
	public ReviewVO searchReview(int booknumber);	
	
	//상세보기 페이지 관심책 불러오기
	public List<EBookVO> interestbooks(String category);
	
	//좋아요 조회
	public BookLikeVO bookLike(int booknumber); 
	
	//평점 조회
	public double bookGrade(int booknumber);
	
	//태그 조회
	public HashtagVO hashtag(int booknumber);
	
	//좋아요 한 사람들
	public MemberVO likepeople(String id);
	
	
	//해쉬태그 입력
	public int insertHashtag(HashtagVO vo);
	
	//평점 입력
	public int insertGrade(BookGradeVO vo);
	
}