package com.kh.spring.board.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.board.model.dto.Board;
import com.kh.spring.board.model.dto.BoardComment;
import com.kh.spring.board.model.service.BoardService;
import com.kh.spring.common.util.pagination.Paging;
import com.kh.spring.member.model.dto.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("board")
public class BoardController {

	private final BoardService boardService;
	
	@GetMapping("info")
	public String boardInfo(Model model
							,@RequestParam(required = false, defaultValue = "1") int page
							,@RequestParam(required = false) String option
							,@RequestParam(required = false) String keyword
							,@RequestParam(required = false, defaultValue = "reg_date") String sort
							) {
		Map<String,Object> commandMap = new LinkedHashMap<String,Object>();
		
		commandMap.put("isDel", 1);
		commandMap.put("category", "info"); //기본 조건
		commandMap.put("option", option);
		commandMap.put("keyword", keyword);
		commandMap.put("sort", sort);
		model.addAttribute("dataMap",commandMap);
		
		return makeBoard(model,commandMap, page);
		
	}
	
	@GetMapping("info/form")
	public String infoForm(Model model) {
		model.addAttribute("title", "정보");
		model.addAttribute("category", "info");
		return "board/board-form";

	}
	
	@GetMapping("info/detail")
	public String infoDetail(Model model, @RequestParam(value = "bdIdx") int bdIdx) {
		
		model.addAttribute("title", "정보");
		model.addAttribute("category", "info");
		model.addAllAttributes(boardService.selectBoardByIdx(bdIdx));
		return "board/board-detail";
	}
	
	@GetMapping("info/modify")
	public String infoModify(Model model
			, @RequestParam(value = "bdIdx") int bdIdx
			, HttpSession session) {
		model.addAttribute("title", "정보");
		model.addAttribute("category", "info");
		model.addAllAttributes(boardService.selectBoardByIdx(bdIdx));
		session.setAttribute("modi-bdIdx", bdIdx);
		return "board/board-modify";
	}
	
	@GetMapping("cat")
	public String boardCat(Model model
							,@RequestParam(required = false, defaultValue = "1") int page
							,@RequestParam(required = false) String option
							,@RequestParam(required = false) String keyword
							,@RequestParam(required = false, defaultValue = "reg_date") String sort) {
		Map<String,Object> commandMap = new LinkedHashMap<String,Object>();
		
		commandMap.put("isDel", 1);
		commandMap.put("category", "cat");
		commandMap.put("option", option);
		commandMap.put("keyword", keyword);
		commandMap.put("sort", sort);
		model.addAttribute("dataMap",commandMap);
		
		return makeBoard(model,commandMap, page);
		
	}
	
	@GetMapping("cat/form")
	public String catForm(Model model) {
		model.addAttribute("title", "고양이");
		model.addAttribute("category", "cat");
		return "board/board-form";

	}
	
	@GetMapping("cat/detail")
	public String catDetail(Model model, @RequestParam(value = "bdIdx") int bdIdx) {
		model.addAttribute("title", "고양이");
		model.addAttribute("category", "cat");
		model.addAllAttributes(boardService.selectBoardByIdx(bdIdx));
		return "board/board-detail";
	}
	
	@GetMapping("cat/modify")
	public String catModify(Model model
			, @RequestParam(value = "bdIdx") int bdIdx
			, HttpSession session) {
		model.addAttribute("title", "고양이");
		model.addAttribute("category", "cat");
		model.addAllAttributes(boardService.selectBoardByIdx(bdIdx));
		session.setAttribute("modi-bdIdx", bdIdx);
		return "board/board-modify";
	}
	
	@GetMapping("dog")
	public String boardDog(Model model
							,@RequestParam(required = false, defaultValue = "1") int page
							,@RequestParam(required = false) String option
							,@RequestParam(required = false) String keyword
							,@RequestParam(required = false, defaultValue = "reg_date") String sort) {
		Map<String,Object> commandMap = new LinkedHashMap<String,Object>();
		
		commandMap.put("isDel", 1);
		commandMap.put("category", "dog");
		commandMap.put("option", option);
		commandMap.put("keyword", keyword);
		commandMap.put("sort", sort);
		model.addAttribute("dataMap",commandMap);
		
		return makeBoard(model,commandMap, page);
		
	}
	
	@GetMapping("dog/form")
	public String dogForm(Model model) {
		model.addAttribute("title", "강아지");
		model.addAttribute("category", "dog");
		return "board/board-form";

	}
	
