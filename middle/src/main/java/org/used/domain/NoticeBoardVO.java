package org.used.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeBoardVO {
	private Long notice_id;
	private Long manager_id;
	private String notice_title;
	private String notice_contents;
	private String notice_writer;
	private Date notice_date;
}
