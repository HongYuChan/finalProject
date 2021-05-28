package org.used.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.used.domain.MemberVO;
import org.used.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class MemberServiceImp implements MemberService {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;

	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder pwencoder;

	@Override
	public void memberJoin(MemberVO vo) {
		try {
			memberMapper.create(vo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int idCheck(MemberVO vo) {
		int result = memberMapper.idCheck(vo);
		return result;
	}

	@Override
	public void passwordCheck(MemberVO vo) throws Exception {
		try {
			String DBpassword = pwencoder.encode(vo.getPassword());
			vo.setPassword(DBpassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public String userIdSearch(MemberVO vo) throws Exception {
		String result = memberMapper.userIdSearch(vo);
		return result;
	}

}
