package com.rlagus.rentcar.controller;

import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rlagus.rentcar.dao.IDao;
import com.rlagus.rentcar.dto.CarCriteria;
import com.rlagus.rentcar.dto.CarPageDto;
import com.rlagus.rentcar.dto.ReservationDto;

@Controller
public class AdminController {
	
	@Autowired
	private SqlSession sqlsession;

	@RequestMapping(value = "/situation_form")
	public String situation(Model model, HttpServletRequest request, CarCriteria carCriteria) {
		
		int pageNum;
		if(request.getParameter("pageNum") == null) {
			pageNum = 1;
		}else {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			carCriteria.setPageNum(pageNum);
		}
		
		IDao dao = sqlsession.getMapper(IDao.class);
		int totalCount = dao.AdminReservationCountDao();
		CarPageDto carPageDto = new CarPageDto(carCriteria, totalCount);
		Vector<ReservationDto> dtos = dao.AdminReservationListDao(carCriteria.getAmount(), pageNum);
		model.addAttribute("dtos", dtos);
		model.addAttribute("pageMaker", carPageDto);
		model.addAttribute("currPage", pageNum);
		model.addAttribute("totalCount",totalCount);
		
		return "situation";
	}
	
	@RequestMapping(value = "/admincarReservationCheck_form")
	public String admincarReservationCheck(Model model, HttpServletRequest request) {

		int rtnum = Integer.parseInt(request.getParameter("rtnum"));
		int cindex = Integer.parseInt(request.getParameter("cindex"));
		IDao dao = sqlsession.getMapper(IDao.class);
		Vector<ReservationDto> dtos = dao.AdminReservationIndexDao(rtnum,cindex);
		model.addAttribute("dtos", dtos);
		model.addAttribute("rtnum", rtnum);
		model.addAttribute("cindex", cindex);
		model.addAttribute("page", 1);
		
		return "admincarReservationCheck";
	}
	
	@RequestMapping(value = "/admincarReservationCheck2_form")
	public String admincarReservationCheck2(Model model, HttpServletRequest request) {

		int cindex = Integer.parseInt(request.getParameter("cindex"));
		IDao dao = sqlsession.getMapper(IDao.class);
		Vector<ReservationDto> dtos = dao.AdminIndexCarListDao(cindex);
		int count = dao.CountIndexReservationDao(cindex);
		if(count == 0) {			
			model.addAttribute("messeage", "해당 차량의 예약이력이 없습니다");
			return "admincarReservationCheck";
		}
		
		model.addAttribute("dtos",dtos);
		model.addAttribute("cindex", cindex);
		model.addAttribute("page", 2);
		
		return "admincarReservationCheck";
	}
}
