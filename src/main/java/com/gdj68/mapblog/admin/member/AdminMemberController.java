package com.gdj68.mapblog.admin.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdj68.mapblog.util.Pager;


@Controller
@RequestMapping("/admin/member/*")
public class AdminMemberController {

	@Autowired
	private AdminMemberService adminMemberService;
	

	//Login  -> AdminHomeController에서 작업
//	@GetMapping("adminLogin")
//	public String getAdminLogin()throws Exception{
//		return "/admin/adminMember/adminLogin";
//	}
	
	//login
	@PostMapping("adminLogin")
	public String getAdminLogin(AdminMemberDTO adminMemberDTO, HttpSession session)throws Exception{
		adminMemberDTO = adminMemberService.getAdminLogin(adminMemberDTO);
		
		if(adminMemberDTO != null) {
			session.setAttribute("adminMember", adminMemberDTO);
			
		}
		
		return "redirect:/admin/main";
	}
	
	//logout
	@GetMapping("adminLogout")
	public String getLogout(HttpSession session)throws Exception{
		session.invalidate();
		return "redirect:/admin";
	}
	
	//join
	@GetMapping("adminJoin")
	public String setAdminJoin()throws Exception{
		return "admin/adminMember/adminJoin";
	}
	@PostMapping("adminJoin")
	public String setAdminJoin(AdminMemberDTO adminMemberDTO)throws Exception{
		adminMemberService.setAdminJoin(adminMemberDTO);
		adminMemberService.setAdminGradeJoin(adminMemberDTO);
		return "redirect:./adminList";
	}
	
	//list
	@GetMapping("adminList")
	public String getAdminMemberList(Model model, Pager pager)throws Exception{
		List<AdminMemberDTO> ar = adminMemberService.getAdminMemberList(pager);
		model.addAttribute("adminList", ar);
		model.addAttribute("pager", pager);
		return "admin/adminMember/adminList";
	}
	
	//detail
	@GetMapping("adminDetail")
	public String getAdminMemberDetail(AdminMemberDTO adminMemberDTO, Model model)throws Exception{
		adminMemberDTO= adminMemberService.getAdminMemberDetail(adminMemberDTO);
		model.addAttribute("adminDTO", adminMemberDTO);
		return "admin/adminMember/adminDetail";
	}
	
	//delete
	@GetMapping("adminDelete")
	public String setAdminDelete(AdminMemberDTO adminMemberDTO)throws Exception{
		adminMemberService.setAdminDelete(adminMemberDTO);
		return "redirect:/admin/main";
	}
	
	//update
	@GetMapping("adminUpdate")
	public String setAdminUpdate(AdminMemberDTO adminMemberDTO, Model model)throws Exception{
		adminMemberDTO= adminMemberService.getAdminMemberDetail(adminMemberDTO);
		model.addAttribute("adminDTO", adminMemberDTO);
		return "admin/adminMember/adminUpdate";
	}
	
	@PostMapping("adminUpdate")
	public String setAdminUpdate(AdminMemberDTO adminMemberDTO, HttpSession session)throws Exception{
		int result = adminMemberService.setAdminUpdate(adminMemberDTO);
//		if(result>0) {
//			session.setAttribute("adminMember", adminMemberDTO);
//		}
		
		return "redirect:/admin/member/adminList";
	}
	
	//myPage
	@GetMapping("adminMyPage")
	public String getAdminMyPage()throws Exception{

		return "admin/adminMember/adminMyPage";
	}
	
	@PostMapping("adminMyPage")
	public String getAdminMyPage(HttpSession session,String adminPw)throws Exception{
		AdminMemberDTO sessionAdminMember = (AdminMemberDTO)session.getAttribute("adminMember");
		sessionAdminMember.setAdminPw(adminPw);
		adminMemberService.getMyPage(sessionAdminMember);
		/* int result = adminMemberService.setAdminUpdate(adminMemberDTO); */
		/*
		 * if(result>0) { session.setAttribute("adminMember", adminMemberDTO); }
		 */
		session.invalidate();
		return "redirect:/admin";
	}
	
	
	
	
	
	
	
	
	
	
	
}
