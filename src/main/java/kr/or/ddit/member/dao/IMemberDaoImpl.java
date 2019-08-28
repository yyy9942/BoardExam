package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IMemberDaoImpl implements IMemberDao {
	@Autowired
	SqlMapClient smc;
	
	@Override
	public MemberVO memberInfo(Map<String, String> params) throws SQLException {
		return (MemberVO) smc.queryForObject("member.memberInfo", params);
	}
	
	@Override
	public void insertMember(MemberVO memberInfo) throws SQLException {
		smc.insert("member.insertMember", memberInfo);
	}
}
