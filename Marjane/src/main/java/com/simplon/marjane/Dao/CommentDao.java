package com.simplon.marjane.Dao;

import com.simplon.marjane.entity.CommentEntity;

import java.util.List;

public class CommentDao extends AbstractHibernateDao<CommentEntity> {

    public CommentDao() {
        tableName = "comment";
        setClazz(CommentEntity.class);
    }

    // find all comments
    public List getAllComments() {
        return findAll();
    }

    // find one comment by id
    public CommentEntity getCommentById(long id) {
        return findOne(id);
    }


    // create comment
    public boolean createComment(CommentEntity comment) {
        create(comment);
        return true;
    }

    // update comment
    public CommentEntity updateComment(CommentEntity comment) {
        return update(comment);
    }

    // delete comment
    public void deleteComment(CommentEntity comment) {
        delete(comment);
    }

    // delete comment by id
    public void deleteCommentById(long id) {
        deleteById(id);
    }


}
