package org.used.mapper;

import org.used.domain.MemberVO;

public interface MemberMapper {
	public MemberVO read(String id);
	public void create(MemberVO vo);
	public int idCheck(MemberVO vo);
	public String userIdSearch(MemberVO vo);
}
