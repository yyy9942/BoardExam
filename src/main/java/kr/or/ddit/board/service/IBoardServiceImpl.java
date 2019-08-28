package kr.or.ddit.board.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.board.dao.IBoardDao;
import kr.or.ddit.vo.BoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IBoardServiceImpl implements IBoardService{
	@Autowired
	IBoardDao boardDao;
	
	
	@Override
	public List<BoardVO> boardList(Map<String, String> params)
			throws SQLException {
		return boardDao.boardList(params);
	}
	
	@Override
	public BoardVO boardView(Map<String, String> params) throws SQLException {
		return boardDao.boardView(params);
	}
	
	@Override
	public void insertBoard(BoardVO boardInfo) throws SQLException {
		boardDao.insertBoard(boardInfo);
	}
	
	
}
