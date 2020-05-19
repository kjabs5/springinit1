package com.kjabs.springinit1.DAO;

public class HashGenerationException extends RuntimeException {

	public HashGenerationException(String message) {
		super(message);
	}

	public HashGenerationException(String message, Throwable cause) {
		super(message, cause);
	}
}