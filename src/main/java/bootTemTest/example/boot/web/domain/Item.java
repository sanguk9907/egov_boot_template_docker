package bootTemTest.example.boot.web.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "item") // 테이블과 클래스이름이 같으면 생략가능
public class Item {

    //    Id : pk라는 선언, GeneratedValue : pk 형식
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "item_name", length = 10) // 컬럼명과 같으면 생략가능
//  jpa에서는 엔티티 필드의 카멜케이스를 자동으로 언더바로 변환시켜준다 itemName => item_name
    private String itemName;
    private Integer price;
    private Integer quantity;

    public Item() {
    }

    public Item(String itemName, Integer price, Integer quantity) {
        this.itemName = itemName;
        this.price = price;
        this.quantity = quantity;
    }
}

