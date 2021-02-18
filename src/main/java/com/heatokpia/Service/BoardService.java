package com.heatokpia.Service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.heatokpia.domain.BoardCategory;
import com.heatokpia.dto.BoardNonMember;
import com.heatokpia.mapper.BoardMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardService {

	private final BoardMapper boardMapper;
	private final PasswordEncoder passEncoder;
	
	// 글 입력
	public void write(BoardNonMember data, String ip, BoardCategory category) {
		data.setIp(ip);
		data.setCategory(category.getBoolType());
		data.setPassword(passEncoder.encode(data.getPassword()));
		boardMapper.save(data);
	}
}
