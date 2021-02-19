package com.heatokpia.domain;

public enum BoardCategory {

	free(0),info(1);
	
	private int categoryNum;
	
	private BoardCategory(int categoryNum) {
		this.categoryNum = categoryNum;
	}
	
	public int getCategoryNum() {
		return categoryNum;
	}
}
