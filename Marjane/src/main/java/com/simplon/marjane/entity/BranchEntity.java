package com.simplon.marjane.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "branch", schema = "public", catalog = "marjane")
public class BranchEntity {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "b_id")
    private long bId;
    @Basic
    @Column(name = "b_city")
    private long bCity;
    @Basic
    @Column(name = "b_adress")
    private String bAdress;

    @OneToOne
    @JoinColumn(name = "b_admin")
    private AdminEntity bAdmin;

    public long getbId() {
        return bId;
    }

    public void setbId(long bId) {
        this.bId = bId;
    }

    public long getbCity() {
        return bCity;
    }

    public void setbCity(long bCity) {
        this.bCity = bCity;
    }

    public String getbAdress() {
        return bAdress;
    }

    public void setbAdress(String bAdress) {
        this.bAdress = bAdress;
    }

    public AdminEntity getbAdmin() {
        return bAdmin;
    }

    public void setbAdmin(AdminEntity bAdmin) {
        this.bAdmin = bAdmin;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BranchEntity that = (BranchEntity) o;

        if (bId != that.bId) return false;
        if (bCity != that.bCity) return false;
        if (bAdmin != that.bAdmin) return false;
        if (bAdress != null ? !bAdress.equals(that.bAdress) : that.bAdress != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (bId ^ (bId >>> 32));
        result = 31 * result + (int) (bCity ^ (bCity >>> 32));
        result = 31 * result + (bAdress != null ? bAdress.hashCode() : 0);
        result = 31 * result + (bAdmin != null ? bAdmin.hashCode() : 0);
        return result;
    }
}
