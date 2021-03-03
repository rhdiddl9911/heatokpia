package com.heatokpia.domain;

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
	private String title;
	private String content;
	private boolean anser;
	private Member qMember;
	private String createdate;
	
}
