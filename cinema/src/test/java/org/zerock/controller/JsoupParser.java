package org.zerock.controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class JsoupParser {

	

		/*
	     *	Document 클래스 : 연결해서 얻어온 HTML 전체 문서
	     *	Element 클래스  : Documnet의 HTML 요소
	     *	Elements 클래스 : Element가 모인 자료형
		 */
		
		public static void main(String[] args) {
			// Jsoup를 이용해서 네이버 영화리뷰 크롤링
			String url = "https://movie.naver.com/movie/bi/mi/basic.naver?code=161967";
			Document doc = null;
			
			try {
				doc = Jsoup.connect(url).get();
				Elements elements = doc.select(".score_reple");
				Elements contexts = doc.select(".story_area").select(".con_tx");
				Elements scores = doc.select("div.netizen_score");
				Iterator<Element> nick = elements.select("a.color_b").iterator();
				Iterator<Element> reviews = elements.select("p").iterator();
				//contexts = contexts.select("p");
				String score = scores.text();
				System.out.println("평점 : " + score);
				String context = contexts.text();
				System.out.println(context);
				System.out.println("**********줄거리**********");
				
				Pattern pat;
				Matcher mat;
				
				int i = 0;
				
				while(i < 5)
				{
					
					if(elements.isEmpty())
					{
						System.out.println("결과 없음.");
						break;
					}
					//String title = titles.next().text();
					//String score = scores.next().text();
					String review = reviews.next().text();
					
					review = review.substring(0, review.length()-3);
					pat = Pattern.compile("별점 - 총 10 점 중[0-9]{1,2} ");
					
					mat = pat.matcher(review);
					review = mat.replaceAll("").trim();
					
					System.out.println("------------------------");
					//System.out.println("영화제목 : " + title);
					System.out.println("리뷰 : " + review);
					i++;
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			

	}
}