	@GetMapping("dog/detail")
	public String dogDetail(Model model, @RequestParam(value = "bdIdx") int bdIdx) {
		model.addAttribute("title", "강아지");
		model.addAttribute("category", "dog");
		model.addAllAttributes(boardService.selectBoardByIdx(bdIdx));
		return "board/board-detail";
	}
	
	@GetMapping("dog/modify")
	public String dogModify(Model model, @RequestParam(value = "bdIdx") int bdIdx, HttpSession session) {
		model.addAttribute("title", "강아지");
		model.addAttribute("category", "dog");
		model.addAllAttributes(boardService.selectBoardByIdx(bdIdx));
		session.setAttribute("modi-bdIdx", bdIdx);
		return "board/board-modify";
	}
	
	@GetMapping("review")
	public String boardReview(Model model
							,@RequestParam(required = false, defaultValue = "1") int page
							,@RequestParam(required = false) String option
							,@RequestParam(required = false) String keyword
							,@RequestParam(required = false, defaultValue = "reg_date") String sort) {
		Map<String,Object> commandMap = new LinkedHashMap<String,Object>();
		
		commandMap.put("isDel", 1);
		commandMap.put("category", "review");
		commandMap.put("option", option);
		commandMap.put("keyword", keyword);
		commandMap.put("sort", sort);
		model.addAttribute("dataMap",commandMap);
		
		return makeBoard(model,commandMap, page);
		
	}
	
	@GetMapping("review/form")
	public String reviewForm(Model model) {
		model.addAttribute("title", "후기");
		model.addAttribute("category", "review");
		return "board/board-form";

	}
	
	@GetMapping("review/detail")
	public String reviewDetail(Model model, @RequestParam(value = "bdIdx") int bdIdx) {
		model.addAttribute("title", "후기");
		model.addAttribute("category", "review");
		model.addAllAttributes(boardService.selectBoardByIdx(bdIdx));
		return "board/board-detail";
	}
	
	@GetMapping("review/modify")
	public String reviewModify(Model model, @RequestParam(value = "bdIdx") int bdIdx, HttpSession session) {
		model.addAttribute("title", "후기");
		model.addAttribute("category", "review");
		model.addAllAttributes(boardService.selectBoardByIdx(bdIdx));
		session.setAttribute("modi-bdIdx", bdIdx);
		return "board/board-modify";
	}
	
	@GetMapping("meet")
	public String boardMeet(Model model
							,@RequestParam(required = false, defaultValue = "1") int page
							,@RequestParam(required = false) String option
							,@RequestParam(required = false) String keyword
							,@RequestParam(required = false, defaultValue = "reg_date") String sort) {
		Map<String,Object> commandMap = new LinkedHashMap<String,Object>();
		
		commandMap.put("isDel", 1);
		commandMap.put("category", "meet");
		commandMap.put("option", option);
		commandMap.put("keyword", keyword);
		commandMap.put("sort", sort);
		model.addAttribute("dataMap",commandMap);
		
		return makeBoard(model,commandMap, page);
		
	}
	
	@GetMapping("meet/form")
	public String meetForm(Model model) {
		model.addAttribute("title", "모임");
		model.addAttribute("category", "meet");
		return "board/board-form";

	}
	
	@GetMapping("meet/detail")
	public String meetDetail(Model model, @RequestParam(value = "bdIdx") int bdIdx) {
		model.addAttribute("title", "모임");
		model.addAttribute("category", "meet");
		model.addAllAttributes(boardService.selectBoardByIdx(bdIdx));
		return "board/board-detail";
	}
	
	@GetMapping("meet/modify")
	public String meetModify(Model model, @RequestParam(value = "bdIdx") int bdIdx, HttpSession session) {
		model.addAttribute("title", "모임");
		model.addAttribute("category", "meet");
		model.addAllAttributes(boardService.selectBoardByIdx(bdIdx));
		session.setAttribute("modi-bdIdx", bdIdx);
		return "board/board-modify";
	}
	
	
	@GetMapping("consulting")
	public String boardConsulting(Model model
							,@RequestParam(required = false, defaultValue = "1") int page
							,@RequestParam(required = false) String option
							,@RequestParam(required = false) String keyword
							,@RequestParam(required = false, defaultValue = "reg_date") String sort) {
		Map<String,Object> commandMap = new LinkedHashMap<String,Object>();
		
		commandMap.put("isDel", 1);
		commandMap.put("category", "consulting");
		commandMap.put("option", option);
		commandMap.put("keyword", keyword);
		commandMap.put("sort", sort);
		model.addAttribute("dataMap",commandMap);
		
		return makeBoard(model,commandMap, page);
		
	}
	
