package com.heatokpia.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NoticeBoard {

	private int seq;
	private String title;
	private String content;
	private String createdate;
	private String updatedate;
	private int hit;
	private Member member;
	private int category;
	
}
