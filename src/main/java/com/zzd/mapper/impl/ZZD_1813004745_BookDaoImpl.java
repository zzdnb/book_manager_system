package com.zzd.mapper.impl;

import com.zzd.entity.ZZD_1813004745_Book;
import com.zzd.mapper.ZZD_1813004745_BookDao;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Repository
public class ZZD_1813004745_BookDaoImpl implements ZZD_1813004745_BookDao {
	private List<ZZD_1813004745_Book> books = new ArrayList<ZZD_1813004745_Book>();

	public ZZD_1813004745_BookDaoImpl() {
		super();
		books.add(new ZZD_1813004745_Book(1, "红楼梦", 20.0, "http://localhost/images/20201112163624543.jpg"));
		books.add(new ZZD_1813004745_Book(2, "ChengLongdeshu", 90.6, null));
		books.add(new ZZD_1813004745_Book(3, "西游记", 20.2, null));
	}


	@Override
	public ZZD_1813004745_Book getBook(Integer id) {
		for (ZZD_1813004745_Book book : books) {
			if (book.getId().equals(id)) {
				return book;
			}
		}
		return null;
	}

	@Override
	public Boolean insertBook(ZZD_1813004745_Book book) {
		Boolean flag = false;
		System.out.println(book.getName() + ">>" + book.getPrice());
		books.add(book);
		flag = true;
		return flag;
	}

	@Override
	public List<ZZD_1813004745_Book> findAllBooks() {
		return books;
	}


	public boolean addCoverById(Integer id, String path) {
		for (ZZD_1813004745_Book b : books) {
			if (b.getId().equals(id)) {
				b.setCover(path);
			}
		}
		return true;
	}
}
