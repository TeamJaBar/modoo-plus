package com.spring.biz.member;

import java.util.List;

public interface MemberService {
	
	public boolean insert(MemberVO mvo);

	public List<MemberVO> selectAll(MemberVO mvo);

	public List<MemberVO> selectAllMember(MemberVO mvo);

	public MemberVO selectOneLogin(MemberVO mvo);

	public MemberVO selectOneInfo(MemberVO mvo);

	public MemberVO selectOneId(MemberVO mvo);

	public MemberVO selectOneEmailCHK(MemberVO mvo);

	public MemberVO selectOneFindPw(MemberVO mvo);

	public boolean update(MemberVO mvo);

	public boolean delete(MemberVO mvo);

}
