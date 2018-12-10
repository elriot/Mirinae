package com.movie.util;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class MyUtils {

	public static String getYoutubeParse(String url){
		String result = "";
		String parsing = "";
		if(url.contains("=")){
			//System.out.println("=있음");			
			int index = url.indexOf("=");
			parsing = url.substring(index+1);
		} else {
			//System.out.println("=없음");
			int index = url.lastIndexOf("/");
			parsing = url.substring(index+1);
		}
				
		result = result + parsing;		
		
		return "https://www.youtube.com/embed/"+result;
	}
		
	public static String getYoutubeMovie(String bContent){
		//String data = "<p><a href=\"https://www.youtube.com/watch?v=FREqbJjxFcg\">https://www.youtube.com/watch?v=FREqbJjxFcg</a></p><p>&nbsp;</p><p>안녕..</p><p>zzz</p>";
		String data = bContent;
		Document doc = Jsoup.parse(data);
		//System.out.println(doc);	
		Elements a_tag = doc.select("a");
		int a_tagSize = a_tag.size();
		if(a_tagSize > 0){
			for (int i=0; i<a_tagSize; i++){
				if(a_tag.get(i).attr("href").contains("https://www.youtube.com") 
						|| a_tag.get(i).attr("href").contains("https://youtu.be")){ // href라는 속성에 문자열이 포함되어 있으면.,
					//System.out.println("유투브 영상 링크가 존재합니다.");
					String href = a_tag.get(i).attr("href");
					String result = getYoutubeParse(href);
					//System.out.println(result);
					String iFrame = "<iframe id=\"player\" type=\"text/html\" width=\"90%\" height=\"409\" src=\"http://www.youtube.com/embed/"+result+"\" frameborder=\"0\" webkitallowfullscreen=\"\" mozallowfullscreen=\"\" allowfullscreen=\"\"></iframe>";
					a_tag.get(i).after(iFrame);				
				}
			}
		}
		//System.out.println(doc);	
		return doc.toString();
	}
	
	
}
