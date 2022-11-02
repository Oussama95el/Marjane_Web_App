package com.simplon.marjane.Dao;

import com.simplon.marjane.entity.AdminEntity;
import com.simplon.marjane.entity.SuperAdminEntity;
import jakarta.persistence.NoResultException;

import java.util.List;

import static com.simplon.marjane.utils.MainUtils.print;
import static com.simplon.marjane.utils.MainUtils.println;
import static com.simplon.marjane.utils.Security.checkPassword;
import static com.simplon.marjane.utils.Security.hashPassword;

public class SuperAdminDao extends AbstractHibernateDao<SuperAdminEntity> {

    public SuperAdminDao() {
        tableName = "super_admin";
        setClazz(SuperAdminEntity.class);
    }

    //
    public boolean validateSuperAdminLogin(Object[] login){
        String email = (String) login[0];
        String password = (String) login[1];
        SuperAdminEntity sa = getSuperAdminByEmail(email);
        if (sa != null){
            if (checkPassword(password, sa.getSaPassword())){
                println("connected with success");
                return true;
            }else {
                println("wrong password");
                return false;
            }
        }else {
            println("wrong email");
            return false;
        }


    }
    // find all superAdmins
    public List getAllSuperAdmins() {
        return findAll();
    }

    // find one superAdmin by id
    public SuperAdminEntity getSuperAdminById(long id) {
        return findOne(id);
    }

    // find one superAdmin by email
    public SuperAdminEntity getSuperAdminByEmail(String email) {
        return jpaService.runInTransaction(entityManager -> {
            try {
                SuperAdminEntity superAdmin = entityManager.createQuery("select sa from SuperAdminEntity sa WHERE sa.saEmail = :email", SuperAdminEntity.class)
                        .setParameter("email", email)
                        .getSingleResult();
                return superAdmin;
            } catch (NoResultException e) {
                return null;
            }
        });
    }

    // delete superAdmin
    public void deleteSuperAdmin(SuperAdminEntity superAdmin) {
        delete(superAdmin);
    }
    // delete superAdmin by id
    public void deleteSuperAdminById(long id) {
        deleteById(id);
    }



}
