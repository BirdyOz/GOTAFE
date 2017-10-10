<?php

function theme_gotafe_course_process_css($css, $theme) {

    /****************************
    Set Logo as background image
    *****************************/
    $logo = $theme->setting_file_url('logo', 'logo');
    $css = theme_gotafe_course_set_logo($css, $logo);

    // Set custom CSS.
    if (!empty($theme->settings->customcss)) {
        $customcss = $theme->settings->customcss;
    } else {
        $customcss = null;
    }
    $css = theme_gotafe_course_set_customcss($css, $customcss);

    // Set favicon.
	//    if (!empty($theme->settings->favicon)) {
	//        $favicon = $theme->settings->favicon;
	//    } else {
	//        $favicon = null;
	//    }
	// $css = theme_gotafe_course_set_favicon($css, $favicon);

    
	
	/****************************
    Sets Page background color.
    *****************************/
    if (!empty($theme->settings->backgroundcolor)) {
        $backgroundcolor = $theme->settings->backgroundcolor;
    } else {
        $backgroundcolor = null;
    }
    $css = gotafe_course_set_backgroundcolor($css, $backgroundcolor);
    
    
	/****************************
    Sets Header background color.
    *****************************/
    if (!empty($theme->settings->headerbgcolor)) {
        $headerbgcolor = $theme->settings->headerbgcolor;
    } else {
        $headerbgcolor = null;
    }
    $css = gotafe_course_set_headerbgcolor($css, $headerbgcolor);
	
	
	/*******************************************
    Set Page-nav (breadcrumb) background color.
    *******************************************/
    if (!empty($theme->settings->pagenavbgcolor)) {
        $pagenavbgcolor = $theme->settings->pagenavbgcolor;
    } else {
        $pagenavbgcolor = null;
    }
    $css = gotafe_course_set_pagenavbgcolor($css, $pagenavbgcolor);

	
    /****************************
    Sets block's text header color
    *****************************/
    if (!empty($theme->settings->blockheadertextcolor)) {
        $blockheadertextcolor = $theme->settings->blockheadertextcolor;
    } else {
        $blockheadertextcolor = null;
    }
    $css = gotafe_course_set_blockheadertextcolor($css, $blockheadertextcolor);
    
    //Sets block's header background colour
    /*
	if (!empty($theme->settings->blockheaderbgcolor)) {
        $blockheaderbgcolor = $theme->settings->blockheaderbgcolor;
    } else {
        $blockheaderbgcolor = null;
    }
    $css = gotafe_course_set_blockheaderbgcolor($css, $blockheaderbgcolor);
	*/
	
	
	//Sets block's background colour
    if (!empty($theme->settings->blockbgcolor)) {
        $blockbgcolor = $theme->settings->blockbgcolor;
    } else {
        $blockbgcolor = null;
    }
    $css = gotafe_course_set_blockbgcolor($css, $blockbgcolor);
	
	
    /**************************
    Set primary dark color.
    ***************************/
    if (!empty($theme->settings->primarydarkcolor)) {
        $primarydarkcolor = $theme->settings->primarydarkcolor;
    } else {
        $primarydarkcolor = null;
    }
    $css = gotafe_course_set_primarydarkcolor($css, $primarydarkcolor);

	
    /**************************
    Set primary accent color.
    ***************************/
    if (!empty($theme->settings->primarylightcolor)) {
        $primarylightcolor = $theme->settings->primarylightcolor;
    } else {
        $primarylightcolor = null;
    }
    $css = gotafe_course_set_primarylightcolor($css, $primarylightcolor);

    return $css;
}


function theme_gotafe_course_set_logo($css, $logo) {
    global $OUTPUT;
    $tag = '[[setting:logo]]';
    $replacement = $logo;
    if (is_null($replacement)) {
        $replacement = $OUTPUT->pix_url('logo','theme');
        //$replacement = 'gotafe_course/pix/logo.png';
    }
    $css = str_replace($tag, $replacement, $css);
    return $css;
}

/**
 * Serves any files associated with the theme settings.
 *
 * @param stdClass $course
 * @param stdClass $cm
 * @param context $context
 * @param string $filearea
 * @param array $args
 * @param bool $forcedownload
 * @param array $options
 * @return bool
 */
