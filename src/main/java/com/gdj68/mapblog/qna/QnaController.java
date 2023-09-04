package com.gdj68.mapblog.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gdj68.mapblog.member.MemberDTO;
import com.gdj68.mapblog.util.Pager;

@Controller
@RequestMapping("/qna/*")
public class QnaController {
	@Autowired
	private QnaService qnaService;
	

	
	@GetMapping("list")
	public String getList(Pager pager,Model model) throws Exception{
		List<QnaDTO> ar=qnaService.getList(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);

		return "qna/list";
	}
	@GetMapping("add")
	public String setAdd() throws Exception{
		return "qna/add";
	}
	@PostMapping("add")
	public String setAdd(QnaDTO qnaDTO,MultipartFile[] photos, HttpSession session) throws Exception{
		
		int result = qnaService.setAdd(qnaDTO,photos,session);
		
		return "redirect:./list";
		
	}
	@GetMapping("detail")
	public String getDetail(QnaDTO qnaDTO,Model model,HttpSession session) throws Exception{
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		qnaDTO=qnaService.getDetail(qnaDTO,memberDTO);	
		model.addAttribute("dto", qnaDTO);
		
		if(qnaDTO == null) {
			String message ="비공개 글 입니다";
			model.addAttribute("message", message);
			model.addAttribute("url", "./list");
			return "commons/result";
		}
		
		return "qna/detail";
	}
	@GetMapping("update")
	public String setUp(QnaDTO qnaDTO,Model model,MemberDTO memberDTO) throws Exception{
		qnaDTO= qnaService.getDetail(qnaDTO,memberDTO);
		model.addAttribute("dto", qnaDTO);
		return "qna/update";
	}
	@PostMapping("update")
	public String setUp(QnaDTO qnaDTO, MultipartFile [] photos , HttpSession session) throws Exception{
		int result =qnaService.setUp(qnaDTO,photos,session);
		return "redirect:./list";
	}
	@PostMapping("delete")
	public String setDel(QnaDTO qnaDTO) throws Exception{
		int result= qnaService.setDel(qnaDTO);
		return "redirect:./list";
	}
}