<?php

require 'src/facebook.php';

$facebook = new Facebook(array(
  'appId'  => '269833686366667',
  'secret' => 'e513b34acaa65a9b58bc8187e08255a7',
));

$user = $facebook->getUser();

if ($user) {
  try {
    $user_profile = $facebook->api('/me');
  } catch (FacebookApiException $e) {
    error_log($e);
    $user = null;
  }
}

if ($user) {
  $logoutUrl = $facebook->getLogoutUrl();
} else {
  $loginUrl = $facebook->getLoginUrl();
}

?>


    <?php if ($user){
		if( $Redirection == "1" ){
            //echo $user;
            $naitik = $facebook->api('/'.$user);
		?>

				<object id="tales" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="32" height="32">
  				<param name="movie" value="http://www.grupogcuatro.com/facebook/drogas/Flash/drugs.swf" />
  				<param name="quality" value="high" />
  				<embed src="http://www.grupogcuatro.com/facebook/drogas/Flash/drugs.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="757" height="760"></embed>
				</object>



    		<div id="fb-root"></div>
    		<script src="http://connect.facebook.net/en_US/all.js"></script>

                <script>

      			FB.init({
        			appId:'212206645498298', cookie:true,
        			status:true, xfbml:true
      			});

     			function publicarMensaje(valor){
				var hola="<?php echo $naitik['name']; ?>";
        			var publish = {
          				method: 'feed',
	  				name: 'Las Drogas de Tony',
	  				caption: '\n' + hola + " Ha caido en las drogas con una resistencia fue de: " + valor +" \n\n ",
	  				description: ( '' ),
	  				link: 'http://apps.facebook.com/ladrogeria/',
	  				picture: 'http://www.grupogcuatro.com/facebook/drogas/images/juego.jpg',
	  				ref:'carisma'
        			};
        			FB.ui(publish);
                    return ("Hola gente");
      			}

    			</script>


		<?php }else{ ?>
		<script type="text/javascript"> location.href ="http://apps.facebook.com/carisma/?Redirection=1"; </script>

    <?php
		}
	}else{ ?>
	<a href="<?php echo $loginUrl; ?>">Cliqueame</a>
    <?php } ?>
