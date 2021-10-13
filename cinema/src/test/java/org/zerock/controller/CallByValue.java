package org.zerock.controller;



import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
public class CallByValue {
	
	
		public static void swap(int x, int y){
	    	int temp = x;
	        x = y;
	        y = temp;
	    }
	
		
	@Test
	public static void main(String[] args){
		int a = 1;
	    int b = 2;
	    
	    System.out.println("swap() 호출전: a= " +a+ ", b = " + b);
	    // a = 1, b = 2
	    swap(a,b);
	    
	    System.out.println("swap() 호출 후 : a = " + a + ",b = " + b);
	    //a = 1, b = 2
	}
}
