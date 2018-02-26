package com.auv.controller.login;

import com.auv.model.User;
import com.auv.service.serviceInterface.UserBasicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

//import com.viva4u.pojo.User;
//import com.viva4u.service.userService;

@Controller
public class loginController {
//	@Autowired()
	/*@Qualifier("userserviceimpl")
	userService userService;*/
	@Autowired
	UserBasicService userBasicService;
	@RequestMapping("/")
	public String main() {
		return "main";
	}
	@RequestMapping("/login")
    public String login(@RequestParam("uname") String name, String pwd){
	    System.out.println(name+":"+pwd);
        User user = userBasicService.getByName(name);
        if(user.getPassword().equals(pwd)){
//            return "loginSuc";
			return "pageNation";
        }else return "main";
    }
    @RequestMapping("/Vue")
	public String Vue(){
		return "testVue";
	}
	@RequestMapping("/pageQuery")
	@ResponseBody
	public Map pageQuery(Integer pageSize, Integer pageNumber){
		Map<String,Object> params = new HashMap<String, Object>();
		System.out.println("pageSize:"+pageSize+",pageNumber:"+pageNumber);
		System.out.println(params.size());
		params.put("pageSize",pageSize);
		params.put("pageNumber",(pageNumber-1)*pageSize);
		System.out.println(params.size());
		return userBasicService.pageQuery(params);
	}
	/*@RequestMapping("/reg")
	public String reg() {
		return "reg";
	}
	@SuppressWarnings("unused")
	@RequestMapping("/loginSuc")
	public String  loginSuccess(@RequestParam("name") String uname,@RequestParam("password") String pwd,Model model) {
		User user = userService.getUserByNameService(uname);
		System.out.println(user);
		System.out.println(user.getUserName());
		
		if(user!=null) {
			if(pwd.equals(user.getPassword())) {
				model.addAttribute("name", uname);
				return "loginSuc";
			}else {
				model.addAttribute("message", "瀵嗙爜涓嶆纭�");
			}
		}else {
			model.addAttribute("message", "鐢ㄦ埛涓嶅瓨鍦�");
		}
		return "main";
	}*/
}
