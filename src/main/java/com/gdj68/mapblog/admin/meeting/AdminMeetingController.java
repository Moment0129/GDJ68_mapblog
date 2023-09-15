package com.gdj68.mapblog.admin.meeting;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdj68.mapblog.meeting.MeetingDTO;
import com.gdj68.mapblog.meeting.MeetingMemberDTO;
import com.gdj68.mapblog.meeting.MeetingService;

@Controller
@RequestMapping("/admin/adminMeeting/*")
public class AdminMeetingController {
	
	@Autowired
	private MeetingService meetingService;

	
	@GetMapping("list")
	public String getList(Model model) throws Exception {
		List<MeetingDTO> ar = meetingService.getList();
		model.addAttribute("list", ar);
		return "admin/adminMeeting/adminMeetingList";
	}
	
	@GetMapping("detail")
	public String getDetail(MeetingDTO meetingDTO, Model model,HttpSession session)throws Exception {
		meetingDTO = meetingService.getDetailAdmin(meetingDTO);
		model.addAttribute("dto", meetingDTO);
		return "admin/adminMeeting/adminMeetingDetail";
	}
	
	@GetMapping("delete")
	public String setMeetingDelete(MeetingDTO meetingDTO) throws Exception {
		meetingService.setMeetingDeleteAdmin(meetingDTO);
		return "redirect:./list";
	}
	
	
}
