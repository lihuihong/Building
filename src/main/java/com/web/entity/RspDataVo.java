package com.web.entity;

import java.util.List;

public class RspDataVo<T> extends RspVo {
	private int count;// 数据条数，
	private List<T> data;// 数据列表

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public List<T> getData() {
		return data;
	}

	public void setData(List<T> data) {
		this.data = data;
	}

}