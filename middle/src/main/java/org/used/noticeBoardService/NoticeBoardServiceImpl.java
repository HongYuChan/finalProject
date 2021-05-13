package org.used.noticeBoardService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.used.boardDomain.NoticeBoardVO;
import org.used.noticeBoardMapper.NoticeBoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {

	@Setter(onMethod_ = @Autowired)
	private NoticeBoardMapper mapper;
	
	
	@Override
	public void register(NoticeBoardVO noticeBoard) {

		log.info("regiser.." + noticeBoard);
		
		mapper.insertSelectKey(noticeBoard);	
	}

	@Override
	public NoticeBoardVO get(Long bno) {
		// TODO Auto-gene      rated method stub
		return null;
	}

	@Override
	public boolean modify(NoticeBoardVO noticeBoard) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(Long bno) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<NoticeBoardVO> getList() {
		// TODO Auto-generated method stub
		return null;
	}

}
