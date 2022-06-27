package com.smhrd.mapper;

import java.util.List;

import com.smhrd.domain.Board;

public interface BoardMapper {
	// 중요 ★☆★☆연결된 xml 파일과 이름이 같아야 함!★☆★☆
	
	// DB 연결은 다른 파일에서 진행
	
	// 추상메서드
	// Spring에서 쓸 때는 추상메서드만 만들고, mapper.xml이랑 매핑
	// 메서드 이름 <- mapping -> xml id
	
	// 1. boardList(글목록)
	public List<Board> boardList(); 
	
	// 2. boardInsert(글작성)
	public int boardInsert(Board vo);
	
	// 3. boardContent(글 내용 보기)
	public Board boardContent(int idx);
	
	// 4. boardDelete(글 삭제)
	public int boardDelete(int idx);
}
