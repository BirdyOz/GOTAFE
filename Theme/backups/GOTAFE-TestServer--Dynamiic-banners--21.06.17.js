/*
*  @Author   : Greg Bird (@BirdyOz, greg.bird.oz@gmail.com)
*  @Created  : 2017-03-31 13:08:18
*  @Modified : 2017-06-21 12:12:05
*/


/*
 *
 * This script dymanically builds a Moodle course banner to include:
 *   - Dynamic branding (logos) - This removes the requirement for 5 separate themes (Main, Course, NCEE, NCDE, HR)
 *   - Descriptive title
 *   - Code(s)
 *   - Year
 *   - Audience (if provided)
 *   - A badge to indicate the site is in development (if appropriate)
 */


// Ensure that jQuery does not conflict with any Moodle code
$.noConflict();
jQuery(document).ready(function($) {
    // $(document).ready(function() {
    // Define global variables
    var logo, codes_array, details_array, code_text, title_text, audience_text, year_text = "";

    //Set default branding logo to 'Main'
    logo = "Main";


    // Extract breadcrumbs.  Create an array
    var breadcrumbs = $("ul.breadcrumb span[itemprop='title']");

    // Loop through the breadcrumbs, looking for sub-branding
    $(breadcrumbs).each(function() {
        var breadcrumb = $(this).text();

        // If one of the major sub-brandings
        if (breadcrumb === 'NCEE' || breadcrumb === 'NCDE' || breadcrumb === 'HR') {
            logo = breadcrumb;
            // If I have found my match, break out of the loop
            return false;
        }
        // Convert breadcrumb into "slug", then add class to #page-header.
        // This will allow for more granular sub-branding, once banner images have been developed

        var breadcrumb_class = "breadcrumbs-" + slugify(breadcrumb);
        $('header#page-header').addClass(breadcrumb_class);
    });

    //Add class to banner.  This will allow for custom logos (sub-branding)
    $('header#page-header').addClass(logo);

    // Extract course short description from breadcrumbs.  It is the current banner header
    var description = $('.page-header-headings > h1').text();

    // This regex pattern matches the GOTAFE 2017 course naming convention
    //  UNIT CODE: Unit Title ([Audience, ]Year)
    //      OR
    //  UNIT CODE 1 | UNIT CODE 2 | UNIT CODE 3: Cluster Title([Audience, ]Year)
    //
    // Examples:
    //  HLTEN511B: Provide nursing care for clients requiring palliative care (2016)
    //  AHCHBR203A: Provide daily care for horses (VETIS, 2016)
    //  SITXMPR501: Obtain and manage sponsorship (Hosp, 2016)
    //  BSBWOR502A: Ensure Team Effectiveness (ID16)
    //  AHCWRK502A | AHCWRK503A: Reports & Data Cluster 1 (Wine, ID17)
    //
    // Capture groups:
    // /^(.*)\:(.*)\((.*)\)
    //    $1    $2    $3
    //  $1 - Code(s)
    //  $2 - Descriptive title
    //  $3 - Audience (if defined) & Year

    var re = /^(.*)\:(.*)\((.*)\)/gi;
    var TitleArray = re.exec(description);


    // Only parses title if it matches the naming convention; ie it matches the pattern defined by the regex
    // This is to avoid unnecessary processing of descriptions that do not match the naming convention
    if (TitleArray) {

        // Extract codes_array
        codes_array = TitleArray[1].split("|").sort();
        // Trim whitespace
        codes_array = $.map(codes_array, function(value) {
            return value.trim();
        });

        // For each code, add class to #page-header.
        // This will allow for more granular sub-branding, once banner images have been developed
        $.each(codes_array, function(index, val) {
            var code_class = "code-" + slugify(val);
            $('header#page-header').addClass(code_class);
        });

        // If there is more than one code
        if (codes_array.length === 1) {
            // Single Unit of Comptency
            code_text = "<div id =\"codes\"><span>Code: <\/span>" + codes_array + "<\/div>";

        } else {
            // Cluster of 2 or more units
            // concatenate with ", ".  Use " & " before the last code
            code_text = "<div id =\"codes\"><span>Codes: <\/span>" + codes_array.slice(0, codes_array.length - 1).join(", ") + " & " + codes_array[codes_array.length - 1] + "<\/div>";
        }
        // Append below banner heading
        $('.page-header-headings').append(code_text);

        // Extract descriptive title
        title_text = TitleArray[2].trim();

        // Update banner heading, to match descriptive title
        $('.page-header-headings > h1').text(title_text);

        // Extract year and audience
        details_array = TitleArray[3].split(",");
        details_array = $.map(details_array, function(value) {
            return value.trim();
        });

        // Separate out year from audience
        if (details_array.length === 1) {
            year_text = details_array[0];
        } else {
            // If there is an audience, add it to the banner
            audience_str = details_array.slice(0, details_array.length - 1).join(", ");
            audience_text = "<div id =\"audience\"><span>Audience: <\/span>" + audience_str + "<\/div>";
            $('.page-header-headings').append(audience_text);

            // Add 'Audience' class to #page-header.
            var audience_class = "audience-" + slugify(audience_str);
            $('header#page-header').addClass(audience_class);
            year_text = details_array[details_array.length - 1];
        }

        // Update Page Headings to prepend year.  Add as a bootstrap panel
        $('.page-header-headings').prepend("<div id =\"year\" class=\"panel pull-right text-center\"> <div class=\"panel-body \">" + year_text + "<\/div>");

        // Add 'Year' class to #page-header.
        var year_class = "year-" + slugify(year_text);
        $('header#page-header').addClass(year_class);

        // Is this subject 'In Development'?
        if (year_text.substring(0, 2) === "ID") {
            // Add footer to 'Year' panel
            $('#year').prepend("<div class=\"panel-heading\">In Development<\/div>");
            $('#year').addClass("panel-danger");
        }


        // DEBUG ONLY - IF TEST BANNER
        if (year_text.substring(0, 2) === "TB") {
            // Add footer to 'Year' panel
            $('#year').prepend("<div class=\"panel-heading\">TEST BANNER<\/div>");
            $('#year').addClass("panel-danger");
            // add test-banner to #page to allow for selective addition of custom banners
            $('#page').addClass("test-banner");
        }
    }

    // Add copyright statement
    var cc = ""
    $('.page-header-headings').append(audience_text);

    // Change title of ReadSpeaker Block
    $('.block_readspeaker_embhl .title h2').text("Listen to this page");

    // Add additional instructions to the ReadSpeaker block
    $('.block_readspeaker_embhl>.content').append("<small>Highlight the text that you would like to hear, then click the 'play' button. <br> <a  target=\"_blank\" href=\"https://youtu.be/6RpliafTRDI\">(Watch a tutorial)</a> </small>");
});


function slugify(text) {
    // https://gist.github.com/mathewbyrne/1280286
    return text.toString().toLowerCase()
        .replace(/\s+/g, '-') // Replace spaces with -
        .replace(/[^\w\-]+/g, '') // Remove all non-word chars
        .replace(/\-\-+/g, '-') // Replace multiple - with single -
        .replace(/^-+/, '') // Trim - from start of text
        .replace(/-+$/, '') // Trim - from end of text
        .replace(/[\s_-]+/g, '-');
}