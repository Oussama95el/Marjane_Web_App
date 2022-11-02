package com.simplon.marjane.view;

import com.simplon.marjane.Dao.AdminDao;
import com.simplon.marjane.Dao.RespRayonDao;
import com.simplon.marjane.Dao.SuperAdminDao;
import com.simplon.marjane.entity.AdminEntity;
import com.simplon.marjane.entity.RespRayonEntity;
import com.simplon.marjane.entity.SuperAdminEntity;
import com.simplon.marjane.services.JpaService;
import com.simplon.marjane.utils.Menus;
import com.simplon.marjane.utils.Security;

import static com.simplon.marjane.utils.MainUtils.*;

public class main {


    private static int choice;
    public static void main(String[] args) {
            // create new super admin
            SuperAdminDao superAdminDao = new SuperAdminDao();
            SuperAdminEntity superAdmin = new SuperAdminEntity();
            superAdmin.setSaName("Super Admin");
            superAdmin.setSaEmail("sa@admin.com");
            superAdmin.setSaPassword(Security.hashPassword("123456"));
            superAdminDao.create(superAdmin);


            choice = Menus.mainMenu();
            if (choice == 1) {
                choice = Menus.loginMenu();
                switch (choice) {
                    // Seperate Users login in 3 cases (SuperAdmin, Admin, Manager)
                    case 1:
                        superAdminWorkFlow();
                        break;
                    case 2:
                        managerWorkflow();
                        break;
                    case 3:
                        respRayonWorkflow();
                        break;
                    case 4:
                        System.exit(0);
                        break;
                    default:
                        System.out.println("Invalid choice");
                }

            }










    }
}