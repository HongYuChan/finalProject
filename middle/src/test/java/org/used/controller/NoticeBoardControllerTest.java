package org.used.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.used.mapper.NoticeBoardMapperTests;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
										"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
@WebAppConfiguration//Test for Controller
public class NoticeBoardControllerTest {

	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup(){
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
//	@Test
//	public void testList() throws Exception{
//		
//		log.info(
//				mockMvc.perform(MockMvcRequestBuilders.get("/noticeBoard/list"))
//				.andReturn()
//				.getModelAndView()
//				.getModelMap());
//	}
	
//	@Test
//	public void testRegister()throws Exception{
//		
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/noticeBoard/register")
//				.param("notice_title", "컨트롤러 테스트 제목")
//				.param("notice_contents", "컨트롤러 테스츠 컨텐츠")
//				.param("notice_writer", "user00")
//				).andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//	}
	
//	@Test
//	public void testGet()throws Exception{
//		
//		log.info(mockMvc.perform(MockMvcRequestBuilders
//				.get("/noticeBoard/get")
//				.param("notice_id", "61"))
//					.andReturn()
//					.getModelAndView()
//					.getModelMap());
//	}
	
//	@Test
//	public void testModify() throws Exception{
//		
//		String resultPage = mockMvc
//				.perform(MockMvcRequestBuilders.post("/noticeBoard/modify")
//						.param("notice_id", "62")
//						.param("notice_title", "수정된 테스트 제목")
//						.param("notice_contents", "수정된 테스트 내용")
//						.param("notice_writer", "user00"))
//				.andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//	}
	
//	@Test
//	public void testRemove()throws Exception{
//		
//		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/noticeBoard/remove")
//				.param("notice_id", "27")
//				).andReturn().getModelAndView().getViewName();
//		
//		log.info(resultPage);
//	}
	
	@Test
	public void testListPaging() throws Exception {
		
		log.info(mockMvc.perform(
				MockMvcRequestBuilders.get("/noticeBoard/list")
				.param("pageNum", "2")
				.param("amount", "50"))
				.andReturn().getModelAndView().getModelMap());
	}
	
	
	
}
