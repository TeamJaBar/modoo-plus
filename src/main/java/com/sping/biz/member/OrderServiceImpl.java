package com.sping.biz.member;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("orderService")
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderDAO orderDAO;

	@Override
	public boolean insert(OrderVO ovo) {
		return orderDAO.insert(ovo);
	}

	@Override
	public boolean insert(OrderDetail odvo) {
		return orderDAO.insert(odvo);
	}

	@Override
	public OrderVO selectOne(OrderVO ovo) {
		return orderDAO.selectOne(ovo);
	}

	@Override
	public List<OrderVO> selectAll_ADMIN(OrderVO ovo) {
		return orderDAO.selectAll_ADMIN(ovo);
	}

	@Override
	public List<OrderVO> selectAll_SALES(OrderVO ovo) {
		return orderDAO.selectAll_SALES(ovo);
	}

	@Override
	public List<OrderVO> selectAll(OrderVO ovo) {
		return orderDAO.selectAll(ovo);
	}

	@Override
	public boolean update(OrderVO ovo) {
		return orderDAO.update(ovo);
	}
}
