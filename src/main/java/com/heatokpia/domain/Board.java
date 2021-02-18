package com.heatokpia.domain;

import java.util.Date;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Board {
	
	private int seq;
	
	private String content;
	
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedate;
	
	private int like_count;
	
	private String name;
	
	private String ip;
	
	private String password;
	
	private boolean category;
	private boolean best;
	private int hit;
	private String id;
	
	private String title;
	
}
