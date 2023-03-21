package com.spring.biz.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("applicantService")
public class ApplicantServiceImpl implements ApplicantService {
	@Autowired
	ApplicantDAO applicantDAO;

	@Override
	public boolean insertApplicant(ApplicantVO vo) {
		return applicantDAO.insertApplicant(vo);
	}

	@Override
	public List<ApplicantVO> selectAllApplicant(ApplicantVO vo) {
		return applicantDAO.selectAllApplicant(vo);
	}

	@Override
	public boolean updateApplicant(ApplicantVO vo) {
		return applicantDAO.updateApplicant(vo);
	}

	@Override
	public boolean deleteApplicant(ApplicantVO vo) {
		return applicantDAO.deleteApplicant(vo);
	}

}
