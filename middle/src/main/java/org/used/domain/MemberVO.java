package org.used.domain;

import lombok.Data;

@Data
public class MemberVO {
	private int user_id;
	private String id;
	private String password;
	private String nickname;
	private String email;
	private String phone_number;
	private String address;
	private String name;
	private int evaluation;
}
