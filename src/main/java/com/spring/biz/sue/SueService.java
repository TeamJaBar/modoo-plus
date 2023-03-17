package com.spring.biz.sue;

import java.util.List;

public interface SueService {
	public boolean insertSue(SueVO svo);

	public boolean updateSue(SueVO svo);

	public List<SueVO> selectAllSue(SueVO svo);

	public List<SueCategoryVO> selectAllSueCa(SueCategoryVO scvo);

	public SueVO selectOneSue(SueVO svo);

	public SueVO selectCount(SueVO svo);
	
	public SueVO selectEmail(SueVO svo);
}
