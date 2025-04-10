package by.tishalovichm.problems.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "difficulties")
@NoArgsConstructor
@Getter
public class Difficulty {

    @Id
    private Short id;

    private String name;

}
