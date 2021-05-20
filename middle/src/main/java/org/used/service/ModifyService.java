package org.used.service;

import org.used.domain.MemberVO;

public interface ModifyService {
	
	public MemberVO get(int user_id);
	
	public boolean modify(MemberVO member);

	public boolean remove(int user_id);
}
