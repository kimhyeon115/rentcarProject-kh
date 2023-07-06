package com.rlagus.rentcar.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rlagus.rentcar.dao.IDao;
import com.rlagus.rentcar.dto.Criteria;
import com.rlagus.rentcar.dto.PageDto;
import com.rlagus.rentcar.dto.UserBoardDto;
import com.rlagus.rentcar.dto.UserreplyDto;

@Controller
public class boardController {
	
	@Autowired
	private SqlSession sqlSession;
	
	//게시판글
	@RequestMapping(value = "/userBoardWrite")
	public String userBoardWrite() {
		return"userWriteForm";
	}
	
	@RequestMapping(value = "/writeOk")
	public String writeOK(HttpServletRequest request) {
		String rid = request.getParameter("rid");
		String rbtitle = request.getParameter("rbtitle");
		String rbcontent = request.getParameter("rbcontent");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.boardWriteDao(rid, rbtitle, rbcontent);
		
		return"redirect:userBoardList";
	}
	@RequestMapping(value = "/userBoardList")
	public String userBoardList(Model model,  Criteria criteria, HttpServletRequest request) {
		
		int pageNum=0;
		if(request.getParameter("pageNum") == null) {
			pageNum = 1;
		}else {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			criteria.setPageNum(pageNum);
		}
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int totalCount = dao.totalListcount();
		
		PageDto pageDto = new PageDto(criteria, totalCount);
		
		List<UserBoardDto> dtos = dao.userBoardListDao(criteria.getAmount(), pageNum);
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("dtos", dtos);
		model.addAttribute("pageMaker", pageDto);
		model.addAttribute("currPage", pageNum);
		
		return"userBoardList";
	}
	@RequestMapping(value = "/userBoardView")
	public String userBoardView(Model model, HttpServletRequest request) {
		
		String rbnum =  request.getParameter("rbnum");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		UserBoardDto dto =  dao.userBoardViewDao(rbnum);
		model.addAttribute("dto", dto);
		
		List<UserreplyDto> replyListDto = dao.userReplyListDao(rbnum);
		model.addAttribute("replyListDto", replyListDto);
	
		dao.userBoardUpHit(rbnum);
		
		return"userBoardView";
	}
	@RequestMapping(value = "/userBoardDelete")
	public String userBoardDelete(HttpServletRequest request) {
		
		String rbnum = request.getParameter("rbnum");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int deleteOk = dao.userBoardDelete(rbnum);
		
		if(deleteOk == 1) {
			dao.replydeleterbnumDao(rbnum);
		}
		
		return"redirect:userBoardList";
	}
	@RequestMapping(value = "/searchList")
	public String searchList(Model model, HttpServletRequest request, Criteria criteria) {
		
		int pageNum=0;
		if(request.getParameter("pageNum") == null) {
			pageNum = 1;
		}else {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			criteria.setPageNum(pageNum);
		}
		
		
		String searchOption	 = request.getParameter("searchOption");
		String keyWord = request.getParameter("keyWord");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		int totalCount = 0;
		
		
		if(searchOption.equals("title")) {
			model.addAttribute("dtos", dao.userListSearchTitleDao(criteria.getAmount(), pageNum, keyWord));
			totalCount = dao.userListSearchTitleCountDao(keyWord);
			model.addAttribute("totalCount", totalCount);
		}else if(searchOption.equals("content")){
			model.addAttribute("dtos", dao.userListSearchContentDao(criteria.getAmount(), pageNum, keyWord));
			totalCount = dao.userListSearchContentCountDao(keyWord);
			model.addAttribute("totalCount", totalCount);
		}else {
			model.addAttribute("dtos", dao.userListSearchIdDao(criteria.getAmount(), pageNum, keyWord));
			totalCount = dao.userListSearchIdCountDao(keyWord);
			model.addAttribute("totalCount", totalCount);
		}
		PageDto pageDto = new PageDto(criteria, totalCount);
		model.addAttribute("pageMaker", pageDto);
		model.addAttribute("currPage", pageNum);
		
		return"userBoardList";
	}
	
	@RequestMapping(value = "/userBoardModify")
	public String userBoardModify(Model model, HttpServletRequest request) {
		
		String rbnum =  request.getParameter("rbnum");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		UserBoardDto dto =  dao.userBoardViewDao(rbnum);
		model.addAttribute("dto", dto);
		
		return"userBoardModify";
	}
	@RequestMapping(value = "/userBoardModifyOk")
	public String userBoardModifyOk(Model model, HttpServletRequest request) {
		
		String rbnum =  request.getParameter("rbnum");
		String rbtitle = request.getParameter("rbtitle");
		String rbcontent = request.getParameter("rbcontent");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.userBoardModifyDao(rbnum, rbtitle, rbcontent);
		UserBoardDto dto =  dao.userBoardViewDao(rbnum);
		model.addAttribute("dto", dto);
		List<UserreplyDto> replyListDto = dao.userReplyListDao(rbnum);
		model.addAttribute("replyListDto", replyListDto);
		;
	
		
		return"userBoardView";
	}
	
	
	
	//댓글
	@RequestMapping(value = "/replyOk")
	public String replyOk(HttpServletRequest request, HttpSession session, Model model) {
		
		String rbnum = request.getParameter("rbnum");
		String rid = (String)session.getAttribute("sessionId");
		String rrcontent = request.getParameter("rrcontent");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int replyOk = dao.replyWriteDao(rbnum, rid, rrcontent);
		
		if(replyOk == 1) {
			dao.replyCountUpDao(rbnum);
		}
		
		List<UserreplyDto> replyListDto = dao.userReplyListDao(rbnum);
		model.addAttribute("replyListDto", replyListDto);
		model.addAttribute("dto", dao.userBoardViewDao(rbnum));
		
		return"userBoardView";
	}
	@RequestMapping(value = "/replyDelete")
	public String replyDelete(HttpServletRequest request, Model model) {
		
		String rrnum = request.getParameter("rrnum");
		String rbnum = request.getParameter("rbnum");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int replyDeleteOk =  dao.replydeleterrnumDao(rrnum);
		
		if(replyDeleteOk== 1) {
			dao.replyCountDownDao(rbnum);
		}
		
		List<UserreplyDto> replyListDto = dao.userReplyListDao(rbnum);
		model.addAttribute("replyListDto", replyListDto);
		model.addAttribute("dto", dao.userBoardViewDao(rbnum));
		return"userBoardView";
	}
	@RequestMapping(value = "/userReplyModify")
	public String userReplyModify(Model model, HttpServletRequest request) {
		String rrnum = request.getParameter("rrnum");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		UserreplyDto dto = dao.replyViewDao(rrnum);
		
		model.addAttribute("dto", dto);
		
		
		return"userReplyModify";
	}
	@RequestMapping(value = "/userReplyModifyOk")
	public String userReplyModifyOk(Model model, HttpServletRequest request) {
		
		String rrnum = request.getParameter("rrnum");
		String rrcontent = request.getParameter("rrcontent");
		String rbnum = request.getParameter("rbnum");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.replyModifyDao(rrnum, rrcontent);
		
		UserBoardDto dto =  dao.userBoardViewDao(rbnum);
		model.addAttribute("dto", dto);
		
		List<UserreplyDto> replyListDto = dao.userReplyListDao(rbnum);
		model.addAttribute("replyListDto", replyListDto);
	
	
		
		return"userBoardView";
	}
	
}
