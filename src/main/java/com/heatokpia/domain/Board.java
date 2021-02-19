package com.heatokpia.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Board {
	
	private int seq;
	
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
	
	private String title;
	
}
