package com.zeus.service;

import java.util.List;

import com.zeus.domain.Member;


public interface MemberService {
	// 회원가입 => 비지니스모델(회원테이블 회원가입 & 회원권한테이블 권한설정)
	int register(Member member) throws Exception;
	// 회원삭제 => 비지니스모델(회원테이블 회원삭제 & 회원권한테이블 권한삭제)
	int delete(Member member) throws Exception;
	//회원리스트, 회원정보, 수정
	List<Member> list() throws Exception;
	Member read(Member member) throws Exception;
	int update(Member member) throws Exception;
	List<Member> search(Member member) throws Exception;
}
