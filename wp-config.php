<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

define( 'DB_USER', 'wordpress_user' );

define( 'DB_PASSWORD', 'password' );

define( 'DB_HOST', 'localhost' );

define( 'DB_CHARSET', 'utf8' );

define( 'DB_COLLATE', '' );

define('FS_METHOD', 'direct');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '4jVt(+:pw;e,<NFU|,_9i>AjE?h0R-<-3I|<N#J!CtNQ%&IINbQG5@j(ma}PnWs1');
define('SECURE_AUTH_KEY',  'l4VM4Z/KpJ~(lxZ^GGC1AJE-:d+> )sZvM@H`m)05|k@`Oo?A}/L8)!lL,*fUzz>');
define('LOGGED_IN_KEY',    'Jn}##BO.>f(N.t+uOrEkIOF+pl+7F`5CYWA++C%ZEp[oGsSQX$s)JnUDO`]h+A?(');
define('NONCE_KEY',        '2VvtEQ9>Z:`v._8*hUVk]-91DLKK9=6X=sq.Ec@:/2k.l;QJRPB4|cH%3ny~HYh^');
define('AUTH_SALT',        '-nTnVnO8K+,vM^>kHihYYk>TLh_LD_&vWLrWWa~|(.m2XGkM9f+G9Bu9P%W08~D`');
define('SECURE_AUTH_SALT', 'X^`@ eB>)OJ2E9c5~A=V99BjX;0/nIF~8Ir}mUEw&E3I%BKnFRU,eNI$f7Ej{W)q');
define('LOGGED_IN_SALT',   '/sGZ}6h=6J)OmwVZv|dH/;ch9.ED~:}:z7_bjc+VsPU1Ud?!$D2=_|9$(O ;z9jR');
define('NONCE_SALT',       '5JRl,E%)[lWfCp_9}81TALZQ:@9vps0ovmRXB#y0eQ;UqnG4nm<7OWu!HRY:yaPD');

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';