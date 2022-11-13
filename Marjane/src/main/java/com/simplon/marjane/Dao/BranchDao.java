package com.simplon.marjane.Dao;

import com.simplon.marjane.entity.BranchEntity;

import java.util.List;

public class BranchDao extends AbstractHibernateDao<BranchEntity> {

    public BranchDao() {
        tableName = "branch";
        setClazz(BranchEntity.class);
    }

    // find all branches
    public List getAllBranches() {
        return findAll();
    }

    // find one branch by id
    public BranchEntity getBranchById(long id) {
        return findOne(id);
    }
}
