package com.spring.biz.member;

import java.util.List;

public interface MemberService {

	public boolean insert(MemberVO mvo);

	public List<MemberVO> selectAll(MemberVO mvo);

	public List<MemberVO> selectAllMember(MemberVO mvo);

	public MemberVO selectOneMember(MemberVO mvo);

	public MemberVO selectOneLogin(MemberVO mvo);

	public MemberVO selectOneEmail(MemberVO mvo);

	public boolean update(MemberVO mvo);

	public boolean delete(MemberVO mvo);

}
