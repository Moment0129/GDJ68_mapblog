package com.gdj68.mapblog.admin.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gdj68.mapblog.util.Pager;


@Repository
public class AdminMemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.gdj68.mapblog.admin.member.AdminMemberDAO.";
	
	
	//join
	public int setAdminJoin(AdminMemberDTO adminMemberDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setAdminJoin", adminMemberDTO);
	}
	
	//grade 매칭
	public int setAdminGradeJoin(AdminMemberDTO adminMemberDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setAdminGradeJoin", adminMemberDTO);
	}
	
	//login
	public AdminMemberDTO getAdminLogin(AdminMemberDTO adminMemberDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getAdminLogin", adminMemberDTO);
	}
	
	//total
	public Long getAdminMemberTotal(Pager pager)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getAdminMemberTotal", pager);
	}
	
	//list
	public List<AdminMemberDTO> getAdminMemberList(Pager pager)throws Exception{
		return sqlSession.selectList(NAMESPACE+"getAdminMemberList", pager);
	}
	
	//detail
	public AdminMemberDTO getAdminMemberDetail(AdminMemberDTO adminMemberDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getAdminMemberDetail", adminMemberDTO);
	}
	
	//delete
	public int setAdminDelete(AdminMemberDTO adminMemberDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setAdminDelete", adminMemberDTO);
	}
	
	//update
		public AdminMemberDTO getMyPage(AdminMemberDTO adminMemberDTO)throws Exception{
			return sqlSession.selectOne(NAMESPACE+"setAdminUpdate", adminMemberDTO);
		}
	
	//update
	public int setAdminUpdate(AdminMemberDTO adminMemberDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setAdminUpdate", adminMemberDTO);
	}
}
