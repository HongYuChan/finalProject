package org.used.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
						"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class ModifyControllerTests {
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup(){
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
//	@Test
//	public void test(){
//		log.info("�뀒�뒪�듃");
//	}
	
	@Test
	public void testModify() throws Exception{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders 
				.post("/mypage/modify")
				.param("user_id", "6")
				.param("password", "1234")
				.param("nickname", "dochi")
				.param("email", "zxc@naver.com"))
				.andReturn()
				.getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
//	@Test
//	public void testRemove() throws Exception{
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders
//				.post("/mypage/remove")
//				.param("user_id", "5"))
//				.andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//				
//	}
}
