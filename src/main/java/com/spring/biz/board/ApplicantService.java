package com.spring.biz.board;

import java.util.List;

public interface ApplicantService {
	public boolean insertApplicant(ApplicantVO vo);

	public List<ApplicantVO> selectAllApplicant(ApplicantVO vo);

	public boolean updateApplicant(ApplicantVO vo);

	public boolean deleteApplicant(ApplicantVO vo);
}
