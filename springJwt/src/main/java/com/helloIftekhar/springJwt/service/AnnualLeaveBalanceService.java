package com.helloIftekhar.springJwt.service;

import com.helloIftekhar.springJwt.model.SoldeConge;
import com.helloIftekhar.springJwt.repository.SoldeCongeRepository;
import com.helloIftekhar.springJwt.repository.UserRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.time.Year;
import java.util.Optional;

@Service
public class AnnualLeaveBalanceService {

    @Autowired
    private SoldeCongeRepository soldeCongeRepository;

    @Autowired
    private UserRepository userRepository;

    @Scheduled(cron = "0 0 0 1 1 *") // Exécution le 1er janvier à minuit
    @Transactional
    public void updateLeaveBalancesForNewYear() {
        int newYear = Year.now().getValue();

        userRepository.findAll().forEach(user -> {
            // Récupérer le solde de l'année précédente
            Optional<SoldeConge> lastYearBalance = soldeCongeRepository
                    .findByEmployeeAndAnnee(user, newYear - 1);

            int soldeAnneePrecedente = lastYearBalance
                    .map(SoldeConge::getSoldeAnneeCourante)
                    .orElse(0);

            // Créer le nouveau solde pour la nouvelle année
            SoldeConge newBalance = new SoldeConge();
            newBalance.setEmployee(user);
            newBalance.setAnnee(newYear);
            newBalance.setSoldeAnneeCourante(22); // Nouveau solde
            newBalance.setSoldeAnneePrecedente(soldeAnneePrecedente);
            newBalance.setSoldeGlobal(22 + soldeAnneePrecedente);

            soldeCongeRepository.save(newBalance);
        });
    }
}