package com.spring.biz.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardDAO boardDAO;

	@Override
	public boolean insertBoard(BoardVO bvo) {
		return boardDAO.insertBoard(bvo);
	}

	@Override
	public boolean updateBoard(BoardVO bvo) {
		return boardDAO.updateBoard(bvo);
	}

	@Override
	public boolean deleteBoard(BoardVO bvo) {
		return boardDAO.deleteBoard(bvo);
	}

	@Override
	public List<BoardVO> selectAllMain(BoardVO bvo) {
		return boardDAO.selectAllMain(bvo);
	}

	@Override
	public List<BoardVO> selectAllManage(BoardVO bvo) {
		return boardDAO.selectAllManage(bvo);
	}
	
	@Override
	public List<BoardVO> selectAllLocal(BoardVO bvo) {
		return boardDAO.selectAllLocal(bvo);
	}

	@Override
	public BoardVO selectOne(BoardVO bvo) {
		return boardDAO.selectOne(bvo);
	}
	
	@Override
	public String getbLocal(String addr) {
		String bLocal = "";
		String[] arList = addr.split("\\s");
		
		for (int i = 0; i < arList.length; i++) {
			System.out.println("arList" + i + " : " + arList[i]);
		}
		boolean isRequired = true;

		for (int i = 0; i < arList.length; i++) {
			if (i > 0 && arList[i].contains("구")) {
				for (int j = 0; j < i + 1; j++) {
					System.out.println("arList" + j + " : " + arList[j]);
					bLocal += arList[j] + " ";
				}
				isRequired = false;
				break;
			}
		}

		if (isRequired) {
			for (int i = 0; i < arList.length; i++) {
				if (i > 0 && arList[i].contains("읍")) {
					for (int j = 0; j < i + 1; j++) {
						bLocal += arList[j] + " ";
					}
					isRequired = false;
					break;
				}
			}
		}

		bLocal = bLocal.substring(0, bLocal.length() - 1);
		return bLocal;
	}
}
