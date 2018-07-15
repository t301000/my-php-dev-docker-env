<?php
    /**
     * 處理登入 / 登出
     */

    require_once __DIR__ . '/../bootstrap.php';

    $op = $_REQUEST['op'] ?? 'invalid';

    switch ($op) {
        // NTPC OpenID 登入，已通過規則檢查
        case 'ntpcLogin':
            echo 'login by ntpc openid';
            dd($_SESSION['ntpc_user_data']);
            $user['account'] = $_SESSION['ntpc_user_data']['openid_username'];
            $user['name'] = $_SESSION['ntpc_user_data']['real_name'];
            $_SESSION['user'] = $user;
            dd($_SESSION['user']);
            unset($_SESSION['ntpc_user_data']);
            break;
        // 本地端帳號登入
        case 'localLogin':
            echo 'login by local';
            break;
        // 登出
        case 'logout':
            echo 'you have logouted';
            unset($_SESSION['user']);
            break;

        default:
            echo 'other invalid action';
    }
