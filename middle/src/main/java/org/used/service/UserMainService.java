package org.used.service;

import java.util.List;

import org.used.domain.MemberVO;
import org.used.domain.ProductVO;
import org.used.domain.UserImageVO;
import org.used.domain.WishListVO;

public interface UserMainService {
	
	public MemberVO member(int user_id);
	
	public UserImageVO member_img(int user_id);
	
}
