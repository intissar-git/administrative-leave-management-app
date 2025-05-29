package com.helloIftekhar.springJwt.dto;


import lombok.*;



@Getter
@Setter
public class DemandeStatsDTO {
    // Getters et Setters
    private long approuvees;
    private long refusees;
    private long enAttente;
    private long enCoursDeTraitement;
    private long total;

    // Constructeurs
    public DemandeStatsDTO() {}

    public DemandeStatsDTO(long approuvees, long refusees, long enAttente) {
        this.approuvees = approuvees;
        this.refusees = refusees;
        this.enAttente = enAttente;
        this.total = approuvees + refusees + enAttente;
    }
    //ajouter par RH
    public DemandeStatsDTO(long approuvees, long refusees, long enAttente,long enCoursDeTraitement) {
        this.approuvees = approuvees;
        this.refusees = refusees;
        this.enAttente = enAttente;
        this.enCoursDeTraitement = enCoursDeTraitement;
        this.total = approuvees + refusees + enAttente + enCoursDeTraitement;
    }

}