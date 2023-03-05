package com.spring.biz.board;

import java.util.List;

public interface ApplicantService {
	public boolean insert(ApplicantVO vo);
	public List<ApplicantVO> selectAll(ApplicantVO vo);
	public ApplicantVO selectOne(ApplicantVO vo);
	public boolean delete(ApplicantVO vo);
}
