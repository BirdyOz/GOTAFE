<?php

$THEME->name = 'gotafe_hr';
$THEME->doctype = 'html5';
$THEME->parents = array('bootstrapbase');
$THEME->sheets = array('gotafe_hr', 'scorm', 'tiles', 'responsive', 'effects');
$THEME->supportscssoptimisation = false;
$THEME->yuicssmodules = array();

$THEME->editor_sheets = array();

$THEME->plugins_exclude_sheets = array(
    /*'block' => array(
        'html',
    ),*/
    'gradereport' => array(
        'grader',
    ),
);

// special class tells Moodle to look for renderers first within the theme and then in all of the other default locations.
$THEME->rendererfactory = 'theme_overridden_renderer_factory';
$THEME->csspostprocess = 'theme_gotafe_hr_process_css';

$THEME->blockrtlmanipulations = array(
    'side-pre' => 'side-post',
    'side-post' => 'side-pre'
);

//$THEME->enable_dock = true;