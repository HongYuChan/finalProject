package org.used.domain;

import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	private int user_id;
	private String id;
	private String password;
	private int enabled;
	
	private String nickname;
	private String email;
	private String phone_number;
	
	private String address;
	private int evaluation;
	private String name;
	private List<AuthVO> authList;
	
	

}
