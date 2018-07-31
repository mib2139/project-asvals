package com.example.spring2.service.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.example.spring2.model.board.dto.ImageVO;

public interface ImageService {
	
	public boolean upload(HttpServletRequest request);

	public void create(ImageVO vo) throws Exception;
	
}
