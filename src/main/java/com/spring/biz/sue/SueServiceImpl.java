package com.spring.biz.sue;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("sueService")
public class SueServiceImpl implements SueService {

	@Autowired
	private SueDAO sueDAO;

	@Override
	public boolean insertSue(SueVO svo) {
		return sueDAO.insertSue(svo);
	}

	@Override
	public boolean updateSue(SueVO svo) {
		return sueDAO.updateSue(svo);
	}

	@Override
	public List<SueVO> selectAllCount(SueVO svo) {
		return sueDAO.selectCount(svo);
	}

	@Override
	public List<SueVO> selectAllSue(SueVO svo) {
		return sueDAO.selectAllSue(svo);
	}

	@Override
	public SueVO selectOneSue(SueVO svo) {
		return sueDAO.selectOneSue(svo);
	}
}
