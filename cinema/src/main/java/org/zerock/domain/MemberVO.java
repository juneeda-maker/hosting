package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	private String userid;
	private String userpw;
	private String username;
	private boolean enable;
	
	private Date regDate;
	private List<AuthVO> authList;
}
