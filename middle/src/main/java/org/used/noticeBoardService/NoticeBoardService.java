package org.used.noticeBoardService;

import java.util.List;

import org.used.boardDomain.NoticeBoardVO;

public interface NoticeBoardService {

	public void register(NoticeBoardVO noticeBoard);
	
	public NoticeBoardVO get(Long bno);
	
	public boolean modify(NoticeBoardVO noticeBoard);
	
	public boolean remove(Long bno);
	
	public List<NoticeBoardVO> getList();
	
//	public int getTotal(Criteria cri);
	
}
