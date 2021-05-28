package org.used.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.used.domain.MemberVO;
import org.used.domain.ProductVO;
import org.used.domain.UserImageVO;
import org.used.domain.WishListVO;
import org.used.mapper.MemberMapper;
import org.used.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j
@Service
@AllArgsConstructor
public class UserMainServiceImpl implements UserMainService {

	@Setter(onMethod_=@Autowired)
	private MemberMapper user_mapper;
	
	@Override
	public MemberVO member(int user_id) {
		
		log.info("get......"+user_id);
		
		return user_mapper.mypageRead(user_id);
	}
	
	@Override
	public UserImageVO member_img(int user_id){
		return user_mapper.readImg(user_id);
	}
	
}
