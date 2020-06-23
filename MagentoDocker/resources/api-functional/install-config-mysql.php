<?php
/**
 * Magento console installer options for Web API functional tests. Are used in functional tests bootstrap.
 *
 * Copyright © Magento, Inc. All rights reserved.
 * See COPYING.txt for license details.
 */
return [
    'language'                     => 'en_US',
    'timezone'                     => 'America/Los_Angeles',
    'currency'                     => 'USD',
    'db-host'                      => 'mage.ua',
    'db-name'                      => 'magento',
    'db-user'                      => 'root',
    'db-password'                  => '12345abc',
    'backend-frontname'            => 'admin',
    'base-url'                     => 'http://mage.ua/',
    'use-secure'                   => '0',
    'use-rewrites'                 => '0',
    'admin-lastname'               => 'Admin',
    'admin-firstname'              => 'Admin',
    'admin-email'                  => 'admin@example.com',
    'admin-user'                   => 'admin',
    'admin-password'               => '12345abc',
    'admin-use-security-key'       => '0',
    /* PayPal has limitation for order number - 20 characters. 10 digits prefix + 8 digits number is good enough */
    'sales-order-increment-prefix' => time(),
    'session-save'                 => 'db',
    'cleanup-database'             => true,
];
