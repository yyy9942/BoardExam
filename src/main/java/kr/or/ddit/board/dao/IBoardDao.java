package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BoardVO;

public interface IBoardDao {
	public List<BoardVO> boardList(Map<String, String> params) throws SQLException;
	public BoardVO boardView(Map<String, String> params) throws SQLException;
	public void insertBoard(BoardVO boardInfo) throws SQLException;
}
