package com.h3hitema.examBack.config.exception;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
public class ErrorInfo {

    private String url;
    private String message;


    public ErrorInfo(String url, String message) {
        super();
        this.url = url;
        this.message = message;
    }


}
