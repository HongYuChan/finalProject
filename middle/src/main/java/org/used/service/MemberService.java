package org.used.service;

import org.used.domain.MemberVO;

public interface MemberService {

	public void memberJoin(MemberVO vo) throws Exception;
	public int idCheck(MemberVO vo) throws Exception;
	public void passwordCheck(MemberVO vo)throws Exception;
	public String userIdSearch(MemberVO vo)throws Exception;
}
