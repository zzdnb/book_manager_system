package com.zzd.service;


import com.zzd.entity.ZZD_1813004745_Book;

import java.util.List;


public interface ZZD_1813004745_BookService {
	public ZZD_1813004745_Book getBook(Integer id);
	public Boolean insertBook(ZZD_1813004745_Book Book);
	public List<ZZD_1813004745_Book> findAllBook();
	public boolean addCoverById(Integer id, String path);
}
