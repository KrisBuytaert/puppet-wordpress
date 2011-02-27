define wordpress::site (
$ip, $port, $serveradmin, $documentroot = '' , $servername ,  
$db_name, $db_user,  $servername, $db_password, $db_host, $serveralias) {
  
  
  vhosts::host {"$servername":
			ip => "$ip",
			port => "$port",
			servername => "$servername",
			documentroot => "$documentroot",
			serveradmin => "$serveradmin",
			serveralias => "$serveralias"
		}	

  file {
    "${servername}":
      path => "${documentroot}/wp-config.php", 
      ensure => file,
      content => template("wordpress/wp-config-sample.php.erb"),
  }
  
}
