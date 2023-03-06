package com.spring.biz.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("applicantService")
public class ApplicantServiceImpl implements ApplicantService{
	@Autowired
	ApplicantDAO applicantDAO;

	@Override
	public boolean insert(ApplicantVO vo) {
		return applicantDAO.insert(vo);
	}

	@Override
	public List<ApplicantVO> selectAll(ApplicantVO vo) {
		return applicantDAO.selectAll(vo);
	}

	@Override
	public boolean update(ApplicantVO vo) {
		return applicantDAO.update(vo);
	}

	@Override
	public boolean delete(ApplicantVO vo) {
		return applicantDAO.delete(vo);
	}

}
