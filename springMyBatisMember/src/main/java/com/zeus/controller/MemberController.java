package com.zeus.controller;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zeus.domain.Member;
import com.zeus.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@MapperScan(basePackages = "com.zeus.mapper")
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@GetMapping("/insertForm")
	public String memberInsertForm(Model model) {
		return "member/insertForm";
	}
	
	@PostMapping("/insert")
	public String memberInsert(Member member, Model model) {
		log.info("insert member =" + member.toString());
		try {
			int count = memberService.register(member);
			if (count > 0) {
				model.addAttribute("message", "%s님 회원정보가 등록되었습니다.".formatted(member.getName()));
				return "member/success";
			}
		} catch (Exception e) {
			log.error("회원 등록 중 에러 발생!!!"); // 3. 에러 발생 시 로그 찍기
			e.printStackTrace();
			model.addAttribute("Message", e.getMessage());
			return "member/insertForm";
		}
		return "member/failed";
	}
	
	
	@GetMapping("/memberList")
	public String memberList(Model model) {
		log.info("memberList");
		try {
			List<Member> memberList = memberService.list();
			model.addAttribute("memberList", memberList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "member/memberList";
	}

	@GetMapping("/detail")
	public String memberDetail(Member member , Model model) {
		log.info("MemberDetail member: " + member.toString());
		Member m = null;
		try {
			m = memberService.read(member);
			if (m == null) {
				model.addAttribute("message", "%d번 회원의 상세정보가 없습니다.".formatted(m.getNo()));
				return "member/failed";
			}
			model.addAttribute("member", m);
		} catch (Exception e) {
			log.error("상세조회 중 에러: " + e.getMessage());
			e.printStackTrace();
		}
		model.addAttribute("member", m);
		return "member/detail";
	}

	@GetMapping("/updateForm")
	public String memberUpdateForm(Member member, Model model) {
		log.info("UpdateForm = " + member.toString());
		try {
			Member m = memberService.read(member);
			if (m == null) {
				model.addAttribute("message", "%d번 회원의 정보가 없습니다.".formatted(m.getNo()));
				return "member/failed";
			}
			model.addAttribute("member", m);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "member/updateForm";
	}
	
	@PostMapping("/update")
	public String memberUpdate(Member member, Model model) { 
		log.info("memberUpdate member =" + member.toString());
		try {
			int count =  memberService.update(member);
			if (count > 0) {
				model.addAttribute("message", "%s님의 게시글 수정성공".formatted(member.getName()));
				return "member/success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("message", "%s님의 게시글 수정실패".formatted(member.getName()));
		return "member/failed";
	}
	
	/*
	@GetMapping("/delete")
	public String boardDelete(Board board, Model model) {
		log.info("boardDelete board= " + board.toString());
		try {
			boardService.delete(board);
			model.addAttribute("board", board);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "%s 님의 게시글 삭제실패하였습니다.".formatted(board.getWriter()));
			return "board/failed";
		}
		model.addAttribute("message", "%d번 게시글이 삭제되었습니다.".formatted(board.getNo()));
		return "board/success";
	}

	

	
	
	@GetMapping("/search")
	public String boardSearch(Board board, Model model) {
	    log.info("boardSearch board"+board.toString());
	    try {
	        List<Board> boardList = boardService.search(board);
	        model.addAttribute("boardList", boardList);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return "board/boardList";
	}
	*/
}
	

