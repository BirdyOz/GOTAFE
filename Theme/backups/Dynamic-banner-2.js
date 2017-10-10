/*
* @Author: Greg Bird (@BirdyOz)
* @Date:   2016-12-08 11:32:42
* @Last Modified by:   BirdyOz
* @Last Modified time: 2016-12-08 11:33:35
*/

$(document).ready(function() {
    // Define global variables
    var logo, codes_array, details_array, code_text, title_text, audience_text, year_text = "";

    // Extract breadcrumbs.  Create an array
    var breadcrumbs = $("ul.breadcrumb span[itemprop='title']");

    // Extract branding
    var branding = $(breadcrumbs[2]).text();

    // If one of GOTAFE's named sub-brandings
    if (branding === 'Courses' || branding === 'NCEE' || branding === 'NCDE' || branding === 'HR') {
        logo = branding;
    } else {
        logo = "Main";
    }

    //Add class to banner.  This will allow for custom logos (sub-branding)
    $('header#page-header').addClass(logo);

    // Extract course short description from breadcrumbs.  It is set as the only anchor with a title attribute within ul.breadcrumb
    var description = $("ul.breadcrumb a[title] span").text();

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
            audience_text = "<div id =\"audience\"><span>Audience: <\/span>" + details_array.slice(0, details_array.length - 1).join(", ") + "<\/div>";
            $('.page-header-headings').append(audience_text);
            year_text = details_array[details_array.length - 1];
        }

        // Update Page Headings to prepend year.  Add as a bootstrap panel
        $('.page-header-headings').prepend("<div id =\"year\" class=\"panel pull-right text-center\"> <div class=\"panel-body \">" + year_text + "<\/div>");

        // Is this subject 'In Development'?
        if (year_text.substring(0, 2) == "ID") {
            // Add footer to 'Year' panel
            $('#year').prepend("<div class=\"panel-heading\">In Development<\/div>");
            $('#year').addClass("panel-danger");
        }
    }

});