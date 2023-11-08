package com.example.tutorial.service;

import com.example.tutorial.model.License;
import lombok.RequiredArgsConstructor;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Locale;
import java.util.Random;

@Service
@RequiredArgsConstructor
public class LicenseService {

    private final MessageSource message;

    public License getLicense(String organizationId, String licenseId) {
        License license = new License();
        license.setId(new Random().nextInt(1000));
        license.setLicenseId(licenseId);
        license.setOrganizationId(organizationId);
        license.setDescription("Software product");
        license.setProductName("Ostock");
        license.setLicenseType("full");
        return license;
    }

    public String createLicense(License license, String organizationId, Locale locale) {
        String responseMessage = null;

        if(!StringUtils.isEmpty(license)) {
            license.setOrganizationId(organizationId);
            responseMessage = String.format(
                    message.getMessage("license.create.message" ,null ,locale),
                    license
            );
        }
        return responseMessage;
    }

    public String updateLicense(License license, String organizationId) {
        String responseMessage = null;

        if(license != null) {
            license.setOrganizationId(organizationId);
            responseMessage = String.format(
                    message.getMessage("license.update.message" ,null ,null),
                    license);
        }
        return responseMessage;
    }

    public String deleteLicense(String licenseId, String organizationId) {
        String responseMessage = null;

        if(licenseId != null) {
            responseMessage = String.format(
                    "License deleted for organization %s %s", organizationId, licenseId);
        }

        return responseMessage;
    }

}
