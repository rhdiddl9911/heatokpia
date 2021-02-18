package com.heatokpia.dto;

import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardNonMember {

	@NotBlank(message = "내용을 입력해주세요") // null, "", " " 허용x
	private String content;
	
	@NotBlank(message = "이름을 입력해주세요")
	private String name;
	
	@NotBlank()
	private String ip;
	
	@NotBlank(message = "비밀번호를 입력해주세요")
	private String password;
	
	private boolean category;
	
	@NotBlank(message = "제목을 입력해주세요")
	private String title;
	
}
