package com.rlagus.rentcar.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rlagus.rentcar.dao.IDao;
import com.rlagus.rentcar.dto.MemberDto;

@Controller
public class RentcarController {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping(value = "/index")
	public String index() {
		return"index";
	}
	
	//회원 관리
	@RequestMapping(value = "/join")
	public String join() {
		return"join";
	}
	
	@RequestMapping(value = "/joinOk")
	public String joinOk(HttpServletRequest request, Model model) {
		String rid = request.getParameter("rid");
		String rpw = request.getParameter("rpw");
		String rname = request.getParameter("rname");
		String rmobile = request.getParameter("rmobile");
		String remail = request.getParameter("remail");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		int joinCheck = 0;
		int checkId = dao.checkIdDao(rid);
		
		if(checkId==0) {
			joinCheck = dao.joinDao(rid, rpw, rname, rmobile, remail);
			model.addAttribute("checkId", checkId);
		}else {
			model.addAttribute("checkId", checkId);
		}
		
		if(joinCheck ==  1) {
			model.addAttribute("joinFlag", joinCheck);
			model.addAttribute("rid", rid);
			model.addAttribute("rname", rname);
		}else {
			model.addAttribute("joinFlag", joinCheck);
		}
		return"joinOk";
	}
	
	@RequestMapping(value = "/login")
	public String login() {		
		return"/login";
	}
	
	@RequestMapping(value = "/loginOk")
	public String loginOk(HttpServletRequest request, HttpSession session, Model model) {
		String rid = request.getParameter("rid");
		String rpw = request.getParameter("rpw");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int loginCheck  = dao.loginOkDao(rid, rpw);
		if(loginCheck == 1) {
			session.setAttribute("sessionId", rid);
			model.addAttribute("loginCheck", loginCheck);
		}else {
			model.addAttribute("message", "가입하지 않은 정보입니다. 다시 입력해주세요.");
			return "login";
		}
		return "index";
	}	
	
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();//세션 삭제
		return "redirect:login";
	}
	
	@RequestMapping(value = "/modify")
	public String modify(HttpServletRequest request, Model model, HttpSession session) {
		
		String sessionId = (String)session.getAttribute("sessionId");
		
		IDao dao = sqlSession.getMapper(IDao.class);

		MemberDto dto = dao.showInfoDao(sessionId);
		
		model.addAttribute("dto", dto);
		
		return "modify";
	}
	
	@RequestMapping(value = "/modifyOk")
	public String modifyOk(HttpServletRequest request, Model model) {
		
		String rid = request.getParameter("rid");
		String rpw = request.getParameter("rpw");
		String rname = request.getParameter("rname");
		String rmobile = request.getParameter("rmobile");
		String remail = request.getParameter("remail");
		
		IDao dao = sqlSession.getMapper(IDao.class);

		int modifyCheck = dao.modifyOkDao(rid, rpw, rname, rmobile, remail);
		
		model.addAttribute("modifyCheck", modifyCheck);
		
		return"modifyOk";
	}
	
	@RequestMapping(value = "/memberdelete")
	public String memberdelete(HttpSession session, Model model) {		
		
		String sessionId = (String)session.getAttribute("sessionId");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		dao.MemberDeleteDao(sessionId);
		model.addAttribute("sessionId", sessionId);
		session.invalidate();
		
		return "memberdeleteOk";
	}
	
	@RequestMapping(value = "/delete_form")
	public String delete_form(HttpServletRequest request, Model model, HttpSession session) {
		
		String sessionId = (String)session.getAttribute("sessionId");
		
		IDao dao = sqlSession.getMapper(IDao.class);

		MemberDto dto = dao.showInfoDao(sessionId);
		
		model.addAttribute("dto", dto);
		
		return "memberdelete";
	}
}
