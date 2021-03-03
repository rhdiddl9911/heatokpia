package com.heatokpia.domain;

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
	private String content;
	private String createdate;
	private Member aMember;
}
