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
import com.zhiyou.model.JsonResult;
import com.zhiyou.service.RoleService;

@Controller
@RestController
public class RoleController {

	@Autowired
	RoleService roleService;
	
	@RequestMapping("selectAllRole")
	private String selectAllDept(String keyword,Integer pageNo,HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		JsonResult jr = new JsonResult();
		try{
			jr.setState(200);
			jr.setData(roleService.selectAllRole());
		} catch (Exception e) {
			e.printStackTrace();
			jr.setState(500);
			jr.setError("服务端错误，请稍后重试！");
		}
		return JSONObject.toJSONString(jr);
	}
	
}
