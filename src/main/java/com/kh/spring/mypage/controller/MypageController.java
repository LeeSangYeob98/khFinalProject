package com.kh.spring.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.board.model.dto.Board;
import com.kh.spring.common.validator.ValidatorResult;
import com.kh.spring.member.model.dto.Member;
import com.kh.spring.mypage.model.dto.Pet;
import com.kh.spring.mypage.model.dto.VaccineInfo;
import com.kh.spring.mypage.model.service.MypageService;
import com.kh.spring.mypage.validator.UpdateMemberForm;
import com.kh.spring.mypage.validator.UpdateMemberFormValidator;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("mypage")
public class MypageController {
	
	private final MypageService mypageService;
	private final UpdateMemberFormValidator updateMemberFormValidator;
	
	@InitBinder("updateMemberForm")
	public void initBinder(WebDataBinder webDataBinder) {
		webDataBinder.addValidators(updateMemberFormValidator);
	}
	
	@GetMapping("update-member-info")
	public void updateMemberForm(Model model) {
		model
		.addAttribute(new UpdateMemberForm())
		.addAttribute("error", new ValidatorResult().getError());
	}
	
	@PostMapping("update-member-info")
	public String updateMember(@SessionAttribute(name = "authentication")Member certifiedUser, 
			@Validated UpdateMemberForm form, Errors errors, Model model, RedirectAttributes redirectAttr) {
		
		if(errors.hasErrors()) {
			ValidatorResult validatorResult = new ValidatorResult();
			validatorResult.addErrors(errors);
			model.addAttribute("error", validatorResult.getError());
			return "mypage/update-member-info";
		}

		int userIdx = certifiedUser.getUserIdx();
		form.setUserIdx(userIdx);
		
		mypageService.updateMemberDynamicQuery(form);
		redirectAttr.addFlashAttribute("message", "회원정보가 수정되었습니다.");
		
		return "mypage/my-info";
	}
	
	@GetMapping("managing-board")
	public void managingBoard(
//			@SessionAttribute(name = "authentication")Member certifiedUser, Model model
			) {
		
//		int userIdx = certifiedUser.getUserIdx();
//		List<Board> boardList = mypageService.selectBoardByUserIdx(userIdx);
//		model.addAttribute("boardList", boardList);
	}
	
	@GetMapping("managing-reply")
	public void managingReply(
//			@SessionAttribute(name = "authentication")Member certifiedUser, Model model
			) {
		
//		int userIdx = certifiedUser.getUserIdx();
//		List<Reply> replyList = mypageService.selectReplyByUserIdx(userIdx);
//		model.addAttribute("replyList", replyList);
	}
	
	@GetMapping("managing-counseling")
	public void managingCounseling(
//			@SessionAttribute(name = "authentication")Member certifiedUser, Model model
			) {
		
//		int userIdx = certifiedUser.getUserIdx();
//		List<Counseling> counselingList = mypageService.selectCounselingByUserIdx(userIdx);
//		model.addAttribute("counselingList", counselingList);
	}
	
	@GetMapping("pet-info")
	public void petInfo(
//			@SessionAttribute(name = "authentication")Member certifiedUser, Model model
			) {
		
//		int userIdx = certifiedUser.getUserIdx();
//		List<Pet> petList = mypageService.selectPetByUserIdx(userIdx);
//		model.addAttribute("petList", petList);
	}
	
	@GetMapping("my-info")
	public void myInfo() {}
	
	@GetMapping("registration-pet")
	public void registrationPetForm() {}
	
	@PostMapping("registration-pet")
	public String registrationPet(
		@SessionAttribute(name = "authentication")Member certifiedUser, Model model, Pet pet, MultipartFile file
			) {
		
		int userIdx = certifiedUser.getUserIdx();
		pet.setUserIdx(userIdx);
		
		mypageService.insertPet(pet, file);
		
		return "mypage/pet-info";
	}
	
	@GetMapping("vaccination")
	public void vaccination(
			@SessionAttribute(name = "authentication")Member certifiedUser, Model model
			) {
		List<Pet> petList = mypageService.selectPetByUserIdx(certifiedUser.getUserIdx());
		List<VaccineInfo> vaccineList = mypageService.selectAllVaccine();
		
		model.addAttribute("petList", petList);
		model.addAttribute("vaccineList", vaccineList);
	}
	
}
