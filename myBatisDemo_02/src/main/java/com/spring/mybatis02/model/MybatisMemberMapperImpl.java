package com.spring.mybatis02.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

//@Service 대신 써도 무방함.
@Repository
public class MybatisMemberMapperImpl implements MybatisMemberMapper{
	
	@Autowired
	SqlSession sqlSession;
	
	//모든 멤버
	@Override
	public List<MybatisMember> getAllMembers() {
/*		List<MybatisMember> members = new ArrayList<MybatisMember>();
		//MybatisMemberMapper 클래스에 대응이 되어 있어서 얻어올 수 있음
		MybatisMemberMapper mybatisMemberMapper = sqlSession.getMapper(MybatisMemberMapper.class);
		
//		members = mybatisMemberMapper.getAllMembers();
//		return members;
		return mybatisMemberMapper.getAllMembers(); //두 줄을 한 줄로
*/
		//더 간단한 방법 - selectList 반환 값이 List라서 위의 문장을 1줄로 처리 가능
		return sqlSession.selectList("getAllMembers");
	}
	//멤버 1명
	@Override
	public MybatisMember getMember(String id) {
/*		MybatisMemberMapper mybatisMemberMapper = sqlSession.getMapper(MybatisMemberMapper.class);
		return mybatisMemberMapper.getMember(id);
*/		
		//MybatisMemberMapper.xml 에서 설정했던 id="getMember", 파라미터 인자 값이 들어온 것.
		return sqlSession.selectOne("getMember", id);
	}
	//멤버 추가
	@Override
	public void insetMember(MybatisMember mybatisMember) {
/*		// DB에 저장하려면 MybatisMemberMapper객체가 필요
		MybatisMemberMapper mybatisMemberMapper = sqlSession.getMapper(MybatisMemberMapper.class);
		mybatisMemberMapper.insetMember(mybatisMember);
*/		
		sqlSession.insert("insetMember", mybatisMember);
		
	}
	//멤버 수정
	@Override
	public void updateMember(MybatisMember mybatisMember) {
/*		MybatisMemberMapper mybatisMemberMapper = sqlSession.getMapper(MybatisMemberMapper.class);
		mybatisMemberMapper.updateMember(mybatisMember);
*/
		sqlSession.update("updateMember", mybatisMember);
	}
	//멤버 삭제
	@Override
	public void deleteMember(String id) {
/*		MybatisMemberMapper mybatisMemberMapper = sqlSession.getMapper(MybatisMemberMapper.class);
		mybatisMemberMapper.deleteMember(id);
*/		
		sqlSession.delete("deleteMember", id);
	}

}
