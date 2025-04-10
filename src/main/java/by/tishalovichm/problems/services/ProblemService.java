package by.tishalovichm.problems.services;

import by.tishalovichm.problems.auth.AuthManager;
import by.tishalovichm.problems.dtos.out.PagedResponse;
import by.tishalovichm.problems.entities.Problem;
import by.tishalovichm.problems.repositories.ProblemRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ProblemService {

    private final ProblemRepository repository;

    private final AuthManager authManager;

    public PagedResponse<Problem> getAll(
        String authenticateHeader,
        Pageable pageable
    ) {
        authManager.getUserIdentity(authenticateHeader);

        return new PagedResponse<>(repository.findAll(pageable));
    }

}
