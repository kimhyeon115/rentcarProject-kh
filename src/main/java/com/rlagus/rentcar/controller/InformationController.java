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
import com.rlagus.rentcar.dto.CarListDto;
import com.rlagus.rentcar.dto.CarPageDto;
import com.rlagus.rentcar.dto.Criteria;
import com.rlagus.rentcar.dto.PageDto;

@Controller
public class InformationController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/information_form")
	public String information() {
		return "information";
	}
	
	@RequestMapping(value = "/insurance_form")
	public String insurance() {
		return "insurance";
	}	
	
	@RequestMapping(value = "/carDetail_form")
	public String carDetail(Model model, HttpServletRequest request) {
		
		int cindex = Integer.parseInt(request.getParameter("cindex"));
		IDao dao = sqlSession.getMapper(IDao.class);
		CarListDto cdto = dao.IndexCarDao(cindex);
		Vector<CarListDto> dto = dao.BrendListDao();
		model.addAttribute("cdto", cdto);
		model.addAttribute("brendlist", dto);
		
		return "carDetail";
	}
	
	@RequestMapping(value = "/carAdd_form")
	public String carAdd() {
		return "carAdd";
	}
	
	@RequestMapping(value = "/carListUpdate")
	public String carListUpdate(HttpServletRequest request) {
		
		int cindex = Integer.parseInt(request.getParameter("cindex"));
		String cbrend = request.getParameter("cbrend");
		String cclass = request.getParameter("cclass");
		String cname = request.getParameter("updatecname");
		String ccolor = request.getParameter("updateccolor");
		String coil = request.getParameter("coil");
		String ctype = request.getParameter("ctype");
		int price = Integer.parseInt(request.getParameter("pricename"));
		String cimg = request.getParameter("updatecimg");
		String cnote = request.getParameter("cnote");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.CarListUpdateDao(cindex, cbrend, cclass, cname, ccolor, coil, ctype, price, cimg, cnote);

		return "redirect:carList2_form";
	}
	
	@RequestMapping(value = "/carListDelete")
	public String carListDelete(HttpServletRequest request) {
		
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.CarListDeleteDao(Integer.parseInt(request.getParameter("cindex")));
		
		return "redirect:carList2_form";
	}
	
	@RequestMapping(value = "/carADD")
	public String carADD(HttpServletRequest request) {
		
		String cbrend = request.getParameter("cbrend");
		String cclass = request.getParameter("cclass");
		String cname = request.getParameter("addcname");
		String ccolor = request.getParameter("addccolor");
		String coil = request.getParameter("coil");
		String ctype = request.getParameter("ctype");
		int price = Integer.parseInt(request.getParameter("pricename"));
		String cimg = request.getParameter("addcimg");
		String cnote = request.getParameter("cnote");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.AddNewCarDao(cbrend, cclass, cname, ccolor, coil, ctype, price, cimg, cnote);

		return "redirect:carList2_form";
	}
	
	@RequestMapping(value = "/carList2_form")
	public String carList2(Model model, HttpServletRequest request, CarCriteria carCriteria) {
		
		int pageNum;
		if(request.getParameter("pageNum") == null) {
			pageNum = 1;
		}else {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			carCriteria.setPageNum(pageNum);
		}
		
		String type = request.getParameter("cclass");
		if(type == null || type.equals("전체")) {
			IDao dao = sqlSession.getMapper(IDao.class);
			int totalCount = dao.totalcountJSDao();		
			CarPageDto carPageDto = new CarPageDto(carCriteria, totalCount);	
			Vector<CarListDto> dtos = dao.AllCarListDao(carCriteria.getAmount(), pageNum);
			
			model.addAttribute("totalCount", totalCount);
			model.addAttribute("carListDto", dtos);
			model.addAttribute("pageMaker", carPageDto);
			model.addAttribute("currPage", pageNum);
			model.addAttribute("type", "전체");
			
			return "carList2";
			
		} else if(type.equals("수입")) {
			
			IDao dao = sqlSession.getMapper(IDao.class);
			int totalCount = dao.countCarBrendListDao(type);
			CarPageDto carPageDto = new CarPageDto(carCriteria, totalCount);
			Vector<CarListDto> dtos = dao.CarBrendListDao(carCriteria.getAmount(), pageNum, type);
			model.addAttribute("totalCount", totalCount);
			model.addAttribute("carListDto", dtos);
			model.addAttribute("type",type);			
			model.addAttribute("pageMaker", carPageDto);
			model.addAttribute("currPage", pageNum);
			
			return "carList2";
			
		} else if(type.equals("준중형")){
			
			IDao dao = sqlSession.getMapper(IDao.class);
			int totalCount = dao.countCarTypeListDao(type);
			CarPageDto carPageDto = new CarPageDto(carCriteria, totalCount);
			Vector<CarListDto> dtos = dao.CarListDao(carCriteria.getAmount(), pageNum, type);
			model.addAttribute("totalCount", totalCount);
			model.addAttribute("carListDto", dtos);
			model.addAttribute("type","준중형");
			model.addAttribute("pageMaker", carPageDto);
			model.addAttribute("currPage", pageNum);
			
			return "carList2";
			
		} else {
			
			IDao dao = sqlSession.getMapper(IDao.class);
			int totalCount = dao.countCarTypeListDao(type);
			CarPageDto carPageDto = new CarPageDto(carCriteria, totalCount);
			Vector<CarListDto> dtos = dao.CarListDao(carCriteria.getAmount(), pageNum, type);
			model.addAttribute("totalCount", totalCount);
			model.addAttribute("carListDto", dtos);
			model.addAttribute("type",type);
			model.addAttribute("pageMaker", carPageDto);
			model.addAttribute("currPage", pageNum);
			
			return "carList2";
		}
	}
	
}
