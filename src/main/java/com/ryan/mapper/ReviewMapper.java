package com.ryan.mapper;

import com.ryan.domain.ReviewVO;

public interface ReviewMapper {
	public int insertReview(ReviewVO review);
	
	public int deleteReview(int reviewNum);
	
	public int updateReview();

}
