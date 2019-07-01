package com.hypertrac.commons;

public class Constants {
	
	public String getConstant(int id) {
		String progress = "";
		switch(id) {
		case 0 : 
			progress = "Open";
			break;
		case 1 : 
			progress = "In Progress";
			break;
		case 2 : 
			progress = "On Hold";
			break;
		case 3 :
			progress = "Redirected";
			break;
		case 4 :
			progress = "Completed";
			break;
		case 5 : 
			progress = "Closed";
			break;
		case 6 :
			progress = "Rejected";
			break;
		default:
			progress = "Not Available";
			break;
		}
		return progress;
	}
}
