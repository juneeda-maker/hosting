package org.zerock.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	
	private int pageNum;
	private int amount; //한 페이지당출력되는 데이터 수 
	
	public Criteria() {
		this(1,10); //this() 는 같은 클래스의 다른 생성자 호출시 사용
	}
	
	public Criteria(int pageNum, int amount)
	{
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
