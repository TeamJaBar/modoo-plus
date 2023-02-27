package com.spring.biz.board;

public class ApplicantDAO {
	//마이 페이지 내가 신청한 매칭
	private final String SQL_INSERT="INSERT INTO APPLICANT (BNUM, MNUM, ACHK) VALUES(?, ?, '0')";
	//평가하기 눌렀을 때 나오는 SELECTALL
	private final String SQL_SELECTALL_ACTION="SELECT A.MNUM, MNAME, MIMG ACHK FROM APPLICANT A LEFT JOIN `member` m ON A.MNUM =M.MNUM WHERE ACHK = 0 ORDER BY ANUM ASC";
	//MVP 평가할 SELECTONE
	private final String SQL_SELECTONE="SELECT A.MNUM, MNAME, MIMG ACHK FROM APPLICANT A LEFT JOIN `member` m ON A.MNUM = M.MNUM WHERE ACHK = 0 AND ANUM=?";
	//마이 페이지 내가 신청한 매칭 신청 취소 
	private final String SQL_DELETE="DELECT FROM BOARD WHERE ANUM=?";
	
}
