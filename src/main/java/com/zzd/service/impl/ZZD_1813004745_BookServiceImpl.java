package com.zzd.service.impl;
import com.zzd.entity.ZZD_1813004745_Book;
import com.zzd.mapper.ZZD_1813004745_BookDao;
import com.zzd.service.ZZD_1813004745_BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ZZD_1813004745_BookServiceImpl implements ZZD_1813004745_BookService {

	@Autowired
	private ZZD_1813004745_BookDao bookDao;
	@Override
	public ZZD_1813004745_Book getBook(Integer id) {
		return bookDao.getBook(id);
	}

	@Override
	public Boolean insertBook(ZZD_1813004745_Book book) {
		return bookDao.insertBook(book);
	}

	@Override
	public List<ZZD_1813004745_Book> findAllBook() {
		return bookDao.findAllBooks();
	}

	@Override
	public boolean addCoverById(Integer id, String path) {
		return bookDao.addCoverById(id,path);
	}

}
