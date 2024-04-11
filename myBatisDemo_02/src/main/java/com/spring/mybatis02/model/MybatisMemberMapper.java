package com.spring.mybatis02.model;

import java.util.List;

//DAO와 같은 역할
public interface MybatisMemberMapper {
	public List<MybatisMember> getAllMembers(); // 모든 멤버
	public MybatisMember getMember(String id); //멤버 1 명
	public void insetMember(MybatisMember mybatisMember); //멤버 추가
	public void updateMember(MybatisMember mybatisMember); //멤버 수정
	public void deleteMember(String id); //멤버 삭제
}
