package bootTemTest.CustomException;

public class NoMatchPrivateKeyException extends Exception {
	public NoMatchPrivateKeyException() {
	}

	public NoMatchPrivateKeyException(String message) {
		super(message);
	}
}
