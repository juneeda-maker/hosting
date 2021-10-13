package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class SignupServiceImpl {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	public void signup(MemberVO member) {
		log.info("sign up : ..." + member + member.getUserpw());
		mapper.insert(member);
		mapper.insert_auth(member.getUserid());
	}
	
	
}
