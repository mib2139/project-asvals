package com.example.spring02.service.board;

import java.io.File;
import java.util.Enumeration;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import com.example.spring02.model.board.dao.ImageDAO;
import com.example.spring02.model.board.dto.ImageVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ImageServiceImpl implements ImageService{

	@Inject
	ImageDAO imageDao;

	// 01. 寃뚯떆湲��벐湲�
	@Override
	public void create(ImageVO vo) throws Exception {
		MultipartRequest multi = null;
		String cate = multi.getParameter("cate");
		vo.setCate(cate);
		imageDao.insertImg(vo);
		
	}


	@Override
	public boolean upload(HttpServletRequest request) {
		String uploadPath = "C:/Images";
		int maxSize = 1024 * 1024 * 10;

		String fileName1 = ""; 
		String originalName1 = ""; 
		long fileSize = 0; 
		String fileType = "";

		MultipartRequest multi = null;


		try{

			multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames();
			while(files.hasMoreElements()){
				// form 
				String file1 = (String)files.nextElement(); 

				originalName1 = multi.getOriginalFileName(file1);

				fileName1 = multi.getFilesystemName(file1);

				fileType = multi.getContentType(file1);

				File file = multi.getFile(file1);

				fileSize = file.length();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return true;
	}


}
