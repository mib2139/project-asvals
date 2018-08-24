package com.example.spring02.model.board.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring02.model.board.dto.ImageVO;


@Repository 
public class ImageDAOIpml implements ImageDAO{
	@Inject
	SqlSession SqlSession;

	@Override
	public void insertImg(ImageVO vo) throws Exception {
		SqlSession.insert("board.insertimg", vo);
	}

}

