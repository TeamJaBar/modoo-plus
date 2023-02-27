package com.spring.biz.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public boolean insert(MemberVO vo) {
		return memberDAO.insertMember(vo);
	}

	@Override
	public List<MemberVO> selectAll(MemberVO vo) {
		return memberDAO.selectAllMember(vo);
	}

	@Override
	public List<MemberVO> selectAllMember(MemberVO vo) {
		return memberDAO.selectAllMember(vo);
	}

	@Override
	public MemberVO selectOneLogin(MemberVO vo) {
		return memberDAO.selectOneLogin(vo);
	}

	@Override
	public MemberVO selectOneInfo(MemberVO vo) {
		return memberDAO.selectOneInfo(vo);
	}

	@Override
	public MemberVO selectOneId(MemberVO vo) {
		return memberDAO.selectOneId(vo);
	}

	@Override
	public MemberVO selectOneEmailCHK(MemberVO vo) {
		return memberDAO.selectOneEmailCHK(vo);
	}

	@Override
	public MemberVO selectOneFindPw(MemberVO vo) {
		return memberDAO.selectOneFindPw(vo);
	}

	@Override
	public boolean update(MemberVO vo) {
		return memberDAO.updateUser(vo);
	}

	@Override
	public boolean delete(MemberVO vo) {
		return memberDAO.deleteUser(vo);
	}
}
