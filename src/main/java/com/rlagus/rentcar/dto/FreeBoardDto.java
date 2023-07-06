package com.rlagus.rentcar.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FreeBoardDto {

	private int rfbnum;
	private String rid;
	private String rfbtitle;
	private String rfbcontent;
	private String rfbdate;
	private int rfbhit;
	private int rfbreplycount;
	
}
