package com.simplon.marjane.Dao;

import com.simplon.marjane.entity.CategoryEntity;
import com.simplon.marjane.entity.CommentEntity;
import com.simplon.marjane.entity.PromotionEntity;
import com.simplon.marjane.entity.RespRayonEntity;
import com.simplon.marjane.utils.MainUtils;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;


public class PromotionDao extends AbstractHibernateDao<PromotionEntity>{


    public PromotionDao(){
        tableName = "promotion";
        setClazz(PromotionEntity.class);
    }

    // find all promotions
    public List<PromotionEntity> getAllPromotions() {
        return findAll();
    }

    // find one promotion by id
    public PromotionEntity getPromotionById(long id) {
        return findOne(id);
    }

    // find one promotion by category
    public List<PromotionEntity> getAllPromotionByCategory(CategoryEntity category) {
        return jpaService.runInTransaction(entityManager -> {
            return entityManager.createQuery("select p from PromotionEntity p WHERE p.pCategory = :category", PromotionEntity.class)
                    .setParameter("category", category)
                    .getResultList();
        });
    }
    // create promotion
    public boolean createPromotion(PromotionEntity promotion) {
            create(promotion);
            return true;
    }

    // if current Time is between 8 and 12 update promotion status is possible
    public boolean updatePromotionStatusBasedOnTime(PromotionEntity promotion, String status) {
        LocalTime currentTime = LocalTime.now();
        if (currentTime.isAfter(LocalTime.of(8, 0)) && currentTime.isBefore(LocalTime.of(18, 0))) {
            // create update query where promotion category is equal to promotion category
            return jpaService.runInTransaction(entityManager -> {
                entityManager.createQuery("update PromotionEntity p set p.pStatus = :status where p.pCategory = :category AND p.id = :id")
                        .setParameter("status", status)
                        .setParameter("category", promotion.getPCategory())
                        .setParameter("id", promotion.getId())
                        .executeUpdate();
                return true;
            });
        }else{
            return false;
        }
    }
    // update all promotions status based on expiration date and current date
    public boolean updatePromotionStatusBasedOnDate() {
        // get all promotions
        List<PromotionEntity> promotions = getAllPromotions();
        // stream promotions and get the promotion with expiration date less than current date and status is PENDING
        promotions.stream().filter(p -> p.getPExpireDate().isBefore(LocalDate.now()) && p.getPStatus().equals("PENDING")).forEach(p -> {
            // update promotion status to EXPIRED
            updatePromotionStatusBasedOnTime(p, "EXPIRED");
        });
        return true;
    }

    // function to update automatically promotion status based on expiration date if status is pending change to expired
    public void updatePromotionStatusBasedOnExpirationDate() {
        LocalDate currentDate = LocalDate.now();
        PromotionDao promotionDao = new PromotionDao();
        List<PromotionEntity> promotions = promotionDao.getAllPromotions();
        promotions.forEach(promotion -> {
            if (promotion.getPStatus().equals("PENDING") && promotion.getPExpireDate().isBefore(currentDate)) {
                jpaService.runInTransaction(entityManager -> {
                    return entityManager.createQuery("update PromotionEntity p set p.pStatus = 'EXPIRED' where p.id = :id")
                            .setParameter("id", promotion.getId())
                            .executeUpdate();
                });
            }
        });
    }

    // update comment by promotion id
    public boolean updatePromotionComment(PromotionEntity promotion, CommentEntity comment) {
        return jpaService.runInTransaction(entityManager -> {
            entityManager.createQuery("update PromotionEntity p set p.comments = :comment where p.id = :id")
                    .setParameter("comment", comment)
                    .setParameter("id", promotion.getId())
                    .executeUpdate();
            return true;
        });
    }

    public static void main(String[] args) {
        PromotionDao promotionDao = new PromotionDao();
        CommentEntity comment = new CommentDao().getCommentById(1);

        promotionDao.updatePromotionComment(promotionDao.getPromotionById(10), comment);
    }
}
