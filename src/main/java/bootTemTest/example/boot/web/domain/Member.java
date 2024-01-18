package bootTemTest.example.boot.web.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Data
@Entity
public class Member {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long mbNo;
	
	private String mbEmail;
    private String mbPass;
    private String mbNickname;
    private String mbGroup;
    private String mbStatus;
    private String regdate;
    private String update;
    

}
