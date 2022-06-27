package com.smhrd.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data// getter, setter, toString
@NoArgsConstructor
public class Board {
	// 1. Class Field name == Table 컬럼명
	// 2. 기본생성자 @NoArgsConstructor
	
	// 글 번호
	private int idx;
	// 제목
	private String title;
	// 작성자
	private String writer;
	// 내용
	private String content;
	// 날짜
	private String indate;
	// 조회수
	private int count;


	
}
