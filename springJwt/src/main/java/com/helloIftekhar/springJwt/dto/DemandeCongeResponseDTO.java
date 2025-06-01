package com.helloIftekhar.springJwt.dto;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;
@Data
public class DemandeCongeResponseDTO {
    // Getters et Setters
    @Getter
    @Setter
    private Long id;
    @Setter
    private Long idEmployee;
    @Setter
    @Getter
    private Date dateCreation;
    @Getter
    @Setter
    private Date dateDebut;
    @Getter
    @Setter
    private Date dateFin;
    @Getter
    @Setter
    private String motif;
    @Getter
    @Setter
    private String statut;
    @Getter
    @Setter
    private int duree;
    @Getter
    @Setter
    private String remplacerPar;
    private String employeeName;
    private String departement;
    private String role;
    private String serviceName;
    private String motifRefus;
    private String remplacantArab;

    private String nomArab;
    private String prenomArab;
    private String gradeArab;
    private String echelleArab;
    private int soldeGlobal;
private int soldeAnneePrecedente;
private  int soldeAnneeCourante;
private String username; // Ajoutez ce champ


    public DemandeCongeResponseDTO() {
    }

    public DemandeCongeResponseDTO(Long id, Long idEmployee, String employeeName, String departement,
                                   Date dateCreation, Date dateDebut, Date dateFin,
                                   String motif, String statut, int duree, String remplacerPar,String role,String serviceName,String remplacantArab,String nomArab,String prenomArab,String gradeArab,String echelleArab,int soldeGlobal
,int soldeAnneePrecedente,int soldeAnneeCourante,String username) {
        this.id = id;
        this.idEmployee = idEmployee;
        this.employeeName = employeeName;
        this.departement = departement;
        this.dateCreation = dateCreation;
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
        this.motif = motif;
        this.statut = statut;
        this.duree = duree;
        this.remplacerPar = remplacerPar;
        this.role=role;
        this.serviceName=serviceName;
        this.remplacantArab=remplacantArab;
        this.nomArab=nomArab;
        this.prenomArab=prenomArab;
        this.gradeArab=gradeArab;
        this.echelleArab=echelleArab;
        this.soldeGlobal=soldeGlobal;
        this.soldeAnneePrecedente=soldeAnneePrecedente;
        this.soldeAnneeCourante=soldeAnneeCourante;
        this.username = username;


    }

    public Long getIdEmployee() {
        return idEmployee;
    }


}