package com.h3hitema.examBack.config.exception;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import org.springframework.dao.OptimisticLockingFailureException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;


@RestControllerAdvice
@RequiredArgsConstructor
public class RestProcessorAdvices {

    
    public static final String OBJECT_OPTIMISTIC_LOCK = " Impossible de modifier cette fiche car elle "
            + "est déjà en cours de modification par un autre utilisateur. Merci de recharger la fiche.";


    @ExceptionHandler(OptimisticLockingFailureException.class)
    @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
    @ResponseBody
    public ErrorInfo handleObjectLockException(HttpServletRequest req) {
        return new ErrorInfo(req.getRequestURL().toString(), OBJECT_OPTIMISTIC_LOCK);
    }
}
