<?php

defined('MOODLE_INTERNAL') || die;

if ($ADMIN->fulltree) {

        // Logo file setting.
        $name = 'theme_gotafe_hr/logo';
        $title = get_string('logo','theme_gotafe_hr');
        $description = get_string('logodesc', 'theme_gotafe_hr');
        //$default = '';
        $setting = new admin_setting_configstoredfile($name, $title, $description, 'logo');
        $setting->set_updatedcallback('theme_reset_all_caches');
        $settings->add($setting);

        // favicon file setting
        /*
        $name = 'theme_gotafe_hr/favicon';
        $title = get_string('favicon','theme_gotafe_hr');
        $description = get_string('favicondesc', 'theme_gotafe_hr');
        $setting = new admin_setting_configstoredfile($name, $title, $description, 'favicon');
            $setting->set_updatedcallback('theme_reset_all_caches');
        $settings->add($setting);
        */

        //Banner header text color setting
        $name = 'theme_gotafe_hr/bannertext';
        $title = get_string('bannertext', 'theme_gotafe_hr');
        $description = get_string('bannertextdesc', 'theme_gotafe_hr');
        $default = '';
        $setting = new admin_setting_confightmleditor($name, $title, $description, $default);
        $setting->set_updatedcallback('theme_reset_all_caches');
        $settings->add($setting);

		//Header background colour setting
        $name = 'theme_gotafe_hr/headerbgcolor';
        $title = get_string('headerbgcolor','theme_gotafe_hr');
        $description = get_string('headerbgcolordesc', 'theme_gotafe_hr');
        $default = '#dedede';
        $previewconfig = array('selector'=>'#page-header', 'style'=>'background');
        $setting = new admin_setting_configcolourpicker($name, $title, $description, $default, $previewconfig);
        $settings->add($setting);

        //Page background colour setting
        $name = 'theme_gotafe_hr/backgroundcolor';
        $title = get_string('backgroundcolor','theme_gotafe_hr');
        $description = get_string('backgroundcolordesc', 'theme_gotafe_hr');
        $default = '#dedede';
        $previewconfig = array('selector'=>'body', 'style'=>'backgroundColor');
        $setting = new admin_setting_configcolourpicker($name, $title, $description, $default, $previewconfig);
        $settings->add($setting);

        //Page-nav (Breadcrumb) background colour setting
        $name = 'theme_gotafe_hr/pagenavbgcolor';
        $title = get_string('pagenavbgcolor','theme_gotafe_hr');
        $description = get_string('pagenavbgcolordesc', 'theme_gotafe_hr');
        $default = '#333333';
        $previewconfig = array('selector'=>'#page-navbar', 'style'=>'background');
        $setting = new admin_setting_configcolourpicker($name, $title, $description, $default, $previewconfig);
        $settings->add($setting);

         //Block header background color setting
        /*
		$name = 'theme_gotafe_hr/blockheaderbgcolor';
        $title = get_string('blockheaderbgcolor','theme_gotafe_hr');
        $description = get_string('blockheaderbgcolordesc', 'theme_gotafe_hr');
        $default = '#103D70';
        $previewconfig = array('selector'=>'.block .header', 'style'=>'background');
        $setting = new admin_setting_configcolourpicker($name, $title, $description, $default, $previewconfig);
        $settings->add($setting);
		*/

		//Block background color setting
        $name = 'theme_gotafe_hr/blockbgcolor';
        $title = get_string('blockbgcolor','theme_gotafe_hr');
        $description = get_string('blockbgcolordesc', 'theme_gotafe_hr');
        $default = '#ffffff';
        $previewconfig = array('selector'=>'.block .content', 'style'=>'background');
        $setting = new admin_setting_configcolourpicker($name, $title, $description, $default, $previewconfig);
        $settings->add($setting);

        //Block header text color setting
        $name = 'theme_gotafe_hr/blockheadertextcolor';
        $title = get_string('blockheadertextcolor','theme_gotafe_hr');
        $description = get_string('blockheadertextcolordesc', 'theme_gotafe_hr');
        $default = '#ffffff';
        $previewconfig = array('selector'=>'.block .header h2', 'style'=>'color');
        $setting = new admin_setting_configcolourpicker($name, $title, $description, $default, $previewconfig);
        $settings->add($setting);

        //Primary light colour setting (for links etc)
        $name = 'theme_gotafe_hr/primarylightcolor';
        $title = get_string('primarylightcolor','theme_gotafe_hr');
        $description = get_string('primarylightcolordesc', 'theme_gotafe_hr');
        $default = '#1659a5';
        $previewconfig = array('selector'=>'a:link', 'style'=>'color');
        $setting = new admin_setting_configcolourpicker($name, $title, $description, $default, $previewconfig);
        $settings->add($setting);

		//Primary dark colour setting (for links etc)
        $name = 'theme_gotafe_hr/primarydarkcolor';
        $title = get_string('primarydarkcolor','theme_gotafe_hr');
        $description = get_string('primarydarkcolordesc', 'theme_gotafe_hr');
        $default = '#103d70';
        $previewconfig = array('selector'=>'a:link', 'style'=>'color');
        $setting = new admin_setting_configcolourpicker($name, $title, $description, $default, $previewconfig);
        $settings->add($setting);

        //Custom CSS file
        $name = 'theme_gotafe_hr/customcss';
        $title = get_string('customcss', 'theme_gotafe_hr');
        $description = get_string('customcssdesc', 'theme_gotafe_hr');
        $default = '';
        $setting = new admin_setting_configtextarea($name, $title, $description, $default);
        $setting->set_updatedcallback('theme_reset_all_caches');
        $settings->add($setting);

        //Footnote setting
        $name = 'theme_gotafe_hr/footnote';
        $title = get_string('footnote', 'theme_gotafe_hr');
        $description = get_string('footnotedesc', 'theme_gotafe_hr');
        $default = '';
        $setting = new admin_setting_confightmleditor($name, $title, $description, $default);
        $setting->set_updatedcallback('theme_reset_all_caches');
        $settings->add($setting);

}