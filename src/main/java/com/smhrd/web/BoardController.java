package com.smhrd.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.domain.Board;
import com.smhrd.mapper.BoardMapper;

// 어노테이션
// POJO임을 명시
@Controller
public class BoardController {

	// IOC : Inversion of Control(제어의 역전)
	// ☆★☆★ DI : Dependency Injection(의존성 주입) : 
	// 우리가 xml에 적어두면, Spring이 알아서 객체 생성, 사용을 한다.
	@Autowired // self service
	BoardMapper mapper;
	
	// 메서드 <--> 주소 연결(Mapping)
	// "/boardList"라는 요청이 들어오면 이 메서드를 실행!
	
	// 1. 게시물 가져오는 메소드
	@RequestMapping("/boardList.do")
	public String boardList(HttpServletRequest request) {
		
		
//		List<Board> list = new ArrayList<Board>();
//		
//		Board vo = new Board();
//		vo.setIdx(1);
//		vo.setTitle("스프링 게시판");
//		vo.setWriter("이설아");
//		vo.setIndate("2022-06-22");
//		vo.setCount(0);
//		
//		list.add(vo);
//		list.add(vo);
//		list.add(vo);
		
		List<Board> list = mapper.boardList();
		
		// 객체바인딩
		request.setAttribute("list", list);
		
		// jsp(view) 파일 이름으로 리턴
		// forward 방식으로 이동
		// /WEB-INF/vies/boardList.jsp
		return "boardList";
	}// 게시글 가져오는 메소드 끝
	
	// BoardForm으로 이동할 메소드
	@RequestMapping("/boardForm.do")
	public void boardForm() {}
		// 왜 return 없이 void만 설정해줬는데 이동이 될까?
		// if 리턴값이 없다면, 메소드 이름과 같은 이름을 가진 view로 이동!
		
		// public String boardForm(){
		// return "boardForm";}

	// 게시글 작성 메소드
	@RequestMapping("/boardInsert.do")
	public String boardInsert(Board vo) {
		/*
		 1. input Tag name == VO field name == Table Column name
		 2. 기본생성자
		 - 매개변수를 통해서 파라미터 수집 가능
		 - 만약 한개만 보내주는 경우라면?
		 매개변수 변수명 == input태그의 name
		 자동으로 파라미터 수집하는 경우 -> 만약 null값을 받으면 기본값으로 대체
		 eX) content : null ---> vo.setContent("");
		*/
	
		
		/*
	 	파라미터 수집
		form태그로 보낸 데이터 받기(변수에 담기)
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
		BoardMapper 인터페이스에서 Board vo를 매개변수로 받아옴
		Board vo = new Board();
		vo.setTitle(title);
		vo.setWriter(writer);
		vo.setContent(content);
		*/
		
		// 게시글 저장
		mapper.boardInsert(vo);
		
		// /WEB-INF/views/boardList.do.jsp
		// Redirect
		return "redirect:/boardList.do";
	}// 게시글 작성 메소드 끝
	
	// 게시글 1개 가져오는 메소드
	@RequestMapping("/boardContent.do")
	public void boardContent(int idx, Model model) {
		
		// DB에서 글 가져오기
		Board vo = mapper.boardContent(idx);
		
		// 조회수 증가(Update쿼리문 짜기)
		mapper.boardCount(idx);
		
		// 객체 바인딩
		// Model -> 객체바인딩 특화 : request에서 객체 바인딩에 필요한 부분만 빼고 모두 버린 객체, request 영역에 저장
		// - 효율적인 코딩 가능
		model.addAttribute("vo", vo);
	} // 게시글 1개 가져오는 메소드 끝!
	
	
	// 게시글 삭제하는 메소드
	// "/boardDelete.do/{name}" : pathvariable
	@RequestMapping("/boardDelete.do/{idx}")
	public String boardDelete( @PathVariable("idx") int num) {
		// 주소 모양 그대로 데이터를 보내는 방식 : path variable
		// RequestMapping에서 /{name}을 통해 받아주어야 함
		// @PathVariable : 메서드의 매개변수로 PathVariable의 값을 받아옴
		// @PathVariable("name") : name 값에 해당하는 Path Variable 값을 매개변수에 담아준다.
		
		// public String boardDelete(@RequestParam("idx") int num) {
		// @RequestParam("name") : 변수의 이름이 일치하지 않아도 넣어준다.
		mapper.boardDelete(num);
		
		return "redirect:/boardList.do";
	} // 게시글 삭제 메소드 끝
	
	// 업데이터 페이지로 이동
	// Get방식 요청만 받아들이는 컨트롤러
	@GetMapping("/boardUpdate.do")
	public String boardUpdateForm(int idx, Model model) {
		
		Board vo = mapper.boardContent(idx);
		// 객체바인딩
		model.addAttribute("vo", vo);
		
		return "boardUpdate";
	}
	
	// 같은 url 요청이라도 요청 방식에 따라 다른 처리를 해야할 때 사용
	// 실제 Update하는 기능
	@PostMapping("/boardUpdate.do")
	public String boardUpdate(Board vo) {
		int row = 0;
		row = mapper.boardUpdate(vo);
		return "redirect:/boardContent.do?idx=" + vo.getIdx();
	}
}