package org.used.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.used.domain.ProductVO;
import org.used.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class ProductServiceImpl implements ProductService {

	private ProductMapper mapper;
	
	@Override
	public void register(ProductVO product) {
		log.info("register..........................." + product);
		
		mapper.insertSelectKey(product);
	}

	@Override
	public ProductVO get(Long product_id) {
		
		log.info("get............................." + product_id);
		
		return mapper.read(product_id);
	}

	@Override
	public Boolean modify(ProductVO product) {
		
		log.info("modify........................." + product);
		
		return mapper.update(product) == 1;
	}

	@Override
	public Boolean remove(Long product_id) {
		
		log.info("remove.........................." + product_id);
		
		return mapper.delete(product_id) == 1;
	}

	@Override
	public List<ProductVO> getList() {
		
		log.info("getList..........................................");
		
		return mapper.getList();
	}

}
