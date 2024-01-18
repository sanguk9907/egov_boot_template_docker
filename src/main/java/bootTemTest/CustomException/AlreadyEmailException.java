package bootTemTest.CustomException;

public class AlreadyEmailException extends Exception {
	public AlreadyEmailException(String message) {
		super(message);
	}
}
