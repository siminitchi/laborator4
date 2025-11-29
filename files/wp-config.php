<?php
/**
 * Configurația de bază pentru WordPress
 */

// ** Setări MySQL ** //
define( 'DB_NAME', 'wordpress' );
define( 'DB_USER', 'wordpress' );
define( 'DB_PASSWORD', 'wordpress' );
define( 'DB_HOST', 'localhost' );
define( 'DB_CHARSET', 'utf8mb4' );
define( 'DB_COLLATE', '' );

// ** Chei și săruri de autentificare ** //
// Poți genera un set unic pe https://api.wordpress.org/secret-key/1.1/salt/
define('AUTH_KEY',         'pune aici un string random');
define('SECURE_AUTH_KEY',  'pune aici un string random');
define('LOGGED_IN_KEY',    'pune aici un string random');
define('NONCE_KEY',        'pune aici un string random');
define('AUTH_SALT',        'pune aici un string random');
define('SECURE_AUTH_SALT', 'pune aici un string random');
define('LOGGED_IN_SALT',   'pune aici un string random');
define('NONCE_SALT',       'pune aici un string random');

// Prefix tabele
$table_prefix = 'wp_';

// Debug (false pentru producție)
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

// Absolut path către directorul WordPress
if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', __DIR__ . '/' );
}

// Include setările WordPress
require_once ABSPATH . 'wp-settings.php';

