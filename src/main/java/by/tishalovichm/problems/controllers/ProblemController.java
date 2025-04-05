package by.tishalovichm.problems.controllers;

import by.tishalovichm.problems.dtos.out.PagedResponse;
import by.tishalovichm.problems.entities.Problem;
import by.tishalovichm.problems.services.ProblemService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("problems")
@CrossOrigin(origins = "http://localhost:5173")
@RequiredArgsConstructor
public class ProblemController {

    private final ProblemService problemService;

    @GetMapping
    public PagedResponse<Problem> getAll(
        @RequestHeader("Authorization") String authorizationHeader,
        Pageable pageable
    ) {
        return problemService.getAll(authorizationHeader, pageable);
    }

}
