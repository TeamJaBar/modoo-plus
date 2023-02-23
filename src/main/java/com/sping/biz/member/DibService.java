package com.sping.biz.member;
import java.util.List;

public interface DibService {
	public boolean insert(DibVO dvo);

	public DibVO selectOne(DibVO dvo);

	public List<DibVO> selectAll(DibVO dvo);

	public boolean delete(DibVO dvo);

}
