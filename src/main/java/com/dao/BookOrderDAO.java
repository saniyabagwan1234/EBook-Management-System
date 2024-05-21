package com.dao;

import java.util.List;

import com.entity.Book_Order;

public interface BookOrderDAO {

	 public boolean saveOrder(List<Book_Order> b);

	public int getOrderNo();

	 public List<Book_Order> getBook(String email);
	 
	 public List<Book_Order> getAllOrder();
	
}