	@GetMapping("consulting/form")
	public String consultingForm(Model model) {
		model.addAttribute("title", "상담");
		model.addAttribute("category", "consulting");
		return "board/board-form";

	}
	
	@GetMapping("consulting/detail")
	public String consultingDetail(Model model, @RequestParam(value = "bdIdx") int bdIdx) {
		model.addAttribute("title", "상담");
		model.addAttribute("category", "consulting");
		model.addAllAttributes(boardService.selectBoardByIdx(bdIdx));
		return "board/board-detail";
	}
	
	@GetMapping("consulting/modify")
	public String consultingModify(Model model, @RequestParam(value = "bdIdx") int bdIdx, HttpSession session) {
		model.addAttribute("title", "상담");
		model.addAttribute("category", "consulting");
		model.addAllAttributes(boardService.selectBoardByIdx(bdIdx));
		session.setAttribute("modi-bdIdx", bdIdx);
		return "board/board-modify";
	}
	
	
	@GetMapping("board-form")
	public void boardForm() {}
	
	@PostMapping("board-form")
	public String insertBoard(List<MultipartFile> files, Board board ,@SessionAttribute(name = "authentication") Member member) {
		board.setUserIdx(member.getUserIdx());
		board.setNickname(member.getNickName());
		boardService.insertBoard(files,board);
		
		
		
		return "redirect:/board/"+board.getCategory();
	}
	

	@PostMapping("board-modify")
	public String updateBoard(List<MultipartFile> files, Board board,@RequestParam(value="removeFlIdx", required = false) List<Integer> flIdxs) {
		
		boardService.updateBoard(files,board,flIdxs);
		
		
		
		return "redirect:/board/"+board.getCategory();
	}
	@PostMapping("delete-board")
	@ResponseBody
	public String deleteBoard(@RequestBody Board board) {
		System.out.println(board.toString());
		boardService.deleteBoard(board);

		
		return "good";

	}
	
	@PostMapping("delete-comment")
	@ResponseBody
	public String deleteComment(@RequestBody BoardComment boardComment) {
		
		boardService.deleteComment(boardComment);

		
		return "good";

	}
	@PostMapping("comment-form")
	@ResponseBody
	public String insertComment(@RequestBody BoardComment boardComment,@SessionAttribute(name="authentication")Member certifiedUser) {
		boardComment.setUserIdx(certifiedUser.getUserIdx());
		boardComment.setNickname(certifiedUser.getNickName());
		boardService.insertComment(boardComment);

		
		return "good";

	}
	@PostMapping("recommend-board")
	@ResponseBody
	public String recommendBoard(@RequestBody Board board,  @SessionAttribute(name="authentication")Member certifiedUser) {
		System.out.println(board.getBdIdx());
		if(boardService.insertRecommendBoard(board.getBdIdx(), certifiedUser.getUserIdx())) {
			return "good";
		}else {
			return "bad";
		}
	}
	
	@PostMapping("recommend-comment")
	@ResponseBody
	public String recommendComment(@RequestBody BoardComment boardComment,  @SessionAttribute(name="authentication")Member certifiedUser) {
		if(boardService.insertRecommendComment(boardComment.getCmIdx(), certifiedUser.getUserIdx())) {
			return "good";
		}else {
			return "bad";
		}

	}
	
	@PostMapping("update-comment")
	@ResponseBody
	public String updateComment(@RequestBody BoardComment boardComment,  @SessionAttribute(name="authentication")Member certifiedUser) {
		boardService.updateComment(boardComment);
			
		return "good";
		

	}
	
	
	
	public String makeBoard(Model model, Map<String,Object> commandMap, int page) {
		int totalCnt = boardService.selectBoardListCnt(commandMap);
		Paging pageUtil = Paging.builder()
				.curPage(page)
				.cntPerPage(15)
				.blockCnt(10)
				.total(totalCnt)
				.build();
		List<Map<String,Object>> bList = boardService.selectBoard(commandMap,pageUtil);
		model.addAttribute("pageUtil",pageUtil);
		model.addAttribute("totalCnt",totalCnt);
		model.addAttribute("bList",bList);
		model.addAttribute("length",bList.size());
		return "board/board-list";
	}
	
	
	
}
