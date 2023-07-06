package com.rlagus.rentcar.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserreplyDto {
	
	private int rrnum;
	private int rbnum;
	private String rid;
	private String rrcontent;
	private String rrbdate;
	
}
