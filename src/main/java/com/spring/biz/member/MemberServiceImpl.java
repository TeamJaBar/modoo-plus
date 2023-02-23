package com.spring.biz.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public boolean insert(MemberVO mvo) {
		return memberDAO.insert(mvo);
	}

	@Override
	public List<MemberVO> selectAll(MemberVO mvo) {
		return memberDAO.selectAll(mvo);
	}

	@Override
	public List<MemberVO> selectAllMember(MemberVO mvo) {
		return memberDAO.selectAllMember(mvo);
	}

	@Override
	public MemberVO selectOneLogin(MemberVO mvo) {
		return memberDAO.selectOneLogin(mvo);
	}

	@Override
	public MemberVO selectOneInfo(MemberVO mvo) {
		return memberDAO.selectOneInfo(mvo);
	}

	@Override
	public MemberVO selectOneId(MemberVO mvo) {
		return memberDAO.selectOneId(mvo);
	}

	@Override
	public MemberVO selectOneEmailCHK(MemberVO mvo) {
		return memberDAO.selectOneEmailCHK(mvo);
	}

	@Override
	public MemberVO selectOneFindPw(MemberVO mvo) {
		return memberDAO.selectOneFindPw(mvo);
	}

	@Override
	public boolean update(MemberVO mvo) {
		return memberDAO.update(mvo);
	}

	@Override
	public boolean delete(MemberVO mvo) {
		return memberDAO.delete(mvo);
	}
}
