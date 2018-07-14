<?php
    /**
     * NTPC OpenID Config
     */

    // 用於 OpenID
    define('DOMAIN_NAME', 'localhost');
    // OpenID 取得欄位
    define('OPENID_REQUIRED', [
        // 'namePerson/friendly', // 暱稱
        'contact/email', // email
        'namePerson', // 姓名
        // 'birthDate', // 生日，1985-06-12
        'person/gender', // 性別，M 男
        // 'contact/postalCode/home', // 識別碼
        // 'contact/country/home', // 單位簡稱，xx國中
        'pref/language', // 年級班級座號，6 碼
        'pref/timezone' // 授權資訊，含單位代碼、單位全銜、職務別、職稱別、身份別等資料，陣列
    ]);
    // 是否使用假資料，須同時開啟除錯才有效
    define('FAKE_OPENID_USER', true);
