package com.rlagus.rentcar.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CarListDto {

	private int cindex;
	private String cbrend;
	private String cclass;
	private String cname;
	private String ccolor;
	private String coil;
	private String ctype;
	private int price;
	private String cimg;
	private String cnote;
	private String pdate;
}
