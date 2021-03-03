package com.heatokpia.domain;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;

// NEWS table과 매핑시켜줄 도메인입니다.
@Data
public class News {
	
	private int seq;
	
	@Size(max = 200, message = "제목이 너무 깁니다.")
	@NotBlank(message = "제목을 입력해주세요")
	private String title;
	
	//@Size(max = 1000, message = "내용이 너무 깁니다.")
	@NotBlank(message = "내용을 입력해주세요")
	private String content;
	
	@Size(max = 100, message = "출처가 너무 깁니다.")
	@NotBlank(message = "출처를 입력해주세요")
	private String authorship;
	private String createdate;
	private Member member;	// Member
	
	@Size(max = 200, message = "주소가 너무 깁니다.")
	@NotBlank(message = "주소를 입력해주세요")
	private String url;
}
