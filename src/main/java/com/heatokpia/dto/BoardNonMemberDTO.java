package com.heatokpia.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardNonMemberDTO {

	@Size(max = 1000, message = "내용이 너무 깁니다.")
	@NotBlank(message = "내용을 입력해주세요") // null, "", " " 허용x
	private String content;
	
	@Size(max = 10, message = "이름이 너무 깁니다.")
	@NotBlank(message = "이름을 입력해주세요")
	private String name;
	
	private String ip;
	
	
	@Size(max = 60, message = "비밀번호가 너무 깁니다.")
	@NotBlank(message = "비밀번호를 입력해주세요")
	@Pattern(regexp = "^[A-Za-z0-9]+$", message = "비밀번호는 영문, 숫자만 가능합니다.")
	private String password;
	
	private int category;
	
	@Size(max = 100, message = "제목이 너무 깁니다.")
	@NotBlank(message = "제목을 입력해주세요")
	private String title;
	
	
}
