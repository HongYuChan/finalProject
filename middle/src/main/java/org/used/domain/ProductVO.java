package org.used.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductVO {

	private Long product_id;
	private int user_id;
	private int category_id;
	private String product_name;
	private String title;
	private String product_info;
	private int price;
	private Date create_date;
	private boolean status;
	private int buyer_id;
	private Date sale_date;
	private String image;
	
}
