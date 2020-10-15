package com.zhiyou.model;

/**
 *  将java类封装为json结果
 *  @author 王洪志
 *
 */
public class JsonResult{
    private int state;
    private Object Data;
    private String error = "";
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}

	public Object getData() {
		return Data;
	}
	public void setData(Object data) {
		Data = data;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	} 
}
