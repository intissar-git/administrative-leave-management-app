package com.helloIftekhar.springJwt.repository;

import com.helloIftekhar.springJwt.model.ReligiousHoliday;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface ReligiousHolidayRepository extends JpaRepository<ReligiousHoliday, Long> {
    List<ReligiousHoliday> findByStartDateBetween(LocalDate start, LocalDate end);

    @Query("SELECT CASE WHEN COUNT(h) > 0 THEN true ELSE false END " +
            "FROM ReligiousHoliday h " +
            "WHERE h.name = :name AND YEAR(h.startDate) = :year")
    boolean existsByNameAndYear(@Param("name") String name, @Param("year") int year);

    @Query("SELECT CASE WHEN COUNT(h) > 0 THEN true ELSE false END " +
            "FROM ReligiousHoliday h " +
            "WHERE h.name = :name AND YEAR(h.startDate) = :year AND h.id <> :id")
    boolean existsByNameAndYearAndIdNot(
            @Param("name") String name,
            @Param("year") int year,
            @Param("id") Long id
    );

}