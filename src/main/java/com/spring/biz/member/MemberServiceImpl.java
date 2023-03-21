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
		return memberDAO.insert(vo);
	}

	@Override
	public List<MemberVO> selectAll(MemberVO vo) {
		return memberDAO.selectAll(vo);
	}

	@Override
	public List<MemberVO> selectAllMember(MemberVO vo) {
		return memberDAO.selectAllMember(vo);
	}

	@Override
	public MemberVO selectOneMember(MemberVO vo) {
		return memberDAO.selectOneMember(vo);
	}

	@Override
	public MemberVO selectOneLogin(MemberVO vo) {
		return memberDAO.selectOneLogin(vo);
	}

	@Override
	public MemberVO selectOneEmail(MemberVO vo) {
		return memberDAO.selectOneEmail(vo);
	}

	@Override
	public boolean update(MemberVO vo) {
		return memberDAO.update(vo);
	}

	@Override
	public boolean delete(MemberVO vo) {
		return memberDAO.delete(vo);
	}
}
