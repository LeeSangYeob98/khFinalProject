package com.kh.spring.mypage.model.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.spring.board.model.dto.Board;
import com.kh.spring.board.model.dto.BoardComment;
import com.kh.spring.common.util.FileDTO;
import com.kh.spring.mypage.model.dto.MypageSearchSet;
import com.kh.spring.mypage.model.dto.Pet;
import com.kh.spring.mypage.model.dto.Vaccination;
import com.kh.spring.mypage.model.dto.VaccineInfo;
import com.kh.spring.mypage.validator.UpdateMemberForm;

@Mapper
public interface MypageRepository {
	
	void updateMemberDynamicQuery(UpdateMemberForm form);
	
	int selectBoardCommentCnt(MypageSearchSet searchSet);

	List<Map<String, Object>> selectCommentList(Map<String, Object> commandMap);

	int selectBoardCnt(MypageSearchSet searchSet);
	
	List<Board> selectBoard(Map<String, Object> map);
	
	@Insert("insert into pet(pet_idx, name, species, gender, age, user_idx)"
			+ " values(sc_pet_idx.nextval, #{name}, #{species}, #{gender}, #{age}, #{userIdx})")
	void insertPet(Pet pet);
	
	@Insert("insert into file_info(fl_idx, type_idx, origin_file_name, rename_file_name, save_path)"
			+ " values(sc_file_idx.nextval, sc_pet_idx.currval, #{originFileName}, #{renameFileName}, #{savePath})")
	void insertFile(FileDTO file);
	
	List<Map<String, Object>> selectPetList(Map<String, Object> commandMap);
	
	@Select("select count(*) from pet where user_idx = #{userIdx}")
	int selectPetCnt(int userIdx);
	
	@Select("select * from pet where user_idx = #{userIdx}")
	List<Pet> selectAllPet(Object commandMap);

	@Select("select * from vaccine_info order by vi_idx")
	List<VaccineInfo> selectVaccineInfoList();
	
	@Select("select * from vaccination_calendar where user_idx = #{userIdx}")
	List<Vaccination> selectVaccinationList(int userIdx);
	
	
}