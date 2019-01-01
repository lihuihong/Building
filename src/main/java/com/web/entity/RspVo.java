package com.web.entity;

public class RspVo {

	public static final String SUCCESS_DEFAULT_MSG = "操作成功";
	public static final String ERROR_DEFAULT_MSG = "操作失败";

	private int code;// 状态标志，0表示成功，1表示失败
	private String msg = SUCCESS_DEFAULT_MSG;// code说明，建议code为1时，返回 对应说明

	public RspVo() {
		super();
	}
	public RspVo(String msg){
		this.msg = msg;
		this.code = 1;
	}

	public int getCode() {
		return code;
	}

	public String getMsg() {
		return msg;
	}

	public void setErrorMsg(String msg) {
		this.code = 1;
		this.msg = msg;
	}

	public void setSuccessMsg(String msg) {
		this.code = 0;
		this.msg = msg;
	}

	public void setDefaultErrorMsg() {
		this.code = 1;
		msg = RspVo.ERROR_DEFAULT_MSG;
	}

	public void setDefaultSuccessMsg() {
		this.code = 0;
		msg = RspVo.SUCCESS_DEFAULT_MSG;
	}

}