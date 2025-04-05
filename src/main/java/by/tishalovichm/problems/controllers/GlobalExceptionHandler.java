package by.tishalovichm.problems.controllers;

import by.tishalovichm.problems.auth.exceptions.UnauthorizedException;
import by.tishalovichm.problems.dtos.out.ApiErrorDtoOut;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(UnauthorizedException.class)
    public ResponseEntity<ApiErrorDtoOut> unauthorizedException(UnauthorizedException exception) {
        return ResponseEntity
            .status(HttpStatus.UNAUTHORIZED)
            .body(new ApiErrorDtoOut("Wrong token"));
    }

}
