package com.spring.biz.member;

import java.util.List;

public interface OrderService {

	public boolean insert(OrderVO ovo);
	
	public boolean insert(OrderDetail odvo);

	public OrderVO selectOne(OrderVO ovo);

	public List<OrderVO> selectAll_ADMIN(OrderVO ovo);

	public List<OrderVO> selectAll_SALES(OrderVO ovo);

	public List<OrderVO> selectAll(OrderVO ovo);

	public boolean update(OrderVO ovo);
	
}
