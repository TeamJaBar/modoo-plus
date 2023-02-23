package com.sping.biz.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO productDAO;

	@Override
	public boolean insert(ProductVO pvo) {
		return productDAO.insert(pvo);
	}

	@Override
	public CategoryVO selectOneCate(ProductVO pvo) {
		return productDAO.selectOneCate(pvo);
	}

	@Override
	public ProductVO selectOne(ProductVO pvo) {
		return productDAO.selectOne(pvo);
	}

	@Override
	public ProductVO selectOneCart(ProductVO pvo) {
		return productDAO.selectOneCart(pvo);
	}

	@Override
	public List<ProductVO> selectAll(ProductVO pvo) {
		return productDAO.selectAll(pvo);
	}

	@Override
	public List<CategoryVO> selectAll(CategoryVO cvo) {
		return productDAO.selectAll(cvo);
	}

	@Override
	public List<CategoryVO> selectAllCateNum(CategoryVO cvo) {
		return productDAO.selectAll(cvo);
	}

	@Override
	public List<ProductVO> selectAllSearch(ProductVO pvo) {
		return productDAO.selectAllSearch(pvo);
	}

	@Override
	public List<ProductVO> selectAllFilter(ProductVO pvo) {
		return productDAO.selectAllFilter(pvo);
	}

	@Override
	public boolean update(ProductVO pvo) {
		return productDAO.update(pvo);
	}

	@Override
	public boolean delete(ProductVO pvo) {
		return productDAO.delete(pvo);
	}
}
