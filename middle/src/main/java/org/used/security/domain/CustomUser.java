package org.used.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.used.domain.MemberVO;

import lombok.Getter;

@Getter
public class CustomUser extends User{
		private static final long serialVersionUID = 1L;
		
		private MemberVO member;
		
		public CustomUser(String id, String password, Collection<? extends GrantedAuthority> authorities){
			super(id, password, authorities);
		}
		
		public CustomUser(MemberVO vo){
			
			super(vo.getId(), vo.getPassword(), vo.getAuthList().stream()
					.map(auth -> new SimpleGrantedAuthority(auth.getAuth()))
					.collect(Collectors.toList()));
			
			this.member = vo;
		}
	
}
