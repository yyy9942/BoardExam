package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.vo.MemberVO;

public interface IMemberDao {

	public MemberVO memberInfo(Map<String, String> params) throws SQLException;
	public void insertMember(MemberVO memberInfo) throws SQLException;
}
