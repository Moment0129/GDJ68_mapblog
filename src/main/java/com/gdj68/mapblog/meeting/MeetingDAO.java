package com.gdj68.mapblog.meeting;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class MeetingDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.gdj68.mapblog.meeting.MeetingDAO."; 
	
	public int setAdd(MeetingDTO meetingDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setAdd", meetingDTO);
	}
	
	public List<MeetingDTO> getList() throws Exception {
		return sqlSession.selectList(NAMESPACE+"getList");
	}
	
	public List<MeetingDTO> getMyList(MeetingMemberDTO meetingMemberDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getMyList",meetingMemberDTO);
	}
	
	public MeetingDTO getDetail(MeetingDTO meetingDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getDetail", meetingDTO);
		
	}
	
	public int setMeetingJoin(MeetingMemberDTO meetingMemberDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setMeetingJoin", meetingMemberDTO);
	}
	
	public Long getJoinCheck(MeetingMemberDTO meetingMemberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getJoinCheck", meetingMemberDTO);
	}
	
	public int setMeetingQuit(MeetingMemberDTO meetingMemberDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setMeetingQuit", meetingMemberDTO);
	}
	
	public int setMeetingDelete(MeetingDTO meetingDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setMeetingDelete",meetingDTO);
	}
	
	public int setMeetingDeleteAdmin(MeetingDTO meetingDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setMeetingDeleteAdmin",meetingDTO);
	}
	
	public int setUpdate(MeetingDTO meetingDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setUpdate",meetingDTO);
	}
	
	public long getPersonnelCheck(MeetingMemberDTO meetingMemberDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"getPersonnelCheck", meetingMemberDTO);
	}
	
	public List<MeetingMemberDTO> getPersonnelList(MeetingMemberDTO meetingMemberDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getPersonnelList", meetingMemberDTO);
	}
	
	public int setAddComment(MeetingCommentDTO commentDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setAddComment",commentDTO);
	}
	
	public List<MeetingCommentDTO> getCommentList(MeetingCommentDTO commentDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getCommentList", commentDTO);
	}
	
	public int setDeleteComment(MeetingCommentDTO commentDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setDeleteComment", commentDTO);
	}
	
	public int setUpdateComment(MeetingCommentDTO commentDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setUpdateComment", commentDTO);
	}
	
	public int setReplyCommentAdd(MeetingReplyDTO replyDTO) throws Exception {
		return sqlSession.insert(NAMESPACE+"setReplyCommentAdd", replyDTO);
	}
	
	public int setUpdateCommentCgroup(MeetingReplyDTO replyDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setUpdateCommentCgroup",replyDTO);
	}
	
	public List<MeetingReplyDTO> getReplyCommentList(MeetingReplyDTO replyDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE+"getReplyCommentList", replyDTO);
	}
	
	public int setUpdateReplyComment(MeetingReplyDTO replyDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setUpdateReplyComment", replyDTO);
	}

	public int setDeleteReplyComment(MeetingReplyDTO replyDTO) throws Exception {
		return sqlSession.delete(NAMESPACE+"setDeleteReplyComment", replyDTO);
	}
	
	public int setUpdateCommentCgroupDelete(MeetingReplyDTO replyDTO) throws Exception {
		return sqlSession.update(NAMESPACE+"setUpdateCommentCgroupDelete", replyDTO);
	}
}
