package com.heatokpia.controller;

import java.sql.SQLSyntaxErrorException;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class ExceptionAdvisor {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	// 유효성 검사 실패시 실패 필드 key, 메세지-입력값 value
	@ExceptionHandler(MethodArgumentNotValidException.class)
	public ResponseEntity<Map<String, String>> validationError(MethodArgumentNotValidException exception) {
		BindingResult bindingResult = exception.getBindingResult();
		Map<String, String> errorList = new HashMap<String, String>();
		logger.info(errorList.toString());
		for (FieldError filedError : bindingResult.getFieldErrors()) {
			errorList.put(filedError.getField(), filedError.getDefaultMessage());
		}
		
		return new ResponseEntity<Map<String,String>>(errorList, HttpStatus.BAD_REQUEST);
	}
	
	// sql 문 실패시 페이지엔 저장소 오류 반환
	@ExceptionHandler(SQLSyntaxErrorException.class)
	public ResponseEntity<String> syntaxError(SQLSyntaxErrorException e) {
		logger.error("sql 에러!" + e.getMessage());
		return new ResponseEntity<String>("저장소 오류", HttpStatus.BAD_REQUEST);
	}
	
	// 유효하지않은 접근? 툴로 post요청 날렸을때 메세지 숨김용도..?
	@ExceptionHandler(HttpMessageNotReadableException.class)
	public ResponseEntity<String> requestError(HttpMessageNotReadableException e){
		logger.error("접근 에러" + e.getMessage());
		return new ResponseEntity<String>("오류", HttpStatus.BAD_REQUEST);
	}
}
