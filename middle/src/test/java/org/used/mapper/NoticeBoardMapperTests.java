package org.used.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.used.domain.NoticeBoardVO;
import org.used.mapper.NoticeBoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeBoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private NoticeBoardMapper noticeMapper;
	
//	@Test
//	public void testGetList(){
//		
//		log.info("----------------");
//		noticeMapper.getList();
//	}
	
//	@Test
//	public void testInsert(){
//		
//		NoticeBoardVO vo = new NoticeBoardVO();
//		vo.setNotice_title("testTitle");
//		vo.setNotice_contents("testContents");
//		vo.setNotice_writer("tester");
//		
//		noticeMapper.insert(vo);
//		log.info("-----------------------");
//		log.info("after insert selectkey" + vo);
//	}

//	@Test
//	public void testInsertSelectKey(){
//		
//		NoticeBoardVO vo = new NoticeBoardVO();
//		vo.setNotice_title("testTitleSelectKey");
//		vo.setNotice_contents("testContentsSelectKey");
//		vo.setNotice_writer("testerSelectKey");
//		
//		noticeMapper.insertSelectKey(vo);
//		log.info("-----------------------");
//		log.info("after insert selectkey" + vo);
//	}

//	@Test
//	public void testRead(){
//		
//		NoticeBoardVO vo = noticeMapper.read(46L);
//	
//		log.info("-----------------");
//		log.info(vo);
//	}
	
//	@Test
//	public void testDelete(){
//		
//		log.info("--------------------");
//		log.info("delete vount: " + noticeMapper.delete(33L));
//	}

	@Test
	public void testUpdate(){
		
		NoticeBoardVO vo = new NoticeBoardVO();
		vo.setNotice_id(1L);
		vo.setNotice_title("updateTitleㅋ");
		vo.setNotice_contents("updateContentsㅋ");
		
		int count = noticeMapper.update(vo);
		
		log.info("UPDATE COUNT: " + count);
	}
	

	
	
	
	
	
	
}
