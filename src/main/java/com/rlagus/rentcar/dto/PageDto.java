package com.rlagus.rentcar.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PageDto {
	
	private int startPage; // 현재 화면에서 보여질 시작 페이지 번호
	private int endPage; // 현재 화면에서 보여질 마지막 페이지 번호
	private boolean prev; // 더 이하 페이지가 있는지여부
	private boolean next; // 더 이상 페이지가 있는지여부
	private int total; // 전체 글의 수
	
	private Criteria criteria;
	
	public PageDto(Criteria criteria, int total) {
		 this.criteria = criteria;
		 this.total = total;
		 
		 this.endPage = (int) (Math.ceil(criteria.getPageNum()/(criteria.getAmount()*1.0))*criteria.getAmount()); //ceil -> 올림
		 //53개의 글이 존재
		 //    	1 2 3 4 5  next
		 // prev 6 7 8 9 10 next
		 // prev 11
		 this.startPage = this.endPage - (criteria.getAmount()-1);
		 
		 int realEndPage = (int) Math.ceil(total*1.0 / criteria.getAmount()); // 전체 페이지 개수 (전체 글의 수 / 한페이지당 봅여줄 글의 개수 )= 올림한값 - 실제 끝페이지
		 
		 if(realEndPage < this.endPage) {
			 this.endPage = realEndPage;
		 }// 처음계산한 마지막 페이지의 값인 end 값보다 realEndPage 값이 작게 나오면  그 값으로 대신해야 마지막 페이지 값이 마지막페이지 번호로 출력됨
		 
		 this.prev = this.startPage > criteria.getAmount();
		 // 시작페이지 번호가 5보다 크면 prev 가 존재해야함
		 this.next = this.endPage < realEndPage; ;
		 // 마지막 페이지 번호가 실제 페이지 번호보다 작은 경우에만 next가 존재해야 함
	}
	
	
}
