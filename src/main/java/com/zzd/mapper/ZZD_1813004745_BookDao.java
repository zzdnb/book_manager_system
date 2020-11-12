package com.zzd.mapper;

import com.zzd.entity.ZZD_1813004745_Book;

import java.util.List;

public interface ZZD_1813004745_BookDao {
	public ZZD_1813004745_Book getBook(Integer id);
	public Boolean insertBook(ZZD_1813004745_Book book);
	public List<ZZD_1813004745_Book> findAllBooks();
	public boolean addCoverById(Integer id, String path);
}
