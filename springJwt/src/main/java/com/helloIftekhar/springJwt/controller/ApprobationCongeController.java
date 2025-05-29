package com.helloIftekhar.springJwt.controller;

import com.helloIftekhar.springJwt.dto.ApproveRequestDTO;
import com.helloIftekhar.springJwt.dto.DemandeCongeResponseDTO;
import com.helloIftekhar.springJwt.dto.SoldeCongeDTO;
import com.helloIftekhar.springJwt.model.DemandeConge;
import com.helloIftekhar.springJwt.model.SoldeConge;
import com.helloIftekhar.springJwt.model.User;
import com.helloIftekhar.springJwt.repository.DemandeCongeRepository;
import com.helloIftekhar.springJwt.repository.SoldeCongeRepository;
import com.helloIftekhar.springJwt.repository.UserRepository;
import com.helloIftekhar.springJwt.service.DemandeCongeService;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.time.Year;
import java.util.Optional;

@RestController
@RequestMapping("/api/approbation-conge")
@PreAuthorize("hasAnyRole('ADMIN','CHEF_SERVICE','RH')")
public class ApprobationCongeController {

    private final DemandeCongeRepository demandeCongeRepository;
    private final SoldeCongeRepository soldeCongeRepository;
    private final UserRepository userRepository;
    private final DemandeCongeService demandeCongeService;

    public ApprobationCongeController(DemandeCongeRepository demandeCongeRepository,
                                      SoldeCongeRepository soldeCongeRepository,
                                      UserRepository userRepository,
                                      DemandeCongeService demandeCongeService) {
        this.demandeCongeRepository = demandeCongeRepository;
        this.soldeCongeRepository = soldeCongeRepository;
        this.userRepository = userRepository;
        this.demandeCongeService = demandeCongeService;
    }

    @PostMapping("/approuver/{demandeId}")
    @Transactional
    public ResponseEntity<?> approuverDemande(@PathVariable Long demandeId,
                                              @RequestBody ApproveRequestDTO approveRequest) {
        // 1. Vérifier que la demande existe et est en attente
        DemandeConge demande = demandeCongeRepository.findById(demandeId)
                .orElseThrow(() -> new RuntimeException("Demande non trouvée"));

        if (!"EN_COURS_DE_TRAITEMENT".equals(demande.getStatut())) {
            return ResponseEntity.badRequest().body("Seules les demandes EN_COURS_DE_TRAITEMENT peuvent être approuvées");
        }

        // 2. Récupérer l'utilisateur et son solde
        User employe = userRepository.findById(Math.toIntExact(demande.getIdEmployee()))
                .orElseThrow(() -> new RuntimeException("Employé non trouvé"));

        int anneeCourante = Year.now().getValue();
        SoldeConge solde = soldeCongeRepository.findByEmployeeAndAnnee(employe, anneeCourante)
                .orElseGet(() -> creerNouveauSolde(employe, anneeCourante));

        // 3. Vérifier si le solde est suffisant
        if (demande.getDuree() > solde.getSoldeGlobal()) {
            return ResponseEntity.badRequest().body("Solde insuffisant pour approuver cette demande");
        }

        // 4. Mettre à jour le solde
        updateSolde(solde, demande.getDuree());

        // 5. Mettre à jour le statut de la demande
        demande.setStatut("APPROUVE");
        demandeCongeRepository.save(demande);

        // 6. Retourner la réponse
        DemandeCongeResponseDTO response = demandeCongeRepository.findAllWithEmployeeInfo()
                .stream()
                .filter(dto -> dto.getId().equals(demandeId))
                .findFirst()
                .orElseThrow(() -> new RuntimeException("Demande non trouvée"));
        return ResponseEntity.ok(response);
    }

    private SoldeConge creerNouveauSolde(User employe, int annee) {
        // 1. Récupérer le solde de l'année précédente
        int soldeAnneePrecedente = soldeCongeRepository.findLatestByEmployee(employe)
                .map(SoldeConge::getSoldeAnneeCourante)
                .orElse(0);

        // 2. Créer un nouveau solde avec les valeurs par défaut
        SoldeConge nouveauSolde = new SoldeConge();
        nouveauSolde.setEmployee(employe);
        nouveauSolde.setAnnee(annee);
        nouveauSolde.setSoldeAnneeCourante(22); // Valeur par défaut
        nouveauSolde.setSoldeAnneePrecedente(soldeAnneePrecedente);
        nouveauSolde.setSoldeGlobal(22 + soldeAnneePrecedente);

        return soldeCongeRepository.save(nouveauSolde);
    }

    private void updateSolde(SoldeConge solde, int duree) {
        int resteADeduire = duree;

        // 1. D'abord déduire du solde de l'année précédente
        if (solde.getSoldeAnneePrecedente() > 0) {
            int deductionAnneePrecedente = Math.min(solde.getSoldeAnneePrecedente(), resteADeduire);
            solde.setSoldeAnneePrecedente(solde.getSoldeAnneePrecedente() - deductionAnneePrecedente);
            resteADeduire -= deductionAnneePrecedente;
        }

        // 2. Ensuite déduire du solde de l'année courante
        if (resteADeduire > 0) {
            solde.setSoldeAnneeCourante(solde.getSoldeAnneeCourante() - resteADeduire);
        }

        // 3. Mettre à jour le solde global
        solde.setSoldeGlobal(solde.getSoldeAnneeCourante() + solde.getSoldeAnneePrecedente());

        soldeCongeRepository.save(solde);
    }


}