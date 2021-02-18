package com.heatokpia.domain;

public enum BoardCategory {

	free(false),info(true);
	
	private boolean categorybool;
	
	private BoardCategory(boolean categorybool) {
		this.categorybool = categorybool;
	}
	
	public boolean getBoolType() {
		return categorybool;
	}
}
