package com.simplon.marjane.Dao;

import com.simplon.marjane.entity.SubCategoryEntity;

import java.util.List;

public class SubCategoryDao extends AbstractHibernateDao<SubCategoryEntity> {

        public SubCategoryDao() {
            tableName = "subcategory";
            setClazz(SubCategoryEntity.class);
        }

        // find all subcategories
        public List getAllSubCategories() {
            return findAll();
        }

        // find one subcategory by id
        public SubCategoryEntity getSubCategoryById(long id) {
            return findOne(id);
        }

        // find one subcategory by name
        public SubCategoryEntity getSubCategoryByName(String name) {
            return jpaService.runInTransaction(entityManager -> {
                return entityManager.createQuery("select s from SubCategoryEntity s WHERE s.scName = :name", SubCategoryEntity.class)
                        .setParameter("name", name)
                        .getSingleResult();
            });
        }
        // get all subcategories where category id = id
        public List getAllSubCategoriesByCategoryId(long id) {
            return jpaService.runInTransaction(entityManager -> {
                return entityManager.createQuery("select s from SubCategoryEntity s WHERE s.scCategory = :id", SubCategoryEntity.class)
                        .setParameter("id", id)
                        .getResultList();
            });
        }

        // create subcategory
        public void createSubCategory(SubCategoryEntity subCategory) {
            create(subCategory);
        }

        // update subcategory
        public SubCategoryEntity updateSubCategory(SubCategoryEntity subCategory) {
            return update(subCategory);
        }

        // delete subcategory
        public void deleteSubCategory(SubCategoryEntity subCategory) {
            delete(subCategory);
        }

        // delete subcategory by id
        public void deleteSubCategoryById(long id) {
            deleteById(id);
        }

}
