package com.rlagus.rentcar.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FreereplyDto {
	
	private int rfrnum;
	private int rfbnum;
	private String rid;
	private String rfrcontent;
	private String rfrbdate;
	
}
