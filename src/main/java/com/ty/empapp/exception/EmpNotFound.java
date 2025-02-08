package com.ty.empapp.exception;

public class EmpNotFound extends RuntimeException{

	private String message;

	public EmpNotFound(String message) {
		this.message = message;
	}

	public EmpNotFound() {	}
	
	@Override
	public String getMessage() {
		return message;
	}
}
