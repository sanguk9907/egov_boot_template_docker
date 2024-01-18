package bootTemTest.example.boot.web.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Data
@Entity
public class DupliLogingCheck {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long ck_no;
	
	Long mbNo;
	String loginsession;
	String regdate;
	String update;
	
}
