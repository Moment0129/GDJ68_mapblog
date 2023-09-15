package com.gdj68.mapblog.admin;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.gdj68.mapblog.admin.member.AdminMemberDTO;

@Controller
public class AdminHomeController {

	//Home
	@GetMapping("/admin")
	public String AdminHome(HttpSession session) {
		AdminMemberDTO adminMemberDTO =(AdminMemberDTO) session.getAttribute("adminMember");
		if(adminMemberDTO == null) {
			
			return "admin/adminMember/adminLogin";
		}
		else {
			return "redirect:/admin/main";
		}
	}	
		
}
