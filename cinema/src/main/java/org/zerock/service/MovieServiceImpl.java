package org.zerock.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.MovieVO;

import java.net.HttpURLConnection;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.zerock.domain.MovieVO;

import java.net.HttpURLConnection;

@Service
public class MovieServiceImpl {
	
	private MovieVO movievo;
	
	public String findkeyword(String keyword)
	{
		String clientId = "DCJ09aiyajA2FDSBr92m";
		String clientSecret = "HywUosgpWN";
		String text = null;
		
		try {
			text = URLEncoder.encode(keyword, "UTF-8");
		}catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패", e);
		}
		
		String apiURL = "https://openapi.naver.com/v1/search/movie.json?query=" + text;
		
		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		String responseBody = get(apiURL, requestHeaders);
		
		return responseBody;
	}
	
	private static String get(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}
			
			int responseCode = con.getResponseCode();
			if(responseCode == HttpURLConnection.HTTP_OK) {
				return readBody(con.getInputStream());
			}else {
				return readBody(con.getErrorStream());
			}
		}catch(IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		}finally {
			con.disconnect();
		}
	}
	
	private static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection)url.openConnection();
		}catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다" + apiUrl, e);
		}catch(IOException e) {
			throw new RuntimeException("연결이 실패했습니다. " + apiUrl, e);
		}
	}
	
	private static String readBody(InputStream body)
	{
		InputStreamReader streamReader = new InputStreamReader(body);
		
		
		try(BufferedReader lineReader = new BufferedReader(streamReader)){
			StringBuilder responseBody = new StringBuilder();
			
			String line;
			while((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}
			
			return responseBody.toString();
					
		}catch(IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패함", e);
		}
	}
	
	
	public String Result(String keyword)
	{
		StringBuffer result = new StringBuffer();
		String clientId = "DCJ09aiyajA2FDSBr92m";
		String clientSecret = "HywUosgpWN";
		String text = null;
		
		try {
			text = URLEncoder.encode(keyword, "UTF-8");
			
			
			String apiURL = "https://openapi.naver.com/v1/search/movie.json?query=" + text;
			
			Map<String, String> requestHeaders = new HashMap<>();
			requestHeaders.put("X-Naver-Client-Id", clientId);
			requestHeaders.put("X-Naver-Client-Secret", clientSecret);
			String responseBody = get(apiURL, requestHeaders);
			
			URL url = new URL(responseBody.toString());
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("GET");
			BufferedReader rd;
			
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			String line;
			while((line = rd.readLine()) != null) {
				result.append(line + "\n");
			}
			rd.close();
			conn.disconnect();
		}catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패", e);
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		return result + "";
	}
	
	public MovieVO showDetail(String address) //@RequestParam("가져올 데이터의 이름") [데이터타입] [가져온데이터를 담을 변수]
	{
		
		System.out.println("도착한 url :" + address);
		MovieVO mv = new MovieVO();
		String url = address;
		Document doc = null;
		
		try {
			doc = Jsoup.connect(url).get();
			Elements elements = doc.select(".score_reple");
			//Elements high_score = doc.select(".btn_area");
			Elements contexts = doc.select(".story_area").select(".con_tx");
			Elements scores1 = doc.select("div.netizen_score"); //관람객 평점.
			Elements scores2 = doc.select("div.special_score"); //전문가 평점.
			Elements poster = doc.select("div.poster").select("img");
			//Iterator<Element> nick = elements.select("a.color_b").iterator();
			//Iterator<Element> scores = elements.select("div.list_netizen_score").iterator();
			Iterator<Element> reviews = elements.select("p").iterator();
			//Iterator<Element> sympathy = high_score.select("._sympathyButton").iterator();
			
			String netizen_score = scores1.text();
			String context = contexts.text();
			String special_score = scores2.text();
			String image = poster.attr("src");
			
			
			ArrayList<String> list1 = new ArrayList<String>(5);
			mv.review = list1;
			mv.content = context;
			mv.netizen_score = netizen_score;
			mv.special_score = special_score;
			mv.image = image;
			
			
			Pattern pat;
			Matcher mat;
			
						
			System.out.println("image src : " + image);
			System.out.println("관람객 평점 : " + netizen_score);
			System.out.println("전문가 평점 : " + special_score);
			System.out.println(context);
			System.out.println("**********줄거리**********");
			
			int i = 0;
			
			if(elements.isEmpty()) //리뷰 존재하지 않는 경우.
			{
				System.out.println("평점 존재 하지 않음");
				list1.add("평점 존재 하지 않음.");
			}
			else
			{
				while(i < 5)
				{
					if(!reviews.hasNext()) //존재하는 리뷰가 5개보다 적을때.
					{
						System.out.println("---------결과 끝.----------");
						break;
					}
					//String title = titles.next().text()s;
					//String score = scores.next().text();
					String review = reviews.next().text();
					
					list1.add(review);
					//review = review.substring(0, review.length()-3);
					pat = Pattern.compile("별점 - 총 10 점 중[0-9]{1,2} ");
					
					mat = pat.matcher(review);
					review = mat.replaceAll("").trim();
					
					System.out.println("------------------------");
					//System.out.println("영화제목 : " + title);
					//ystem.out.println("평점 : " + score);
					System.out.println("리뷰 : " + review);
					
					i++;
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return mv;
}
	
}
