package org.used.service;

import java.util.List;

import org.used.domain.Criteria;
import org.used.domain.ProductVO;

public interface ProductService {

	public void register(ProductVO product);
	
	public ProductVO get(Long product_id);
	
	public Boolean modify(ProductVO product);
	
	public Boolean remove(Long product_id);
	
	public List<ProductVO> getList(Criteria cri);
	
}
