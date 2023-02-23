package com.spring.biz.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("addressService")
public class AddressServiceImpl implements AddressService {
	
	@Autowired
	private AddressDAO addressDAO;

	@Override
	public boolean insert(AddressVO avo) {
		return addressDAO.insert(avo);
	}

	@Override
	public AddressVO selectOne(AddressVO avo) {
		return addressDAO.selectOne(avo);
	}

	@Override
	public List<AddressVO> selectAll(AddressVO avo) {
		return addressDAO.selectAll(avo);
	}

	@Override
	public boolean update(AddressVO avo) {
		return addressDAO.update(avo);
	}

	@Override
	public boolean delete(AddressVO avo) {
		return addressDAO.delete(avo);
	}
}
