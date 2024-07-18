package com.h3hitema.examBack.provider;

import org.springframework.cloud.openfeign.FallbackFactory;
import org.springframework.stereotype.Component;

@Component
public class SendEmailFallbackFactory implements FallbackFactory<EmailSenderProxy> {
    @Override
    public EmailSenderProxy create(Throwable cause) {
        return new MailSenderProxyFallbackProxy(cause) {
        };
    }
}
