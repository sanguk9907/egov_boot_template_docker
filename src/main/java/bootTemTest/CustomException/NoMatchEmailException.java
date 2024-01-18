package bootTemTest.CustomException;

public class NoMatchEmailException extends Exception {
	public NoMatchEmailException(String message) {
		super(message);
	}
}
