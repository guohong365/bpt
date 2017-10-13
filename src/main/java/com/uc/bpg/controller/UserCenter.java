package com.uc.bpg.controller;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.uc.bpg.domain.UserImpl;
import com.uc.bpg.domain.UserProfileImpl;
import com.uc.bpg.service.UserDetailService;
import com.uc.web.controller.ControllerBaseImpl;

@Controller
public class UserCenter extends ControllerBaseImpl {	
	
	@Resource(name="${service.user}")
	UserDetailService userService;

	@RequestMapping(value="/changePwd", method=RequestMethod.POST, produces="text/html;charset=UTF-8")	
	public @ResponseBody String doChangePwd(
			@RequestParam(value="password", required=true) String oldPwd,
			@RequestParam(value="newPassword", required=true) String newPwd){
		UserProfileImpl userInfo=(UserProfileImpl) this.getUser();
		assert userInfo!=null;		
		getLogger().info("change password for user:" + userInfo.getUser().getName());
		getLogger().debug("original pwd=[" + userInfo.getUser().getPassword() + "]");
		getLogger().debug("old pwd=[" + oldPwd+"]");
		getLogger().debug("new pwd=[" + newPwd + "]");
		UserImpl user=(UserImpl) userService.selectById(userInfo.getUser().getId());
		if(user!=null && user.getPassword().equals(oldPwd)){
			userService.updatePassword(user.getId(), newPwd);
			getLogger().info("update pwd as:" + newPwd);
			return "OK";
		} else{
			return "旧密码有误，修改失败！";
		}
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login(){
		return "/login";
	}
}
