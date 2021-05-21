package org.used.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
	private int product_id;
	private int user_id;
	private int category_id;
	private String product_name;
	private String title;
	private Date create_date;
	private char status;
	private int buyer_id;
	private int price;
}
