package com.simplon.marjane.entity;

import jakarta.persistence.*;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "category", schema = "public", catalog = "marjane")
public class CategoryEntity implements Serializable {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "c_id")
    private long cId;
    @Basic
    @Column(name = "c_name")
    private String cName;

    @OneToMany(mappedBy = "rrRayon")
    private Set<RespRayonEntity> respRayons = new LinkedHashSet<>();

    @OneToMany(mappedBy = "pCategory")
    private Set<PromotionEntity> promotions = new LinkedHashSet<>();




    public Set<PromotionEntity> getPromotions() {
        return promotions;
    }

    public void setPromotions(Set<PromotionEntity> promotions) {
        this.promotions = promotions;
    }

    public Set<RespRayonEntity> getRespRayons() {
        return respRayons;
    }

    public void setRespRayons(Set<RespRayonEntity> respRayons) {
        this.respRayons = respRayons;
    }

    public long getcId() {
        return cId;
    }

    public void setcId(long cId) {
        this.cId = cId;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CategoryEntity that = (CategoryEntity) o;

        if (cId != that.cId) return false;
        if (cName != null ? !cName.equals(that.cName) : that.cName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (cId ^ (cId >>> 32));
        result = 31 * result + (cName != null ? cName.hashCode() : 0);
        return result;
    }
}
