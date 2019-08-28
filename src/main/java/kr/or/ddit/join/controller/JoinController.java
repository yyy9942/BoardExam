package kr.or.ddit.join.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.utils.CryptoGenerator;
import kr.or.ddit.vo.MemberVO;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/join/")
public class JoinController {
	@Autowired
	IMemberService memberService;
	
	@RequestMapping("loginForm")
	public Model loginForm(Model model, HttpSession session){
		Map<String, String> publicKeyMap = CryptoGenerator.getGeneratePairKey(session);
		model.addAttribute("publicKeyMap", publicKeyMap);
		
		return model;
	}
	@RequestMapping("registForm")
	public void registForm(){}
	
	@ResponseBody
	@RequestMapping("loginCheck")
	public String loginCheck(String mem_id,
			String mem_pass,
			Map<String, String> params,
			HttpSession session) throws SQLException, JsonGenerationException, JsonMappingException, IOException{
		
		
		mem_id = CryptoGenerator.decryptRSA(session, mem_id);
		mem_pass = CryptoGenerator.decryptRSA(session, mem_pass);
		
		params.put("mem_id", mem_id);
		params.put("mem_pass", mem_pass);
		MemberVO memberInfo = memberService.memberInfo(params);
		Map<String, String> result = new HashMap<String, String>();
		
		if(memberInfo == null){
			result.put("flag", "false");
		}else{
			result.put("flag", "true");
			session.setAttribute("LOGIN_MEMBERINFO", memberInfo);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonResult = mapper.writeValueAsString(result);
		
		
		return jsonResult;
	}
	
	
	@RequestMapping("idCheck")
	@ResponseBody
	public String idCheck(String mem_id, Map<String, String> params) throws SQLException, JsonGenerationException, JsonMappingException, IOException{
		params.put("mem_id", mem_id);
		MemberVO memberInfo = memberService.memberInfo(params);
		Map<String, String> result = new HashMap<String, String>();
		if(memberInfo == null){
			result.put("dupl", "false");
		}else{
			result.put("dupl", "true");
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonResult = mapper.writeValueAsString(result);
		
		return jsonResult;
		
	}
	
	@RequestMapping("memberRegistRequest")
	@ResponseBody
	public String memberRegistRequest(MemberVO memberInfo) throws SQLException{
		
		memberService.insertMember(memberInfo);
		
		
		
		return "";
	}

}
