package org.used.service;

import org.used.domain.MemberVO;
import org.used.domain.UserImageVO;

public interface UserMainService {
	
	public MemberVO member(int user_id);
	
	public UserImageVO member_img(int user_id);
}
