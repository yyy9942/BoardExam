package kr.or.ddit.member.board.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.MemberVO;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/member/board/")
public class BoardController {
	@Autowired
	IBoardService boardService;
	
	@RequestMapping("boardList")
	public Model boardList(Model model, Map<String, String> params,
						@RequestParam(required=false, defaultValue="0")int pageNum,
						@RequestParam(required=false, defaultValue="10")int viewQuantity) throws SQLException{
		params.put("start", String.valueOf(pageNum*viewQuantity));
		params.put("end", String.valueOf(pageNum*viewQuantity+viewQuantity));
		
		List<BoardVO> boardList = boardService.boardList(params);
		model.addAttribute("boardList", boardList);
		return model;
	}
	
	@RequestMapping("boardView")
	public Model boardView(Model model, Map<String, String> params, String bo_id) throws SQLException{
		params.put("bo_id", bo_id);
		BoardVO boardInfo = boardService.boardView(params);
		model.addAttribute("boardInfo", boardInfo);
		return model;
	}
	
	@RequestMapping("boardForm")
	public void boardForm(){}
	
	@RequestMapping(value="boardInsert",method=RequestMethod.POST)
	public String boardInsert(BoardVO boardInfo, Map<String, String> result, HttpSession session) throws SQLException, JsonGenerationException, JsonMappingException, IOException{
		MemberVO currentMember = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		boardInfo.setMem_id(currentMember.getMem_id());
		boardService.insertBoard(boardInfo);
		result.put("flag", "true");
		ObjectMapper mapper = new ObjectMapper();
		String jsonResult = mapper.writeValueAsString(result);
		
		
		return jsonResult;
	}
	
}
