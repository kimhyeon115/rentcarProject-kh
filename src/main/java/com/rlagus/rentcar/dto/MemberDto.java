package com.rlagus.rentcar.dto;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDto {
	private String rid;
	private String rpw;
	private String rname;
	private String rmobile;
	private String remail;
	private String rdate;
	
	
}
