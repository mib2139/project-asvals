package com.example.spring2.model.board.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring2.model.board.dto.ImageVO;

@Repository 
public class ImageDAOIpml implements ImageDAO{
	@Inject
    SqlSession SqlSession;
    // 01. 게시글 작성
 

    @Override
    public void insertImg(ImageVO vo) throws Exception {
        SqlSession.insert("board.insertimg", vo);
    }
    
}
