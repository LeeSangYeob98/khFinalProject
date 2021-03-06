package com.kh.spring.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.http.MediaType;
import org.springframework.http.RequestEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.kh.spring.common.code.Config;
import com.kh.spring.common.mail.MailSender;
import com.kh.spring.common.util.pagination.Paging;
import com.kh.spring.member.model.dto.Member;
import com.kh.spring.member.model.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

	private final MemberRepository memberRepository;
	private final RestTemplate template;
	private final MailSender mailSender;

	public Member authenticateUser(Member member) {
		
		Member storedMember = memberRepository.selectMemberByUserId(member);
		if(storedMember != null) {
			return storedMember;
		}
		
		return null;
	}
	
	public void insertMember(Member member) {
		//member.setPassword(new BCryptPasswordEncoder().encode(member.getPassword()));
		// -> db에 비밀번호 안뜨게돼서 불편하니 시연시에만 키는게 나을듯..?
		memberRepository.insertMember(member);
		
	}
	
	public int idCheck(String userId) {
		return memberRepository.idCheck(userId);
	}

	public int nickNameCheck(String nickName) {
		return memberRepository.nickNameCheck(nickName);
	}

	public Member searchId(Member member) {
		return memberRepository.searchId(member);
		
	}

	public Member searchPw(Member member) {
		return memberRepository.searchPw(member);
	}
	
	public void updatePw(Member member) {
		memberRepository.updatePw(member);
	}

	public Member selectMemberById(String userId) {
		return memberRepository.selectMemberById(userId);
	}

	public void insertKakaoMember(Member member) {
		memberRepository.insertKakaoMember(member);
		System.out.println("service : " + member);
		
	}

	public void authenticateByEmail(Member member, String token) {
		MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
		body.add("mail-template", "join-auth-email");
		body.add("userId", member.getUserId());
		body.add("persistToken", token);
		
		RequestEntity<MultiValueMap<String, String>> request = 
				RequestEntity.post(Config.DOMAIN.DESC+"/mail")
				.accept(MediaType.APPLICATION_FORM_URLENCODED)
				.body(body);
		
		String htmlText = template.exchange(request, String.class).getBody();
		mailSender.sendEmail(member.getEmail(), "'똑DOG한 집사들' 회원가입 인증 메일입니다.", htmlText);
	}
	
	
	@Override
	public int selectMemberListCnt(Map<String, Object> commandMap) {
		
		return memberRepository.selectMemberListCnt(commandMap);
	}
	
	@Override
	public List<Member> selectMemberList(Map<String, Object> commandMap, Paging pageUtil) {
		
		return memberRepository.selectMemberList(commandMap,pageUtil);
	}
	

}
