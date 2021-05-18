package org.used.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.used.domain.ProductVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProductServiceTests {

	@Setter(onMethod_={@Autowired})
	private ProductService service;
	
//	@Test
//	public void testExist(){
//		log.info(service);
//		assertNotNull(service);
//	}
	
//	@Test
//	public void testRegister(){
//		ProductVO product = new ProductVO();
//		product.setUser_id(2);
//		product.setCategory_id(3);
//		product.setProduct_name("서비스등록상품");
//		product.setTitle("서비스 팔아요");
//		product.setProduct_info("서비스로 등록한 판매물품");
//		product.setPrice(30000);
//		
//		service.register(product);
//		
//		log.info("생성된 게시물번호: " + product.getProduct_id());
//	}
	
//	@Test
//	public void testGetList(){
//		service.getList().forEach(product -> log.info(product));
//	}

//	@Test
//	public void testGet(){
//		service.get(2L);
//	}

//	@Test
//	public void testUpdate(){
//		ProductVO product = service.get(2L);
//		
//		if(product == null){
//			return;
//		}
//		
//		product.setTitle("제목수정");
//		log.info("MODIFY Result: " + service.modify(product));		
//	}
	
//	@Test
//	public void testDelete(){
//		log.info("REMOVE Result: " + service.remove(2L));
//	}
	
}













