package com.example.spring2.controller.board;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring2.HomeController;
import com.example.spring2.model.board.dto.BoardVO;
import com.example.spring2.model.board.dto.ImageVO;
import com.example.spring2.service.board.BoardService;
import com.example.spring2.service.board.ImageService;
import com.example.spring2.service.board.ImageServiceImpl;
@Controller    // ���� Ŭ������ ��Ʈ�ѷ� ��(bean)���� ���
@RequestMapping("/board/*")
public class BoardController {

	
	@Inject
	BoardService boardService;

	// 01. �Խñ� ���
	@RequestMapping("list.do")
	public ModelAndView list() throws Exception{
		List<BoardVO> list = boardService.listAll();
		// ModelAndView - �𵨰� ��
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/list"); // �並 list.jsp�� ����
		mav.addObject("list", list); // �����͸� ����
		return mav; // list.jsp�� List�� ���޵ȴ�.
	}

	// 02_01. �Խñ� �ۼ�ȭ��
	// @RequestMapping("board/write.do")
	// value="", method="���۹��"
	@RequestMapping(value="write.do", method=RequestMethod.GET)
	public String write(){
		return "board/write"; // write.jsp�� �̵�
	}

	// 02_02. �Խñ� �ۼ�ó��
	@RequestMapping(value="/insert.do", method=RequestMethod.POST)
	public String insert(@ModelAttribute BoardVO vo) throws Exception{
		boardService.create(vo);
		return "redirect:list.do";
	}

	// 03. �Խñ� �󼼳��� ��ȸ, �Խñ� ��ȸ�� ���� ó��
	// @RequestParam : get/post������� ���޵� ���� 1��
	// HttpSession ���ǰ�ü
	@RequestMapping(value="view.do", method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int bno, HttpSession session) throws Exception{
		// ��ȸ�� ���� ó��
		boardService.increaseViewcnt(bno, session);
		// ��(������)+��(ȭ��)�� �Բ� �����ϴ� ��ü
		ModelAndView mav = new ModelAndView();
		// ���� �̸�
		mav.setViewName("board/view");
		// �信 ������ ������
		mav.addObject("dto", boardService.read(bno));
		return mav;
	}

	// 04. �Խñ� ����
	// ������ �Է��� ������� @ModelAttribute BoardVO vo�� ���޵�
	@RequestMapping(value="update.do", method=RequestMethod.POST)
	public String update(@ModelAttribute BoardVO vo) throws Exception{
		boardService.update(vo);
		return "redirect:list.do";
	}

	// 05. �Խñ� ����
	@RequestMapping(value="delete.do",method=RequestMethod.GET)
	public String delete(@RequestParam int bno) throws Exception{
		boardService.delete(bno);
		return "redirect:list.do";
	}
	
	@RequestMapping(value="fileUpload.do", method=RequestMethod.GET)
	public String fileUpload(){
		return "board/fileUpload"; 
	}
	
	
	@RequestMapping(value="insertimg.do", method=RequestMethod.POST)
	public String insertimage(HttpServletRequest request){
		ImageService is = new ImageServiceImpl();
		is.upload(request);

		return "redirect:fileUpload.do"; 
	}
	
	public String insertimg(@ModelAttribute ImageVO vo) throws Exception{
		
		return "redirect:list.do";
	}
}

