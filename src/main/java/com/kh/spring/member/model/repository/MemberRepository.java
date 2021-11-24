package com.kh.spring.member.model.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.spring.member.model.dto.Member;

@Mapper
public interface MemberRepository {

	@Select("select * from \"USER\" where user_id =#{userId} and password=#{password}")
	Member selectMemberByUserId(Member member);

	@Insert("insert all "
			+ "into \"USER\"(user_id,password,nickName,email,address,user_name,user_idx) "
			+ "values(#{userId},#{password},#{nickName},#{email},#{address},#{userName},sc_user_idx.nextval) "
			+ "into \"ADDRESS\"(address,user_idx) "
			+ "values(#{address},sc_user_idx.nextval) "
			+ "SELECT * FROM DUAL")
	void insertMember(Member member);
	
	@Select("select count(*) from \"USER\" where user_id = #{userId}")
	public int idCheck(String memberId);
	
	@Select("select count(*) from \"USER\" where nickName = #{nickName}")
	public int nickNameCheck(String nickName);
}
