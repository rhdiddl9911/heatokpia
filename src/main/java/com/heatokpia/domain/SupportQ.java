package com.heatokpia.domain;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class SupportQ {

	/*
	 * content              VARCHAR2(3000) NOT NULL,
       createdate           DATE NOT NULL,
       anser                VARCHAR2(1) NULL,
       id                   VARCHAR2(20) NOT NULL,
       seq                  INTEGER NOT NULL,
       title                VARCHAR2(300) NOT NULL,
	 */
	
	private int seq;
	
	@Size(max = 100, message = "제목이 너무 깁니다.")
	@NotBlank(message = "제목을 입력해주세요")
	private String title;
	
	@Size(max = 1000, message = "내용이 너무 깁니다.")
	@NotBlank(message = "내용을 입력해주세요")
	private String content;
	private boolean anser;
	private Member qmember;
	private String createdate;
	
}
