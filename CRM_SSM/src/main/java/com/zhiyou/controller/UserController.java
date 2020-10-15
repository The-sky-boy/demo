package com.zhiyou.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.zhiyou.model.JsonResult;
import com.zhiyou.model.User;
import com.zhiyou.service.UserService;

@Controller
@RestController
public class UserController {

	@Autowired
	UserService userService;
	
	@RequestMapping("login")
	public String login(User inputUser, HttpServletRequest req, HttpServletResponse resp) {
		// 交给service层处理
		User user = userService.login(inputUser);
		JsonResult jr = new JsonResult();
		if (user == null) {// 登录失败
			// 用户不存在或密码错误
			jr.setState(0);
			jr.setError("用户名不存在或密码错误！");
			return JSONObject.toJSONString(jr);
		} else {// 登录成功
			// 将user放入session中
			req.getSession().setAttribute("USER", user);
			jr.setState(1);
			return JSONObject.toJSONString(jr);
		}
	}
	@RequestMapping("showUser")
	private String show(String keyword,Integer pageNo,HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		JsonResult jr = new JsonResult();
		try{
			PageInfo<User> pageInfo = userService.selectByKeyword(pageNo,keyword);
			jr.setState(200);
			jr.setData(pageInfo);
		} catch (Exception e) {
			e.printStackTrace();
			jr.setState(500);
			jr.setError("服务端错误，请稍后重试！");
		}
		return JSONObject.toJSONString(jr);
	}
	// 更新
	@RequestMapping("updateUser")
	private String update(User user, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		JsonResult jr = new JsonResult();
		try{
			userService.update(user);
			jr.setState(200);
			if(user.getUser_id()==((User)req.getSession().getAttribute("USER")).getUser_id()){
				// 被修改人是 当前登录的用户
				req.getSession().setAttribute("USER",user);
			}
		} catch (Exception e) {
			e.printStackTrace();
			jr.setState(500);
			jr.setError("服务端错误，请稍后重试！");
		}
		return JSONObject.toJSONString(jr);
	}
	// 删除：
	@RequestMapping("deleteUser")
	private String delete(Integer user_id, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		JsonResult jr = new JsonResult();
		try{
			userService.delete(user_id);
			jr.setState(200);
		} catch (Exception e) {
			e.printStackTrace();
			jr.setState(500);
			jr.setError("服务端错误，请稍后重试！");
		}
		return JSONObject.toJSONString(jr);
	}
	// 添加：
	@RequestMapping("addUser")
	private String add(User user, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		JsonResult jr = new JsonResult();
		try{
			userService.add(user);
			jr.setState(200);
		} catch (Exception e) {
			e.printStackTrace();
			jr.setState(500);
			jr.setError("服务端错误，请稍后重试！");
		}
		return JSONObject.toJSONString(jr);
	}
	// 通过id查询
	@RequestMapping("selectUserById")
	private String selectById(Integer user_id, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		JsonResult jr = new JsonResult();
		try{
			User user = userService.selectByUserId(user_id);
			jr.setState(200);
			jr.setData(user);
		} catch (Exception e) {
			e.printStackTrace();
			jr.setState(500);
			jr.setError("服务端错误，请稍后重试！");
		}
		return JSONObject.toJSONString(jr);
	}

}
