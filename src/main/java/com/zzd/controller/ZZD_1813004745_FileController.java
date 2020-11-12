package com.zzd.controller;

import com.zzd.service.ZZD_1813004745_BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/file")
public class ZZD_1813004745_FileController {

	@Autowired
	private ZZD_1813004745_BookService bookService;

	@PostMapping(value = "/upload")
	// 使用Spring MVC的MultipartFile类作为参数，对应了保存的临时文件
	public String fileLoad(@PathParam("id") Integer id, @RequestParam(value = "file", required = false) MultipartFile photo) {
		String path = "D:/360MoveData/Users/张振东/Desktop/works/mall-learning-master/book_manager_system/src/main/resources/static/images/"; // 保存路径
		String fileName = null;
		if (!photo.isEmpty()) {
			// String fileName = photos[i].getOriginalFilename();

			fileName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
			String suffix = photo.getOriginalFilename().substring(photo.getOriginalFilename().lastIndexOf("."));
			System.out.println(suffix);
			if (!suffix.equals(".jpg") || !suffix.equals(".png") || !suffix.equals(".gif")) {
//					return dealResultMap(false, "上传失败");
			}
			try {
				// Spring提供了文件操作类FileCopyUtils

				FileCopyUtils.copy(photo.getInputStream(), new FileOutputStream( path + fileName + suffix));
				fileName = "http://localhost/images/" + fileName + suffix;

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
//					return dealResultMap(false, "上传失败");
			}
		}
		System.out.println(path);
		bookService.addCoverById(id, fileName);
		return "redirect:/books/details1";
	}

	private Map<String, Object> dealResultMap(boolean success, String msg) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", success);
		result.put("msg", msg);
		return result;
	}


}
