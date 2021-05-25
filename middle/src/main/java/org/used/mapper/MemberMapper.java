package org.used.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.used.domain.MemberVO;
import org.used.domain.UserImageVO;

public interface MemberMapper {
	//@Select("select * from member where user_id > 0")
	public List<MemberVO> getList();
	
	public MemberVO read(int user_id);
	
	public int delete(int user_id);
	
	public int update(MemberVO member);
	
	public UserImageVO readImg(int user_id);
	
	public int update(UserImageVO userImageVO);
}
