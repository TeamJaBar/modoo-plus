package com.sping.biz.product;

import java.util.ArrayList;
import java.util.List;

public interface ProductService {
	
	public boolean insert(ProductVO pvo);

	public CategoryVO selectOneCate(ProductVO pvo);

	public ProductVO selectOne(ProductVO pvo);

	public ProductVO selectOneCart(ProductVO pvo);

	public List<ProductVO> selectAll(ProductVO pvo);

	public List<CategoryVO> selectAll(CategoryVO cvo);

	public List<CategoryVO> selectAllCateNum(CategoryVO cvo);

	public List<ProductVO> selectAllSearch(ProductVO pvo);

	public List<ProductVO> selectAllFilter(ProductVO pvo);

	public boolean update(ProductVO pvo);

	public boolean delete(ProductVO pvo);

}
