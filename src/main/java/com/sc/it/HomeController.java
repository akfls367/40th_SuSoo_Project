package com.sc.it;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.it.service.SuSooWordListService;
import com.sc.it.vo.TextVO;

@Controller
public class HomeController {
   
   @Autowired
   private SuSooWordListService service;
   
   @RequestMapping(value = "/", method = RequestMethod.GET)
   public String index() {
      
      return "index";
   }
   
   // 홈 게시판 리스트
   @RequestMapping(value = "home", method = RequestMethod.GET) 
   public String homeSelectList(Model model) { 
   ArrayList<HashMap<String, Object>> list = service.selectList(); 
   model.addAttribute("list", list); 
   return "home"; 
   }
   
   @ResponseBody
   @RequestMapping(value="/translate",  produces = "application/text; charset=utf8", method=RequestMethod.POST)
   public String translate(TextVO vo) {
      String jsonParse = ""; //JSON 형태로 변환된 문자열
      String clientId = "kp3doapYNuP0ZnBoS7df";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "3RslIcqvIn";//애플리케이션 클라이언트 시크릿값";
        try {
            String text = URLEncoder.encode(vo.getText(), "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            // post request
            String postParams = "source="+vo.getSource()+"&target="+vo.getTarget()+"&text=" + text;
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.writeBytes(postParams);
            wr.flush();
            wr.close();
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            System.out.println(response.toString());
            jsonParse = response.toString();
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return jsonParse;
   }
   
   @ResponseBody
   @RequestMapping(value="/saveTranslate",  produces = "application/text; charset=utf8", method=RequestMethod.POST)
   public String saveTranslate(TextVO vo) {
      String jsonParse = ""; //JSON 형태로 변환된 문자열
      String clientId = "kp3doapYNuP0ZnBoS7df";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "3RslIcqvIn";//애플리케이션 클라이언트 시크릿값";
        try {
            String text = URLEncoder.encode(vo.getText(), "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            // post request
            String postParams = "source="+vo.getSource()+"&target="+vo.getTarget()+"&text=" + text;
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.writeBytes(postParams);
            wr.flush();
            wr.close();
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            System.out.println(response.toString());
            jsonParse = response.toString();
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return jsonParse;
   }
   
}