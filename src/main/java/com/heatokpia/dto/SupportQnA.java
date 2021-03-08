package com.heatokpia.dto;

import com.heatokpia.domain.SupportA;
import com.heatokpia.domain.SupportQ;

import lombok.Data;

@Data
public class SupportQnA {

	SupportQ question;
	SupportA anser;
	
}
