package com.heatokpia.config;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.jasypt.encryption.pbe.config.SimpleStringPBEConfig;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.ulisesbocchio.jasyptspringboot.annotation.EnableEncryptableProperties;

@Configuration
@EnableEncryptableProperties
public class AppConfigForJasyptStarter {

	@Bean("encryptorBean")
    public StandardPBEStringEncryptor stringEncryptor() {
        StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
        SimpleStringPBEConfig config = new SimpleStringPBEConfig();
        
        config.setPoolSize(1);
        config.setPassword(""); // 여기에 보내드린 키 입력하고 이부분 노출 안되게 해주세요
        config.setAlgorithm("PBEWithMD5AndDES");
        
        encryptor.setConfig(config);
        
        return encryptor;
    }
}
