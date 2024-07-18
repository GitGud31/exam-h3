package com.h3hitema.examBack.provider;

import com.h3hitema.examBack.dto.MailDataDto;
import com.h3hitema.examBack.dto.Response;
import com.h3hitema.examBack.dto.SendMailStatus;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MailSenderProxyFallbackProxy implements EmailSenderProxy {
    Throwable cause;
    public MailSenderProxyFallbackProxy(Throwable cause) {
        this.cause = cause;
    }
    @Override
    public Response sendConfirmationMail(MailDataDto dto) {
        log.error(cause.getMessage());
        return new Response(SendMailStatus.Failed.name());
    }
}
