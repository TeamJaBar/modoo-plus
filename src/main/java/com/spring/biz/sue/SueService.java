package com.spring.biz.sue;

import java.util.List;

public interface SueService {
	public boolean insertSue(SueVO svo);
	
	public boolean updateSue(SueVO svo);

	public List<SueVO> selectAllCount(SueVO svo);

	public List<SueVO> selectAllSue(SueVO svo);

	public SueVO selectOneSue(SueVO svo);
}
