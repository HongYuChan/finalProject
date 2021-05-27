package org.used.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.used.domain.Criteria;
import org.used.domain.ProductVO;

public interface ProductMapper {

	public List<ProductVO> getList(Criteria cri);
	
	public void insert(ProductVO product);
	
	public void insertSelectKey(ProductVO product);
	
	public ProductVO read(Long product_id);
	
	public int delete(Long product_id);
	
	public int update(ProductVO product);
	
}
