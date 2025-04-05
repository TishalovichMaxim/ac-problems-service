package by.tishalovichm.problems.dtos.out;

import lombok.Getter;
import org.springframework.data.domain.Page;

import java.util.List;

record PageInfo(
    Long totalCount
) {
}

@Getter
public class PagedResponse<E> {

    private final List<E> content;

    private final PageInfo pageInfo;

    public PagedResponse(Page<E> page) {
        content = page.getContent();
        pageInfo = new PageInfo(page.getTotalElements());
    }

}
