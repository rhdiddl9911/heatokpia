package com.heatokpia.dto;


import lombok.Data;

@Data
public class BoardTitleDTO {

	private int seq;
	private String title;
	
	private String createdate;
	
	// 나중에 댓글수, like
}
