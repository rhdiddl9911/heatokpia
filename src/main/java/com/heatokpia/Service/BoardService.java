package com.heatokpia.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.heatokpia.domain.BoardCategory;
import com.heatokpia.dto.BoardNonMemberDTO;
import com.heatokpia.mapper.BoardMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardService {

	private final Logger logger = LoggerFactory.getLogger(getClass());
	private final BoardMapper boardMapper;
	private final PasswordEncoder passEncoder;
	
	// 글 입력
	public void write(BoardNonMemberDTO data, String ip, BoardCategory category) {
		data.setIp(ip);
		data.setCategory(category.getCategoryNum());
		data.setPassword(passEncoder.encode(data.getPassword()));
		boardMapper.save(data);
		logger.info("write:"+data.toString());
	}
}
