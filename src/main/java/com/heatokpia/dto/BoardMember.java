package com.heatokpia.dto;

import javax.validation.constraints.NotBlank;

public class BoardMember {

	@NotBlank(message = "내용을 입력해주세요") // null, "", " " 허용x
	private String content;
	
	@NotBlank(message = "이름을 입력해주세요")
	private String name;
	
	@NotBlank()
	private String ip;
	
	@NotBlank()
	private String id;
	
	private boolean category;
	
	@NotBlank(message = "제목을 입력해주세요")
	private String title;
	
}
