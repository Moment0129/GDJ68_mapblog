package com.gdj68.mapblog.meeting;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj68.mapblog.member.MemberDTO;

@Service
public class MeetingService {

	@Autowired
	private MeetingDAO meetingDAO;
	
	
	public int setAdd(MeetingDTO meetingDTO) throws Exception {
		int result = meetingDAO.setAdd(meetingDTO);
		MeetingMemberDTO meetingMemberDTO = new MeetingMemberDTO();
		meetingMemberDTO.setMeetingNum(meetingDTO.getMeetingNum());
		meetingMemberDTO.setId(meetingDTO.getId());
		meetingMemberDTO.setNickName(meetingDTO.getNickName());
		int result2 = meetingDAO.setMeetingJoin(meetingMemberDTO);
		return result; 
	}
	
	public List<MeetingDTO> getList() throws Exception{
		return meetingDAO.getList();
	}
	
	public List<MeetingDTO> getMyList(HttpSession session) throws Exception{
		MeetingMemberDTO meetingMemberDTO = new MeetingMemberDTO();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		meetingMemberDTO.setId(memberDTO.getId());
		return meetingDAO.getMyList(meetingMemberDTO);
	}
	
	public Map<String,Object> getDetail(MeetingDTO meetingDTO,HttpSession session) throws Exception {
		MeetingMemberDTO meetingMemberDTO = new MeetingMemberDTO();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		meetingMemberDTO.setId(memberDTO.getId());
		meetingMemberDTO.setMeetingNum(meetingDTO.getMeetingNum());
		long result = meetingDAO.getJoinCheck(meetingMemberDTO);
		meetingDTO = meetingDAO.getDetail(meetingDTO);
		long personnel = meetingDAO.getPersonnelCheck(meetingMemberDTO);
		List<MeetingMemberDTO> ar = meetingDAO.getPersonnelList(meetingMemberDTO);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		map.put("meetingDTO", meetingDTO);
		map.put("personnel", personnel);
		map.put("meetingMemberList", ar);
		return map;
	}
	
	public MeetingDTO getDetailAdmin(MeetingDTO meetingDTO) throws Exception {
		return meetingDAO.getDetail(meetingDTO);
	}
	
	public int setMeetingJoin(MeetingMemberDTO meetingMemberDTO) throws Exception{
		
		return meetingDAO.setMeetingJoin(meetingMemberDTO);
	}
	
	public int setMeetingQuit(MeetingMemberDTO meetingMemberDTO) throws Exception {
		return meetingDAO.setMeetingQuit(meetingMemberDTO);
	}
	
	public int setMeetingDelete(MeetingDTO meetingDTO) throws Exception {
		
		return meetingDAO.setMeetingDelete(meetingDTO);
	}
	
	public int setMeetingDeleteAdmin(MeetingDTO meetingDTO) throws Exception {
		return meetingDAO.setMeetingDeleteAdmin(meetingDTO);
	}
	
	public int setUpdate(MeetingDTO meetingDTO) throws Exception {
		int result = meetingDAO.setUpdate(meetingDTO);
		return result;
	}
	
	public int setAddComment(MeetingCommentDTO commentDTO) throws Exception {
		return meetingDAO.setAddComment(commentDTO);
	}
	
	public List<MeetingCommentDTO> getCommentList(MeetingCommentDTO commentDTO) throws Exception {
		return meetingDAO.getCommentList(commentDTO);
	}
	
	public int setDeleteComment(MeetingCommentDTO commentDTO) throws Exception {
		return meetingDAO.setDeleteComment(commentDTO);
	}
	public int setUpdateComment(MeetingCommentDTO commentDTO) throws Exception {
		return meetingDAO.setUpdateComment(commentDTO);
	}
	
	public int setReplyCommentAdd(MeetingReplyDTO replyDTO) throws Exception {
		int result = meetingDAO.setUpdateCommentCgroup(replyDTO);
		
		return meetingDAO.setReplyCommentAdd(replyDTO);
	}
	
	public List<MeetingReplyDTO> getReplyCommentList(MeetingReplyDTO replyDTO) throws Exception {
		return meetingDAO.getReplyCommentList(replyDTO);
	}
	
	public int setUpdateReplyComment(MeetingReplyDTO replyDTO) throws Exception {
		return meetingDAO.setUpdateReplyComment(replyDTO);
	}
	
	public int setDeleteReplyComment(MeetingReplyDTO replyDTO) throws Exception {
		int result = meetingDAO.setUpdateCommentCgroupDelete(replyDTO);
		return meetingDAO.setDeleteReplyComment(replyDTO);
	}
}
