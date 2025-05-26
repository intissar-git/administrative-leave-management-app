package com.helloIftekhar.springJwt.dto;

import lombok.Getter;

@Getter
public class ApproveRequestDTO {
    private String commentaire;

    public void setCommentaire(String commentaire) {
        this.commentaire = commentaire;
    }
}