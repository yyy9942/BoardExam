package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BoardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;

import com.ibatis.sqlmap.client.SqlMapClient;

@Controller
public class IBoardDaoImpl implements IBoardDao {
	@Autowired
	SqlMapClient smc;
	
	@Override
	@Transactional
	public List<BoardVO> boardList(Map<String, String> params)
			throws SQLException {
		return smc.queryForList("board.boardList", params);
	}
	
	@Override
	@Transactional
	public BoardVO boardView(Map<String, String> params) throws SQLException {
		smc.update("board.plusHit", params.get("bo_id"));
		return (BoardVO) smc.queryForObject("board.boardView",params);
	}
	
	@Override
	@Transactional
	public void insertBoard(BoardVO boardInfo) throws SQLException {
		smc.insert("board.insertBoard", boardInfo);
	}
	
}
