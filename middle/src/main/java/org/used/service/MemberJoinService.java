package org.used.service;

import org.used.domain.MemberVO;

public interface MemberJoinService {

	public void memberJoin(MemberVO vo) throws Exception;
	public int idCheck(MemberVO vo) throws Exception;
	public void passwordCheck(MemberVO vo)throws Exception;
	public int loginIdPasswordCheck(MemberVO vo)throws Exception;
}
