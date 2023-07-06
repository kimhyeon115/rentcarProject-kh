package com.rlagus.rentcar.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReservationDto {
	
	private int rtnum;
	private String rid;
	private int cindex;
	private String rvdate;
	private String rtdate;
	private String returndate;
	private String rpdate;
	private long rtprice;
	
	private CarDto carDto;
}
