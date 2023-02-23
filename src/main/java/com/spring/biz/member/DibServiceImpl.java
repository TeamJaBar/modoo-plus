package com.spring.biz.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("dibService")
public class DibServiceImpl implements DibService {
	
	@Autowired
	private DibDAO dibDAO;

	@Override
	public boolean insert(DibVO dvo) {
		return dibDAO.insert(dvo);
	}

	@Override
	public DibVO selectOne(DibVO dvo) {
		return dibDAO.selectOne(dvo);
	}

	@Override
	public List<DibVO> selectAll(DibVO dvo) {
		return dibDAO.selectAll(dvo);
	}

	@Override
	public boolean delete(DibVO dvo) {
		return dibDAO.delete(dvo);
	}
}
