$(document).ready(function() {
    var e, a, d, n, i, t, s = "", p = $("ul.breadcrumb span[itemprop='title']"), r = $(p[2]).text();
    e = "Courses" === r || "NCEE" === r || "NCDE" === r || "HR" === r ? r : "Main", 
    $("header#page-header").addClass(e);
    var l = $("ul.breadcrumb a[title] span").text(), g = /^(.*)\:(.*)\((.*)\)/gi, h = g.exec(l);
    h && (a = h[1].split("|").sort(), a = $.map(a, function(e) {
        return e.trim();
    }), n = 1 === a.length ? '<div id ="codes"><span>Code: </span>' + a + "</div>" : '<div id ="codes"><span>Codes: </span>' + a.slice(0, a.length - 1).join(", ") + " & " + a[a.length - 1] + "</div>", 
    $(".page-header-headings").append(n), i = h[2].trim(), $(".page-header-headings > h1").text(i), 
    d = h[3].split(","), d = $.map(d, function(e) {
        return e.trim();
    }), 1 === d.length ? s = d[0] : (t = '<div id ="audience"><span>Audience: </span>' + d.slice(0, d.length - 1).join(", ") + "</div>", 
    $(".page-header-headings").append(t), s = d[d.length - 1]), $(".page-header-headings").prepend('<div id ="year" class="panel pull-right text-center"> <div class="panel-body ">' + s + "</div>"), 
    "ID" == s.substring(0, 2) && ($("#year").prepend('<div class="panel-heading">In Development</div>'), 
    $("#year").addClass("panel-danger")));
});