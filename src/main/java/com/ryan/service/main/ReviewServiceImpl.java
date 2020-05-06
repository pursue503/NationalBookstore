package com.ryan.service.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ryan.domain.ReviewVO;
import com.ryan.domain.member.MemberVO;
import com.ryan.mapper.ReviewMapper;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewMapper mapper;

	@Override
	public Boolean insertReview(ReviewVO review, MemberVO member) {
		
		return mapper.insertReview(review)==1?true : false;
	}

	@Override
	public Boolean delecteReview(String memberEmail,int bookNum) {
			return mapper.deleteReview(memberEmail,bookNum)==1?true:false;
	
	}

	@Override
	public Boolean updateReview(ReviewVO review, MemberVO member) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean duplicationChk(String memberEmail, int bookNum) {
		return mapper.duplication(memberEmail, bookNum)>0?true:false;
	}

}
