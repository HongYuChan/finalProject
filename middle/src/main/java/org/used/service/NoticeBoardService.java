package org.used.service;

import java.util.List;

import org.used.domain.NoticeBoardVO;

public interface NoticeBoardService {

	public void register(NoticeBoardVO noticeBoard);
	
	public NoticeBoardVO get(Long notice_id);
	
	public boolean modify(NoticeBoardVO noticeBoard);
	
	public boolean remove(Long notice_id);
	
	public List<NoticeBoardVO> getList();
	
//	public int getTotal(Criteria cri);
	
}
