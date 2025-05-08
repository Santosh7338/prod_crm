package com.omfys.crm.apis.responsedto;

import lombok.Data;

@Data
public class GlobalResponse {
	
	private String errorCode;
	private String errorDescription;
	
	private int contactsize;
	private int docsize;
}
