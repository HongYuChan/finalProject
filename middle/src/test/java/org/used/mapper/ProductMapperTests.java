package org.used.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.used.domain.ProductVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductMapperTests {

	@Setter(onMethod_=@Autowired)
	private ProductMapper mapper;
	
//	@Test
//	public void testGetList(){
//		mapper.getList().forEach(product -> log.info(product));
//	}
	
//	@Test
//	public void testInsert(){
//		ProductVO product = new ProductVO();
//		product.setUser_id(1);
//		product.setCategory_id(1);
//		product.setProduct_name("테스트상품");
//		product.setTitle("팔아여");
//		product.setProduct_info("새삥");
//		product.setPrice(10000);
//		
//		mapper.insert(product);
//		
//		log.info(product);
//	}

//	@Test
//	public void testInsertSelectKey(){
//		ProductVO product = new ProductVO();
//		product.setUser_id(1);
//		product.setCategory_id(1);
//		product.setProduct_name("테스트상품");
//		product.setTitle("팔아여");
//		product.setProduct_info("새삥2s");
//		product.setPrice(10000);
//		
//		mapper.insertSelectKey(product);
//		
//		log.info(product);
//	}

//	@Test
//	public void testRead(){
//		ProductVO product = mapper.read(2L);
//		
//		log.info(product);
//	}
	
//	@Test
//	public void testDelete(){
//		log.info("DELETE Count: " + mapper.delete(2L));
//	}
	
//	@Test
//	public void testUpdate(){
//		ProductVO product = new ProductVO();
//		product.setCategory_id(1);
//		product.setProduct_name("수정상품");
//		product.setTitle("수정 팔아요");
//		product.setProduct_info("변경된 내요ㅛㅇ");
//		product.setPrice(5000);
//		
//		log.info("UPDATE COUNT: " + mapper.update(product));
//	}
	
	
}
