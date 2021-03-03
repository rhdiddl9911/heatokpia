package com.heatokpia.domain;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class SupportA {
/*
 * content              VARCHAR2(3000) NOT NULL,
       createdate           DATE NOT NULL,
       q_seq                INTEGER NOT NULL,
       id                   VARCHAR2(20) NOT NULL,
 */
	private int qSeq;
	
	@Size(max = 1000, message = "내용이 너무 깁니다.")
	@NotBlank(message = "내용을 입력해주세요")
	private String content;
	private String createdate;
	private Member aMember;
}
