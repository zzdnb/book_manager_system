package com.zzd.controller;

import com.zzd.entity.ZZD_1813004745_User;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * @author 张振东
 * @version V1.0
 * @Title:
 * @Package
 * @Description: (用一句话描述该文件做什么)
 * @date：
 */
@Controller
public class ZZD_1813004745_UserController {

	@PostMapping("/users/loginUser")
	@ResponseBody
	public String login(HttpSession session, @RequestBody ZZD_1813004745_User user) {
		String username = user.getUsername();
		String password = user.getPassword();
		if (!StringUtils.isEmpty(username) && "123456".equals(password)) {
//  登录成功
			System.out.println(username);
			session.setAttribute("loginUser",username);
			return "success";//"redirect:/books/details1";
		} else {
			System.out.println(username);
			return "failure";
		}

	}
}
