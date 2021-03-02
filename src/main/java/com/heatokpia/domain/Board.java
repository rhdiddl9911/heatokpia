package com.heatokpia.domain;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Board {
	
	private int seq;
	
	@Size(max = 1000, message = "내용이 너무 깁니다.")
	@NotBlank(message = "내용을 입력해주세요")
	private String content;
	
	private String createdate;
	
	private String updatedate;
	
	private int like_count;
	
	private String name;
	
	private String ip;
	
	private String password;
	
	private int category;
	private boolean best;
	private int hit;
	private String id;
	
	@Size(max = 100, message = "제목이 너무 깁니다.")
	@NotBlank(message = "제목을 입력해주세요")
	private String title;
	
}
