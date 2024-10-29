package com.bitc.jeogi.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.bitc.jeogi.user.vo.UserVO;

/**
 * 
 * User Mapper Interface
 *
 */
public interface UserDAO {
	
	/**
	 * 회원가입
	 */
	@Insert("INSERT INTO user("
			+ "u_id,u_pw,u_profile,u_name,u_phone,u_birth,u_addr,u_addr_detail,u_addr_post" 
			+ ")VALUES("
			+ " #{u_id}, "
			/* + " #{u_email}," */
			+ " #{u_pw},"
			+ " #{u_profile},"
			+ " #{u_name},"
			+ " #{u_phone},"
			+ " #{u_birth},"
			+ " #{u_addr},"
			+ " #{u_addr_detail},"
			+ " #{u_addr_post}"
			+")")
	int userJoin(UserVO user) throws Exception;

	@Select("SELECT * FROM user WHERE u_id = #{u_id} AND u_pw = #{u_pw}")
	UserVO login(
				@Param("u_id") String u_id, @Param("u_pw") String u_pw
	) throws Exception;

	@Select("SELECT * FROM user WHERE u_id = #{u_id}")
	UserVO getUserById(String u_id) throws Exception;
	
	// u_id 가 일치하는 사용자의 권한 목록
	@Select("SELECT u_auth FROM security_member_auth WHERE u_id = #{u_id}")
	List<String> getAuthList(String u_id) throws Exception;
	
}






