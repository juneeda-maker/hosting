package org.zerock.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MovieVO {
	
		public String title;
		public String link;
		public String image;
		public String subtitle;
		public Date pubDate;
		public String director;
		public String actor;
		public float userRating;
		public String netizen_score;
		public String special_score;
		
		public ArrayList<String> review;
		public String content;
		
}
