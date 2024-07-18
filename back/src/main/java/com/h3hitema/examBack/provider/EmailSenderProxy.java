package com.h3hitema.examBack.provider;

import com.h3hitema.examBack.dto.MailDataDto;
import com.h3hitema.examBack.dto.Response;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

@FeignClient(value = "mailSend",
        url = "${application.sayaaraty_mail_sender}/email",
        fallbackFactory = SendEmailFallbackFactory.class)
public interface EmailSenderProxy {

    @PostMapping()
    Response sendConfirmationMail(@RequestBody MailDataDto dto);
}
