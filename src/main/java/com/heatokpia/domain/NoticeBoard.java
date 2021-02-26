package com.heatokpia.domain;

import lombok.Data;

@Data
public class NoticeBoard {

	private int seq;
	private String title;
	private String content;
	private String createdate;
	private String updatedate;
	private int hit;
	private String id;
	
}
