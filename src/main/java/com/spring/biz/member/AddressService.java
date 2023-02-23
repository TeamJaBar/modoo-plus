package com.spring.biz.member;

import java.util.List;

public interface AddressService {
	public boolean insert(AddressVO avo);

	public AddressVO selectOne(AddressVO avo);

	public List<AddressVO> selectAll(AddressVO avo);

	public boolean update(AddressVO avo);

	public boolean delete(AddressVO avo);
}
