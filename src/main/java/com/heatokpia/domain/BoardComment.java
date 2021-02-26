package com.heatokpia.domain;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class BoardComment {
	
	private int seq;
	
	private int boardSeq;
	
	@Size(max = 60, message = "비밀번호가 너무 깁니다.")
	@NotBlank(message = "비밀번호를 입력해주세요")
	@Pattern(regexp = "^[A-Za-z0-9]+$", message = "비밀번호는 영문, 숫자만 가능합니다.")
	private String password;
	
	@Size(max = 10, message = "이름이 너무 깁니다.")
	@NotBlank(message = "이름을 입력해주세요")
	private String name;
	
	private String id;
	
	private String ip;
	
	@Size(max = 300, message = "내용이 너무 깁니다.")
	@NotBlank(message = "내용을 입력해주세요")
	private String content;
}
