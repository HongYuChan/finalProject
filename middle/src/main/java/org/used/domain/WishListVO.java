package org.used.domain;

import java.util.Date;

import lombok.Data;

@Data
public class WishListVO {
	private int wish_id;
	private int product_id;
	private int user_id;
	private Date wish_date;
}
