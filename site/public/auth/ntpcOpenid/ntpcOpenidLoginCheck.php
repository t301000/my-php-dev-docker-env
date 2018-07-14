<?php
    /**
     * 檢查登入規則 for NTPC OpenID
     */

    require_once __DIR__ . '/../bootstrap.php';

    if (! isset($_SESSION['user'])) {
        headerTo('../index.php');
    }

    if (count($_SESSION['user']['auth_info']) > 1) {
        // 多重身份時，顯示身份選擇畫面
        showSelector($_SESSION['user']['auth_info']);
    }

    /***************************************************
     * 函數區
     ***************************************************/

    //


    /**
     * 顯示身份選擇畫面
     *
     * @param array $auth_infos  授權資訊
     */
    function showSelector(array $auth_infos) {
        pd($auth_infos);
    }




