package com.zzd.controller;

import com.zzd.entity.ZZD_1813004745_Book;
import com.zzd.service.ZZD_1813004745_BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/books")
public class ZZD_18130047_BookController {
	// 注入书籍服务类
	@Autowired
	private ZZD_1813004745_BookService bookService;

	// 按id查询显示结果, 展示用户详情 ,展示结果 Json格式
	// URL地址： http://localhost:80/books/detailsForJson?id=1
	@RequestMapping("/detailsForJson")
	public ModelAndView detailsForJson(Integer id) {
		// 访问模型层得到数据
		ZZD_1813004745_Book book = bookService.getBook(id);
		// 模型和视图
		ModelAndView mv = new ModelAndView();
		// 生成JSON视图
		MappingJackson2JsonView jsonView = new MappingJackson2JsonView();
		mv.setView(jsonView);
		// 加入模型
		mv.addObject("book", book);
		return mv;
	}

	// 按id查询显示结果, 展示用户详情，展示结果 jsp视图
	// URL地址： http://localhost:80/books/details?id=2
	@RequestMapping("/details")
	public ModelAndView details(Integer id) {
		// 访问模型层得到数据
		ZZD_1813004745_Book book = bookService.getBook(id);
		// 模型和视图
		ModelAndView mv = new ModelAndView();
		// 定义模型视图
		// 视图路径：application.property文件中设置 spring.mvc.view.prefix=
		// 视图名称: details.jsp
		mv.setViewName("book/details");
		// 加入数据模型
		mv.addObject("book", book);
		// 返回模型和视图

		return mv;
	}

	// 4. 传递JSON

	/**
	 * 打开请求页面
	 *
	 * @return 字符串，指向页面
	 */
	@GetMapping("/add")
	public String add() {
		return "book/add";
	}

	/**
	 * 新增用户
	 *
	 * @param book 通过@RequestBody注解得到JSON参数
	 * @return 回填id后的用户信息
	 */
	@PostMapping("/insert")
	@ResponseBody
	public ZZD_1813004745_Book insert(@RequestBody ZZD_1813004745_Book book) {
		bookService.insertBook(book);
		return book;
	}

	/*
	 * 查询多书籍数据 jsp显示
	 */
	@RequestMapping("/details1")
	public ModelAndView findAllBooks() {
		List<ZZD_1813004745_Book> books = new ArrayList<ZZD_1813004745_Book>();
		books = bookService.findAllBook();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("book/details1");
		mv.addObject("books1", books);
		System.out.println(books.get(0).getCover());
		return mv;
	}
	@RequestMapping("/table")
	public ModelAndView table() {
		List<ZZD_1813004745_Book > books=bookService.findAllBook();
		ModelAndView mv=new ModelAndView();
		mv.setViewName("book/table");
		mv.addObject("bookList",books);
		return mv;
	}
	// 5.通过URL传递参数
	@RequestMapping("/{id}")
	// 响应为JSON数据集
	@ResponseBody
	// @PathVariable 通过参数名称获取参数
	public ZZD_1813004745_Book getUser(@PathVariable("id") Integer id) {
		return bookService.getBook(id);
	}
}
