package org.used.mapper;


import java.util.List;

import org.used.domain.NoticeBoardVO;

public interface NoticeBoardMapper {
	
//	@Select("select * from notice where notice_id > 0 order by notice_id desc")
	public List<NoticeBoardVO> getList();
	
	public void insert(NoticeBoardVO noticeBoard);

	public void insertSelectKey(NoticeBoardVO noticeBoard);
	
	public NoticeBoardVO read(Long notice_id);
	
	public int delete(Long notice_id);
	
	public int update(NoticeBoardVO noticeBoard);

	
//	public List<NoticeBoardVO> getListWithPaging(Criteria cri);

//	public int getTotalCount(Criteria cri);
	
	
	
}
