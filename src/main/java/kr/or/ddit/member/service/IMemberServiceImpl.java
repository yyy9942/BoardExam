package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IMemberServiceImpl implements IMemberService{
	@Autowired IMemberDao memberDao;
	
	@Override
	public MemberVO memberInfo(Map<String, String> params) throws SQLException {
		return memberDao.memberInfo(params);
	}
	@Override
	public void insertMember(MemberVO memberInfo) throws SQLException {
		memberDao.insertMember(memberInfo);
	}
}
