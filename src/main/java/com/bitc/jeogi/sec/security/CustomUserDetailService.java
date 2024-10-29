package com.bitc.jeogi.sec.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.bitc.jeogi.user.dao.UserDAO;
import com.bitc.jeogi.user.vo.UserVO;
public class CustomUserDetailService implements UserDetailsService{
	
	@Autowired
	private UserDAO dao;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserVO vo = null;
		try {
			vo = dao.getUserById(username);
			if(vo != null) {
				vo.setAuthList(dao.getAuthList(username));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo == null ? null : new CustomUser(vo);
	}

}
















