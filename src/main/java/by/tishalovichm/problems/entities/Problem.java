package by.tishalovichm.problems.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "problems")
public class Problem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "name")
    private String name;

    @ManyToOne
    @JoinColumn(name = "section-id")
    private ProblemSection section;

    @ManyToOne
    @JoinColumn(name = "difficulty-id")
    private Difficulty difficulty;

    @Column(name = "description")
    private String description;

    @OneToMany
    @JoinColumn(name = "problem-id")
    private List<InputOutputExample> inputOutputExamples;

}
