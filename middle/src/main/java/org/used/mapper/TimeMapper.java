package org.used.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {
	
	//어노테이션으로 sql처리하기
	@Select("SELECT sysdate FROM dual")
	public String getTime();
	
	//xml 방식으로 sql처리하기
	public String getTime2();
	
}
