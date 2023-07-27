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
import com.rlagus.rentcar.dto.FreeBoardDto;
import com.rlagus.rentcar.dto.FreereplyDto;
import com.rlagus.rentcar.dto.PageDto;
import com.rlagus.rentcar.dto.UserBoardDto;
import com.rlagus.rentcar.dto.UserreplyDto;

@Controller
public class freeBoardController {
	
	@Autowired
	private SqlSession sqlSession;
	
	//게시판글
	@RequestMapping(value = "/freeBoardWrite")
	public String freeBoardWrite() {
		return"freeWriteForm";
	}
	
	@RequestMapping(value = "/freeWriteOk")
	public String freeWriteOK(HttpServletRequest request) {
		
		String rid = request.getParameter("rid");
		String rfbtitle = request.getParameter("rfbtitle");
		String rfbcontent = request.getParameter("rfbcontent");
		
		IDao dao = sqlSession.getMapper(IDao.class);		
		dao.freeBoardWriteDao(rid, rfbtitle, rfbcontent);
		
		if(rid.equals("admin")) {
			dao.noticeDao(rid);
		}
		
		return"redirect:freeBoardList";
	}
	@RequestMapping(value = "/freeBoardList")
	public String freeBoardList(Model model,  Criteria criteria, HttpServletRequest request) {
		
		int pageNum=0;
		if(request.getParameter("pageNum") == null) {
			pageNum = 1;
		}else {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			criteria.setPageNum(pageNum);
		}
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int totalCount = dao.freeTotalListcount();
		
		PageDto pageDto = new PageDto(criteria, totalCount);
		
		List<FreeBoardDto> dtos = dao.freeBoardListDao(criteria.getAmount(), pageNum);
		
		
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("dtos", dtos);
		model.addAttribute("pageMaker", pageDto);
		model.addAttribute("currPage", pageNum);
		
		return"freeBoardList";
	}
	@RequestMapping(value = "/freeBoardView")
	public String freeBoardView(Model model, HttpServletRequest request) {
		
		String rfbnum =  request.getParameter("rfbnum");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		FreeBoardDto dto =  dao.freeBoardViewDao(rfbnum);
		model.addAttribute("dto", dto);
		
		List<FreereplyDto> replyListDto = dao.freeReplyListDao(rfbnum);
		model.addAttribute("replyListDto", replyListDto);
	
		dao.freeBoardUpHit(rfbnum);
		
		return"freeBoardView";
	}
	@RequestMapping(value = "/freeBoardDelete")
	public String freeBoardDelete(HttpServletRequest request) {
		
		String rfbnum = request.getParameter("rfbnum");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int deleteOk = dao.freeBoardDelete(rfbnum);
		
		if(deleteOk == 1) {
			dao.freeReplydeleterbnumDao(rfbnum);
		}
		
		return"redirect:freeBoardList";
	}
	@RequestMapping(value = "/freeSearchList")
	public String freeSearchList(Model model, HttpServletRequest request, Criteria criteria) {
		
		int pageNum;
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
			model.addAttribute("dtos", dao.freeListSearchTitleDao(criteria.getAmount(), pageNum, keyWord));
			totalCount = dao.freeListSearchTitleCountDao(keyWord);
			model.addAttribute("totalCount", totalCount);
		}else if(searchOption.equals("content")){
			model.addAttribute("dtos", dao.freeListSearchContentDao(criteria.getAmount(), pageNum, keyWord));
			totalCount = dao.freeListSearchContentCountDao(keyWord);
			model.addAttribute("totalCount", totalCount);
		}else {
			model.addAttribute("dtos", dao.freeListSearchIdDao(criteria.getAmount(), pageNum, keyWord));
			totalCount = dao.freeListSearchIdCountDao(keyWord);
			model.addAttribute("totalCount", totalCount);
		}
		PageDto pageDto = new PageDto(criteria, totalCount);
		model.addAttribute("pageMaker", pageDto);
		model.addAttribute("currPage", pageNum);
		
