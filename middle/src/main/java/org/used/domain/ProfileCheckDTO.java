package org.used.domain;

import lombok.Data;

@Data
public class ProfileCheckDTO {
	private String fileName;
	private String uploadFolder;
	private String uuid;
	private boolean image;
	
	private int user_id;
}