function theme_gotafe_course_pluginfile($course, $cm, $context, $filearea, $args, $forcedownload, array $options = array()) {
    if ($context->contextlevel == CONTEXT_SYSTEM and $filearea === 'logo') {
        $theme = theme_config::load('gotafe_course');
        return $theme->setting_file_serve('logo', $args, $forcedownload, $options);
    } /*
    elseif ($context->contextlevel == CONTEXT_SYSTEM and $filearea === 'favicon') {
        $theme = theme_config::load('gotafe_course');
        return $theme->setting_file_serve('favicon', $args, $forcedownload, $options);
    } */
    else {
        send_file_not_found();
    }
}


//Sets the background colour variable in CSS
function gotafe_course_set_backgroundcolor($css, $backgroundcolor) {
        $tag = '[[setting:backgroundcolor]]';
        $replacement = $backgroundcolor;
        if (is_null($replacement)) {
                $replacement = '';
        }
        $css = str_replace($tag, $replacement, $css);
        return $css;
}

//Sets the text header color in the block
function gotafe_course_set_blockheadertextcolor($css, $blockheadertextcolor) {
        $tag = '[[setting:blockheadertextcolor]]';
        $replacement = $blockheadertextcolor;
        if (is_null($replacement)) {
            $replacement = '';
        }
        $css = str_replace($tag, $replacement, $css);
        return $css;
}

//Sets the header background color
function gotafe_course_set_headerbgcolor($css, $headerbgcolor) {
        $tag = '[[setting:headerbgcolor]]';
        $replacement = $headerbgcolor;
        if (is_null($replacement)) {
            $replacement = '';
        }
        $css = str_replace($tag, $replacement, $css);
        return $css;
}

//Sets the header background of the block
/*
function gotafe_course_set_blockheaderbgcolor($css, $blockheaderbgcolor) {
        $tag = '[[setting:blockheaderbgcolor]]';
        $replacement = $blockheaderbgcolor;
        if (is_null($replacement)) {
            $replacement = '';
        }
        $css = str_replace($tag, $replacement, $css);
        return $css;
}
*/

//Sets the background of the block
function gotafe_course_set_blockbgcolor($css, $blockbgcolor) {
        $tag = '[[setting:blockbgcolor]]';
        $replacement = $blockbgcolor;
        if (is_null($replacement)) {
            $replacement = '';
        }
        $css = str_replace($tag, $replacement, $css);
        return $css;
}

//Sets the breadcrumb's background color
function gotafe_course_set_pagenavbgcolor($css, $pagenavbgcolor) {
        $tag = '[[setting:pagenavbgcolor]]';
        $replacement = $pagenavbgcolor;
        if (is_null($replacement)) {
            $replacement = '';
        }
        $css = str_replace($tag, $replacement, $css);
        return $css;
}

//Sets the primary dark colour variable in CSS
function gotafe_course_set_primarydarkcolor($css, $primarydarkcolor) {
        $tag = '[[setting:primarydarkcolor]]';
        $replacement = $primarydarkcolor;
        if (is_null($replacement)) {
            $replacement = '';
        }
        $css = str_replace($tag, $replacement, $css);
        return $css;
}

//Sets the primary accent colour variable in CSS
function gotafe_course_set_primarylightcolor($css, $primarylightcolor) {
        $tag = '[[setting:primarylightcolor]]';
        $replacement = $primarylightcolor;
        if (is_null($replacement)) {
            $replacement = '';
        }
        $css = str_replace($tag, $replacement, $css);
        return $css;
}

//Adds any custom CSS to the CSS before it is cached.
function theme_gotafe_course_set_customcss($css, $customcss) {
        $tag = '[[setting:customcss]]';
        $replacement = $customcss;
        if (is_null($replacement)) {
        $replacement = '';
        }
        $css = str_replace($tag, $replacement, $css);
        return $css;
}

/**
 * Returns an object containing HTML for the areas affected by settings.
 *
 * @param renderer_base $output Pass in $OUTPUT.
 * @param moodle_page $page Pass in $PAGE.
 * @return stdClass An object with the following properties:
 *      - bannertext HTML to use for the the header if added. By default ''.
 *      - footnote HTML to use as a footnote. By default ''.
 */
function theme_gotafe_course_get_html_for_settings(renderer_base $output, moodle_page $page) {
    global $CFG;
    $return = new stdClass;

    $return->bannertext = '';
    if (!empty($page->theme->settings->bannertext)) {
        $return->bannertext = '<div class="bannertext text-right">'.$page->theme->settings->bannertext.'</div>';
    }


    $return->footnote = '';
    if (!empty($page->theme->settings->footnote)) {
        $return->footnote = '<div class="footnote text-left">'.$page->theme->settings->footnote.'</div>';
    }

    return $return;
}