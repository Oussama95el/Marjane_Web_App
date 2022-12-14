package com.simplon.marjane.entity;

import jakarta.persistence.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "promotion", schema = "public")
public class PromotionEntity implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "p_id", nullable = false)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "p_category", nullable = false)
    private CategoryEntity pCategory;

    @Column(name = "p_start_date", nullable = false)
    private LocalDate pStartDate;

    @Column(name = "p_expire_date", nullable = false)
    private LocalDate pExpireDate;

    @Column(name = "p_rate", nullable = false, precision = 5, scale = 2)
    private BigDecimal pRate;

    @Column(name = "p_point_fidelite")
    private Integer pPointFidelite;

    @Column(name = "p_status", length = 100 , nullable = false)
    private String pStatus = "PENDING";

    @OneToMany(mappedBy = "cPromotion")
    private Set<CommentEntity> comments = new LinkedHashSet<>();

    public Set<CommentEntity> getComments() {
        return comments;
    }

    public void setComments(Set<CommentEntity> comments) {
        this.comments = comments;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public CategoryEntity getPCategory() {
        return pCategory;
    }

    public void setPCategory(CategoryEntity pCategory) {
        this.pCategory = pCategory;
    }

    public LocalDate getPStartDate() {
        return pStartDate;
    }

    public void setPStartDate(LocalDate pStartDate) {
        this.pStartDate = pStartDate;
    }

    public LocalDate getPExpireDate() {
        return pExpireDate;
    }

    public void setPExpireDate(LocalDate pExpireDate) {
        this.pExpireDate = pExpireDate;
    }

    public BigDecimal getPRate() {
        return pRate;
    }

    public void setPRate(BigDecimal pRate) {
        this.pRate = pRate;
    }

    public Integer getPPointFidelite() {
        return pPointFidelite;
    }

    public void setPPointFidelite(Integer pPointFidelite) {
        this.pPointFidelite = pPointFidelite;
    }

    public String getPStatus() {
        return pStatus;
    }

    public void setPStatus(String pStatus) {
        this.pStatus = pStatus;
    }


    public PromotionEntity(CategoryEntity pCategory, LocalDate pStartDate, LocalDate pExpireDate, BigDecimal pRate, Integer pPointFidelite) {
        this.pCategory = pCategory;
        this.pStartDate = pStartDate;
        this.pExpireDate = pExpireDate;
        this.pRate = pRate;
        this.pPointFidelite = pPointFidelite;
    }
    public PromotionEntity() {
    }

    // toString
//    @Override
//    public String toString() {
//        return
//                "\n--------------------------- PromotionEntity  " + id +" -------------------------"+
//                "\n Category = " + pCategory.getcName() +
//                "\n StartDate = " + pStartDate +
//                "\n ExpireDate = " + pExpireDate +
//                "\n Rate = " + pRate +"%"+
//                "\n Point Fidelite =" + pPointFidelite + " points"+
//                "\n Status = " + pStatus;
//    }
}