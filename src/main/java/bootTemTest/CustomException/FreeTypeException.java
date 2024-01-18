package bootTemTest.CustomException;

public class FreeTypeException extends Exception {

	String status;
	String code;

	public FreeTypeException(String message, String status, String code) {
		super(message);
		this.status = status;
		this.code = code;
	}

	public FreeTypeException(String message) {
		super(message);
	}

	public String GetStatus() {
		return status;
	}

	public String GetCode() {
		return code;
	}
}
