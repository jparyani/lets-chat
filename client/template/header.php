<!DOCTYPE HTML>

<html lang="en">

<head>

<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />

<title><?php $this->put('page_title'); ?> - <?php $this->put('site_title'); ?></title>

<link rel="stylesheet" type="text/css" href="<?php $this->put('media_url'); ?>/css/bootstrap.css" />

<link rel="stylesheet" type="text/css" href="<?php $this->put('media_url'); ?>/css/bootstrap-custom.css" />

<link rel="stylesheet" type="text/css" href="<?php $this->put('media_url'); ?>/css/style.css" />

<script src="<?php $this->put('media_url'); ?>/js/jquery.min.js" type="text/javascript"></script>
<script src="<?php $this->put('media_url'); ?>/js/jquery.url.js" type="text/javascript"></script>

<script src="<?php $this->put('media_url'); ?>/js/mustache.js" type="text/javascript"></script>

<script src="<?php $this->put('media_url'); ?>/js/soundmanager2-jsmin.js" type="text/javascript"></script>

<script src="<?php $this->put('media_url'); ?>/js/bootstrap-transition.js" type="text/javascript"></script>
<script src="<?php $this->put('media_url'); ?>/js/bootstrap-modal.js" type="text/javascript"></script>
<script src="<?php $this->put('media_url'); ?>/js/bootstrap-buttons.js" type="text/javascript"></script>

<script src="http://127.0.0.1:8111/socket.io/socket.io.js" type="text/javascript"></script>

<script>

	soundManager.debugMode = false;
	soundManager.debugFlash = false;
	soundManager.url = '<?php $this->put('media_url'); ?>/swf/';
	soundManager.flashVersion = 9;
	soundManager.useFlashBlock = false;
	var SFX_URL = '<?php $this->put('media_url'); ?>/sfx/';
	var SFX_VOLUME = 40
	var SFX_LIBRARY = {
		message: 'message.mp3',
		event: 'event.mp3'
	};
</script>
<script src="<?php $this->put('media_url'); ?>/js/sounds.js" type="text/javascript"></script>
<script src="<?php $this->put('media_url'); ?>/js/client.js" type="text/javascript"></script>

<?php $this->load('js-templates'); ?>

</head>

<body>