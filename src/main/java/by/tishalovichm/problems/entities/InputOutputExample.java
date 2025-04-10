package by.tishalovichm.problems.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "examples")
@NoArgsConstructor
@Getter
public class InputOutputExample {

    @Id
    private Short id;

    private String input;

    private String output;

    private String explanation;

}
