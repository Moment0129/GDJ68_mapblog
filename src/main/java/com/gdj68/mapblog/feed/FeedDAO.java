package com.gdj68.mapblog.feed;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gdj68.mapblog.feed.FeedCommentLikesDTO;
import com.gdj68.mapblog.file.FileDTO;
import com.gdj68.mapblog.follow.FollowDTO;
import com.gdj68.mapblog.meeting.MeetingReplyDTO;
import com.gdj68.mapblog.member.MemberDTO;
import com.gdj68.mapblog.util.Pager;

@Repository
public class FeedDAO {

	@Autowired
	private SqlSession sqlSession;

	private final String NAMESPACE = "com.gdj68.mapblog.feed.FeedDAO.";

	/* -------------------------------------------------------------- */

	// 리스트
	public List<FeedDTO> getFeedList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getFeedList", pager);
	}

	public List<FeedDTO> getList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getList", pager);
	}

	public Long getTotalCount(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "feedTotalCount", pager);
	}

	public List<FeedDTO> getList(MemberDTO memberDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getList2", memberDTO);
	}

	public FeedDTO getUrl(FeedDTO feedDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getUrl", feedDTO);
	}

	public MemberDTO getUser(FeedDTO feedDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getUser", feedDTO);
	}

	public FeedDTO getFeedUrl(FeedDTO feedDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getFeedUrl", feedDTO);
	}

	// 글 작성
	public int setAdd(FeedDTO feedDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setAdd", feedDTO);
	}

	// 글 디테일
	public FeedDTO getDetail(FeedDTO feedDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getDetail", feedDTO);
	}

	// 글 삭제
	public int setDelete(FeedDTO feedDTO) throws Exception {
		return sqlSession.delete(NAMESPACE + "setDelete", feedDTO);
	}

	// 글 수정
	public int setUpdate(FeedDTO feedDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "setUpdate", feedDTO);
	}

	// getTotal
	public Long getTotal(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getTotal", pager);
	}
	
	//admin feed List를 위한 total
	public Long getTotal2(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getTotal2", pager);
	}

	/* -------- FILE -------- */
	
	// 파일 리스트
	public List<FeedFileDTO> getFileList(FeedDTO feedDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getFileList", feedDTO);
	}

	// 파일 추가
	public int setFileAdd(FeedFileDTO feedFileDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setFileAdd", feedFileDTO);
	}

	// 파일 디테일
	public FeedFileDTO getFileDetail(FeedFileDTO feedFileDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getFileDetail", feedFileDTO);
	}

	// 글 수정 시 파일 삭제
	public int setFileDelete(FeedFileDTO feedFileDTO) throws Exception {
		return sqlSession.delete(NAMESPACE + "setFileDelete", feedFileDTO);
	}

	/* -------- 조회수 -------- */

	// 조회수 추가
	public int setHitUpdate(FeedDTO feedDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "setHitUpdate", feedDTO);
	}

	/* -------- 좋아요 -------- */

	// 좋아요 눌렀는지 확인
	public Long getFindLikes(LikesDTO likesDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getFindLikes", likesDTO);
	}
	
	// 좋아요 체크
	public int checkLikes(LikesDTO likesDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "checkLikes", likesDto);
	}

	// 좋아요 등록
	public int addLikes(LikesDTO likesDto) throws Exception {
		return sqlSession.insert(NAMESPACE + "addLikes", likesDto);
	}

	// 좋아요 카운트
	public int countLikes(LikesDTO likesDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "countLikes", likesDto);
	}

	// 좋아요 삭제
	public int deleteLikes(LikesDTO likesDto) throws Exception {
		return sqlSession.delete(NAMESPACE + "deleteLikes", likesDto);
	}
	
	// 좋아요 게시글 리스트
	public List<FeedDTO> getLikesList(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getLikesList", pager);
	}
	
	// 좋아요 게시글 카운트
	public Long getLikesCount(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getLikesCount", pager);
	}
	
		
	/* -------- 댓글 -------- */
	
	// 코멘트 목록
	public List<FeedCommentDTO> getCommentList(FeedCommentDTO feedCommentDTO) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getCommentList", feedCommentDTO);
	}

	// 코멘트 추가
	public int setAddComment(FeedCommentDTO feedCommentDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "setAddComment", feedCommentDTO);
	}
	
	// 코멘트 삭제
	public int setDeleteComment(FeedCommentDTO feedCommentDTO) throws Exception {
		return sqlSession.delete(NAMESPACE + "setDeleteComment", feedCommentDTO);
	}
	
	// 코멘트 수정
	public int setUpdateComment(FeedCommentDTO feedCommentDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "setUpdateComment", feedCommentDTO);
	}


		
	
	/* -------- 댓글 좋아요 -------- */
	
	// 좋아요 눌렀는지 확인
	public Long getFindCommentLikes(FeedCommentLikesDTO feedCommentLikesDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getFindCommentLikes", feedCommentLikesDTO);
	}
	
	// 좋아요 체크
	public int checkCommentLikes(FeedCommentLikesDTO feedCommentLikesDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "checkCommentLikes", feedCommentLikesDTO);
	}

	// 좋아요 등록
	public int addCommentLikes(FeedCommentLikesDTO feedCommentLikesDTO) throws Exception {
		return sqlSession.insert(NAMESPACE + "addCommentLikes", feedCommentLikesDTO);
	}

	// 좋아요 카운트
	public int countCommentLikes(FeedCommentLikesDTO feedCommentLikesDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "countCommentLikes", feedCommentLikesDTO);
	}

	// 좋아요 삭제
	public int deleteCommentLikes(FeedCommentLikesDTO feedCommentLikesDTO) throws Exception {
		return sqlSession.delete(NAMESPACE + "deleteCommentLikes", feedCommentLikesDTO);
	}
	
	// 전체 공개만 가져오기
	public List<FeedDTO> getFeedList(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getFeedList", id);
	}

	public IgnoreDTO confirmIgnore(IgnoreDTO ignoreDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "confirmIgnore", ignoreDTO);
	}

	public ConfirmFollowDTO confirmFollow(ConfirmFollowDTO confirmFollowDTO) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "confirmFollow", confirmFollowDTO);
	}

	public List<FeedDTO> getFeedListF(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getFeedListF", id);
	}

	public List<FeedDTO> getFeedListUnF(String id) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getFeedListUnF", id);
	}
	
	
	
	// ---------------------------------------------------------------------------------------
	
	

	// 팔로우 확인
	public int checkFollow(FollowDTO followDTO) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"checkFollow", followDTO);
		
		
	}

	public int likesPlus(LikesDTO likesDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "likesPlus", likesDTO);
	}

	public int likesMinus(LikesDTO likesDTO) throws Exception {
		return sqlSession.update(NAMESPACE + "likesMinus", likesDTO);
	}
	
	
	// 게시글 랭크
	public List<FeedDTO> getHitRank() throws Exception {
		return sqlSession.selectList(NAMESPACE + "getHitRank");
	}

	public List<FeedDTO> getLikesRank() throws Exception {
		return sqlSession.selectList(NAMESPACE + "getLikesRank");
	}

	public List<FeedDTO> getNewRank() throws Exception {
		return sqlSession.selectList(NAMESPACE + "getNewRank");
	}

	public List<MemberDTO> getHitMember() throws Exception {
		return sqlSession.selectList(NAMESPACE + "getHitMember");
	}

	public List<MemberDTO> getLikesMember() {
		return sqlSession.selectList(NAMESPACE + "getLikesMember");
	}
	
	public List<FeedDTO> getList3(Pager pager) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getList3", pager);
	}

	public String getMember(String url) {
		return sqlSession.selectOne(NAMESPACE + "getMember", url);
	}
	
}



