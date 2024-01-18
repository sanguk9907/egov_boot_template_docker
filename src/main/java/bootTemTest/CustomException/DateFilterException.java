package bootTemTest.CustomException;

import java.util.HashMap;

import org.springframework.ui.ModelMap;

public class DateFilterException extends Exception {

	ModelMap model;
	String view;

	public DateFilterException(String message) {
		super(message);
	}

	public DateFilterException(String message, ModelMap model, String view) {
		super(message);
		this.model = model;
		this.view = view;
	}

	public HashMap<String, Object> getModel() {
		return model;
	}

	public String getView() {
		return view;
	}
}
