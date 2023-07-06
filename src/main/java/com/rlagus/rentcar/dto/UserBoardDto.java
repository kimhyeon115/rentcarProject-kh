package com.rlagus.rentcar.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserBoardDto {

	private int rbnum;
	private String rid;
	private String rbtitle;
	private String rbcontent;
	private String rbdate;
	private int rbhit;
	private int rbreplycount;
	
}
