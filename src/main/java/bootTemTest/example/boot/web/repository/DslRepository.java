package bootTemTest.example.boot.web.repository;

import java.util.List;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.querydsl.core.types.dsl.BooleanExpression;
import com.querydsl.jpa.impl.JPAQueryFactory;

import bootTemTest.example.boot.web.domain.Item;
import static bootTemTest.example.boot.web.domain.QItem.item;

@Repository
public class DslRepository {

	EntityManager em;
    JPAQueryFactory query;

    @Autowired
    public DslRepository(EntityManager em, JPAQueryFactory query) {
        this.em = em;
        this.query = query;
    }

    public List<Item> findAll(String itemName, Integer price) {
        return query.select(item)
                .from(item)
                .where(
                        likeItemName(itemName),
                        maxPrice(price)
                )
                .fetch();
    }

    private BooleanExpression maxPrice(Integer maxPrice) {
        if (maxPrice != null) {
            return item.price.loe(maxPrice);
        }
        return null;
    }

    private BooleanExpression likeItemName(String itemName){
        if(StringUtils.hasText(itemName)){
            return item.itemName.like("%" + itemName + "%");
        }
        return null;
    }
}