		return"freeBoardList";
	}
	
	@RequestMapping(value = "/freeBoardModify")
	public String freeBoardModify(Model model, HttpServletRequest request) {
		
		String rfbnum =  request.getParameter("rfbnum");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		FreeBoardDto dto =  dao.freeBoardViewDao(rfbnum);
		model.addAttribute("dto", dto);
		
		return"freeBoardModify";
	}
	@RequestMapping(value = "/freeBoardModifyOk")
	public String freeBoardModifyOk(Model model, HttpServletRequest request) {
		
		String rfbnum =  request.getParameter("rfbnum");
		String rfbtitle = request.getParameter("rfbtitle");
		String rfbcontent = request.getParameter("rfbcontent");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.freeBoardModifyDao(rfbnum, rfbtitle, rfbcontent);
		FreeBoardDto dto =  dao.freeBoardViewDao(rfbnum);
		model.addAttribute("dto", dto);
		List<FreereplyDto> replyListDto = dao.freeReplyListDao(rfbnum);
		model.addAttribute("replyListDto", replyListDto);
		;
	
		
		return"freeBoardView";
	}
	
	//댓글
	@RequestMapping(value = "/freeReplyOk")
	public String freeReplyOk(HttpServletRequest request, HttpSession session, Model model) {
		
		String rfbnum = request.getParameter("rfbnum");
		String rid = (String)session.getAttribute("sessionId");
		String rfrcontent = request.getParameter("rfrcontent");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int replyOk = dao.freeReplyWriteDao(rfbnum, rid, rfrcontent);
		
		if(replyOk == 1) {
			dao.freeReplyCountUpDao(rfbnum);
		}
		
		List<FreereplyDto> replyListDto = dao.freeReplyListDao(rfbnum);
		model.addAttribute("replyListDto", replyListDto);
		model.addAttribute("dto", dao.freeBoardViewDao(rfbnum));
		
		return"freeBoardView";
	}
	@RequestMapping(value = "/freeReplyDelete")
	public String freeReplyDelete(HttpServletRequest request, Model model) {
		
		String rfrnum = request.getParameter("rfrnum");
		String rfbnum = request.getParameter("rfbnum");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		int replyDeleteOk =  dao.freeReplydeleterrnumDao(rfrnum);
		
		if(replyDeleteOk== 1) {
			dao.freeReplyCountDownDao(rfbnum);
		}
		
		List<FreereplyDto> replyListDto = dao.freeReplyListDao(rfbnum);
		model.addAttribute("replyListDto", replyListDto);
		model.addAttribute("dto", dao.freeBoardViewDao(rfbnum));
		return"freeBoardView";
	}
	@RequestMapping(value = "/freeReplyModify")
	public String userReplyModify(Model model, HttpServletRequest request) {
		String rfrnum = request.getParameter("rfrnum");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		FreereplyDto dto = dao.freeReplyViewDao(rfrnum);
		
		model.addAttribute("dto", dto);
		
		return"freeReplyModify";
	}
	@RequestMapping(value = "/freeReplyModifyOk")
	public String freeReplyModifyOk(Model model, HttpServletRequest request) {
		
		String rfrnum = request.getParameter("rfrnum");
		String rfrcontent = request.getParameter("rfrcontent");
		String rfbnum = request.getParameter("rfbnum");
		
		IDao dao = sqlSession.getMapper(IDao.class);
		
		dao.freeReplyModifyDao(rfrnum, rfrcontent);
		
		FreeBoardDto dto =  dao.freeBoardViewDao(rfbnum);
		model.addAttribute("dto", dto);
		
		List<FreereplyDto> replyListDto = dao.freeReplyListDao(rfbnum);
		model.addAttribute("replyListDto", replyListDto);
		
		return"freeBoardView";
	}
	
	
}
