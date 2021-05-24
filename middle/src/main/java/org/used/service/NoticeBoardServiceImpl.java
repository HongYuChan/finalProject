package org.used.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.used.domain.Criteria;
import org.used.domain.NoticeBoardVO;
import org.used.mapper.NoticeBoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class NoticeBoardServiceImpl implements NoticeBoardService {

	@Setter(onMethod_ = @Autowired)
	private NoticeBoardMapper mapper;
	
	
	@Override
	public void register(NoticeBoardVO noticeBoard) {

		log.info("regiser.." + noticeBoard);
		
		mapper.insertSelectKey(noticeBoard);	
	}

//	@Override
//	public List<NoticeBoardVO> getList() {
//
//		log.info("getList");
//		return mapper.getList();
//	}
	@Override
	public List<NoticeBoardVO> getList(Criteria cri) {
		
		log.info("getList with criteria: " + cri);
		return mapper.getListWithPaging(cri);
	}


	@Override
	public NoticeBoardVO get(Long notice_id) {
		
		log.info("get...." + notice_id);
		return mapper.read(notice_id);
	}


	@Override
	public boolean modify(NoticeBoardVO noticeBoard) {
		
		log.info("modify......." + noticeBoard);
		return mapper.update(noticeBoard) == 1;
	}


	@Override
	public boolean remove(Long notice_id) {

		log.info("remove...." + notice_id);
		return mapper.delete(notice_id) == 1;
	}



}
