package org.used.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.used.domain.MemberVO;
import org.used.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Service
@Log4j
@AllArgsConstructor
public class ModifyServiceImpl implements ModifyService {

	@Setter(onMethod_=@Autowired)
	private MemberMapper mapper;
	
	@Override
	public MemberVO get(int user_id) {
		return mapper.mypageRead(user_id);
	}

	@Override
	public boolean modify(MemberVO member) {
		return mapper.update(member) == 1;
	}

	@Override
	public boolean remove(int user_id) {
		return mapper.delete(user_id) == 1;
	}

}
