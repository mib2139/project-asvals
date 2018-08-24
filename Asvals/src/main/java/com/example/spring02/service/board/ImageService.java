package com.example.spring02.service.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.example.spring02.model.board.dto.ImageVO;

public interface ImageService {
	
	public boolean upload(HttpServletRequest request);

	public void create(ImageVO vo) throws Exception;
	
}
