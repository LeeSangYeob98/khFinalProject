package com.kh.spring.mypage.model.service;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.spring.board.model.dto.Board;
import com.kh.spring.common.util.FileDTO;
import com.kh.spring.common.util.FileUtil;
import com.kh.spring.member.model.dto.Member;
import com.kh.spring.mypage.model.dto.MypageSearchSet;
import com.kh.spring.mypage.model.dto.Pet;
import com.kh.spring.mypage.model.dto.Vaccination;
import com.kh.spring.mypage.model.dto.VaccineInfo;
import com.kh.spring.mypage.model.repository.MypageRepository;
import com.kh.spring.mypage.validator.UpdateMemberForm;

import lombok.RequiredArgsConstructor;

@Service("mypageService")
@RequiredArgsConstructor
public class MypageServiceImpl implements MypageService {
	
	private final MypageRepository mypageRepository;
	
	public void updateMemberDynamicQuery(UpdateMemberForm form) {
		mypageRepository.updateMemberDynamicQuery(form);
	}
	
	public int selectBoardCommentCnt(MypageSearchSet searchSet) {
		return mypageRepository.selectBoardCommentCnt(searchSet);
	}

	public List<Map<String, Object>> selectCommentList(Map<String, Object> commandMap){
		return mypageRepository.selectCommentList(commandMap);
	};
	
	public int selectBoardCnt(MypageSearchSet searchSet) {
		return mypageRepository.selectBoardCnt(searchSet);
	}

	public List<Board> selectBoard(Map<String, Object> map){
		return mypageRepository.selectBoard(map);
	};

	public void insertPet(Pet pet, MultipartFile file) {
		mypageRepository.insertPet(pet);
		
		FileUtil fileUtil = new FileUtil();
		mypageRepository.insertFile(fileUtil.fileUpload(file));
	}
	
	public List<Map<String, Object>> selectPetList(Map<String, Object> commandMap){
		
		List<Map<String, Object>> commandList = mypageRepository.selectPetList(commandMap);
		for (Map<String, Object> map : commandList) {
			FileDTO files = new FileDTO();
			files.setSavePath((String) map.get("SAVE_PATH"));
			files.setRenameFileName((String) map.get("RENAME_FILE_NAME"));
			map.put("downloadURL", files.getDownloadURL());
		}
		return commandList;
	}

	public int selectPetCnt(int userIdx) {
		return mypageRepository.selectPetCnt(userIdx);
	}

	public List<Pet> selectAllPet(int userIdx) {
		return mypageRepository.selectAllPet(userIdx);
	}

	public List<VaccineInfo> selectVaccineInfoList() {
		return mypageRepository.selectVaccineInfoList();
	}

	@Override
	public List<Map<String, Object>> selectVaccinationList(int userIdx) {
		return mypageRepository.selectVaccinationList(userIdx);
	}

	public void insertVaccinationCalendar(Vaccination vaccination) {
		
		int viIdx = vaccination.getViIdx();
		int cycle = mypageRepository.selectCycle(viIdx);
		
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(vaccination.getCriterionDate());
		calendar.add(Calendar.DATE, cycle);
		
		Date nextDate = new Date(calendar.getTimeInMillis());
		
		vaccination.setNextDate(nextDate);
		
		mypageRepository.insertVaccinationCalendar(vaccination);
	}
	
	public Member selectMember(int userIdx) {
		return mypageRepository.selectMember(userIdx);
	}

	public List<Map<String, Object>> selectVaccinationForBatch() {
		return mypageRepository.selectVaccinationForBatch();
	}

	public void updateBoardIsDel(List<Integer> bdIdxArr) {
		
//		for (int bdIdx : bdIdxArr) {
//			mypageRepository.updateBoardIsDel(bdIdx);
//		}
		mypageRepository.updateBoardIsDel2(bdIdxArr);
	}

	public void updateCommentIsDel(List<Integer> cmIdxArr) {

//		for (int cmIdx : cmIdxArr) {
//			mypageRepository.updateCommentIsDel(cmIdx);
//		}
		mypageRepository.updateCommentIsDel2(cmIdxArr);
	}
	
	
}
