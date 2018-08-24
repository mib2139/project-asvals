package com.example.spring02.model.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring02.model.board.dto.BoardVO;

@Repository    // ���� Ŭ������ dao bean���� ���
public class BoardDAOImpl implements BoardDAO {
	@Inject
	SqlSession SqlSession;
	// 01. �Խñ� �ۼ�
	@Override
	public void create(BoardVO vo) throws Exception {
		SqlSession.insert("board.insert", vo);
	}
	// 02. �Խñ� �󼼺���
	@Override
	public BoardVO read(int bno) throws Exception {
		return SqlSession.selectOne("board.view", bno);
	}
	// 03. �Խñ� ����
	@Override
	public void update(BoardVO vo) throws Exception {
		SqlSession.update("board.updateArticle", vo);

	}
	// 04. �Խñ� ����
	@Override
	public void delete(int bno) throws Exception {
		SqlSession.delete("board.deleteArticle",bno);

	}
	// 05. �Խñ� ��ü ���
	@Override
	public List<BoardVO> listAll(String searchOption, String keyword) throws Exception {
		// �˻��ɼ�, Ű���� �ʿ� ����
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return SqlSession.selectList("board.listAll", map);
	}
	//06. �Խñ� ��ȸ�� ����
	@Override
	public void increaseViewcnt(int bno) throws Exception {
		SqlSession.update("board.increaseViewcnt", bno);
	}

	// 07. �Խñ� ���ڵ� ����
	@Override
	public int countArticle(String searchOption, String keyword) throws Exception {
	    // �˻��ɼ�, Ű���� �ʿ� ����
	    Map<String, String> map = new HashMap<String, String>();
	    map.put("searchOption", searchOption);
	    map.put("keyword", keyword);
	    return SqlSession.selectOne("board.countArticle", map);
	}

}