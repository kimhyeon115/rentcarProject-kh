package com.rlagus.rentcar.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Vector;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.style.DefaultToStringStyler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rlagus.rentcar.dao.IDao;
import com.rlagus.rentcar.dto.CarDto;
import com.rlagus.rentcar.dto.ReservationDto;

@Controller
public class CarController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/carListSearch")
	public String catTotalList (Model model, HttpServletRequest request) {
		String searchOption	= "";
		String rtdate = request.getParameter("rtdate");
		String returndate = request.getParameter("returndate");
		String param = request.getParameter("param");
		
		if(param == null) {
			param = "";
		}
		
		if(param.equals("")) {
			searchOption = request.getParameter("searchOption");
		}else {
			searchOption = param;
		}
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		if(searchOption.equals("allcar")) {
			List<CarDto> dtos = dao.carListTotalDao(rtdate, returndate);
			int count = dao.carListTotalDao(rtdate, returndate).size();
			model.addAttribute("dtos", dtos);
			model.addAttribute("count", count);
		}else {
			List<CarDto> dtos = dao.carListClassDao(rtdate, returndate, searchOption);
			int count = dao.carListClassDao(rtdate, returndate, searchOption).size();
			model.addAttribute("dtos", dtos);
			model.addAttribute("count", count);
		}
			model.addAttribute("returndate", returndate);
			model.addAttribute("rtdate", rtdate);
			model.addAttribute("searchOption", searchOption);
		
		return"carList";
	}
	@RequestMapping(value = "/carReservation")
	public String carReservation (Model model, HttpServletRequest request) {
		
		String cindex = request.getParameter("cindex");
		String rtdate = request.getParameter("rtdate");
		String returndate = request.getParameter("returndate");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		CarDto dto = dao.carinfoDao(cindex);
		
		model.addAttribute("dto", dto);
		model.addAttribute("rtdate",rtdate );
		model.addAttribute("returndate", returndate);
		
		return"carReservation";
	}
	@RequestMapping(value = "/carReservationOk")
	public String carReservationOk (Model model, HttpServletRequest request) throws ParseException{
		
		String rid = request.getParameter("rid");
		int rtPrice = Integer.parseInt(request.getParameter("rtPrice"));
		String cindex = request.getParameter("cindex");
		String rtdate = request.getParameter("rtdate");
		String returndate = request.getParameter("returndate");
		
		Date formatRtdate = new SimpleDateFormat("yyyy-MM-dd").parse(rtdate);
		Date formatReturnDate = new SimpleDateFormat("yyyy-MM-dd").parse(returndate);
		
		long diffdays = ((formatReturnDate.getTime()-formatRtdate.getTime()) / 1000 )/ (24*60*60);
		int totalPrice = rtPrice * (int)diffdays;
		String rpdate = rtdate+"~"+returndate;
		
		IDao dao = sqlSession.getMapper(IDao.class);		
		dao.carRentDao(rid, cindex, rtdate, returndate, rpdate, totalPrice);		
		
		model.addAttribute("rid", rid);
		model.addAttribute("totalPrice", totalPrice);
		
		return "carReservationBefore";
	}
	@RequestMapping(value = "/carReservationCheck")
	public String carReservationCheck(HttpSession session, Model model) {
		
		if((String)session.getAttribute("sessionId") == null) {
			return "carReservationCheck";
		}
		IDao dao = sqlSession.getMapper(IDao.class);
		String rid = (String)session.getAttribute("sessionId");
		
		int found = dao.OneMemberRentDateDao(rid);
		if(found == 0) {
			model.addAttribute("found", 0);
			model.addAttribute("message", "예약한 이력이 없습니다.");
			return "carReservationCheck";
		}		
		
		List<ReservationDto> dtos =  dao.carRentViewDao(rid);
		
		model.addAttribute("dtos", dtos);
		
		return "carReservationCheck";
	}

	@RequestMapping(value = "/carReservationBefore")
	public String carReservationBefore(HttpServletRequest request, Model model) {
	
		return "carReservationCheck";
	}
	
	@RequestMapping(value = "/reservationdelete")
	public String reservationdelete(HttpServletRequest request, Model model, HttpSession session) {
		
		String rtnum = request.getParameter("rtnum");
		IDao dao = sqlSession.getMapper(IDao.class);
		ReservationDto dtos = dao.carRentIndexViewDao(rtnum);
		model.addAttribute("dtos", dtos);		
		dao.reservationdeleteDao(rtnum);

		return "carReservationDeleteOk";
	}
}
