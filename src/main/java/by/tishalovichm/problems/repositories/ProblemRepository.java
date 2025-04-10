package by.tishalovichm.problems.repositories;

import by.tishalovichm.problems.entities.Problem;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.repository.CrudRepository;

public interface ProblemRepository extends CrudRepository<Problem, Long> {

    @EntityGraph(attributePaths = {"section", "difficulty", "inputOutputExamples"})
    Page<Problem> findAll(Pageable pageable);

}
