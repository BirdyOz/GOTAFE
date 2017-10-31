"use strict";function slugify(e){return e.toString().toLowerCase().replace(/\s+/g,"-").replace(/[^\w\-]+/g,"").replace(/\-\-+/g,"-").replace(/^-+/,"").replace(/-+$/,"").replace(/[\s_-]+/g,"-")}function friendlyname(e){var a=slugify(e),n="",i={ag:"Agriculture",agedcare:"Aged Care",allhlth:"Allied Health",ansci:"Animal Sciences",auto:"Automotive",beauty:"Beauty",build:"Building and Construction",bus:"Business",cab:"Cabinet Making",carptry:"Carpentry",childserv:"Childrens Services",clm:"Conservation and Land Management",comserv:"Community Services",csu:"Charles Sturt University",dairy:"Dairy",design:"Design",elec:"Electrical",edsupt:"Educational Support",foodpro:"Food Production",gamedev:"Game Development",glass:"Glass",hair:"Hairdressing",hort:"Horticulture",hosp:"Hospitality",hydropon:"Hydroponics",it:"Information Technology",jnry:"Joinery",learndev:"Learning and Development",lsu:"Learning Skills Unit",ncee:"NCEE",nurse:"Nursing",plumb:"Plumbing",rec:"Outdoor Recreation",sport:"Sport",tourism:"Tourism",trainassess:"Training and Assessment",vit:"Viticulture",voc:"Vocational",wine:"Winemaking"};return n=a in i?i[a]:e}$.noConflict(),jQuery(document).ready(function($){var e,a,n,i,r,d,t,s="";$("header#page-header").addClass("Main");var l=$("ul.breadcrumb a[href*='categoryid'] span[itemprop='title']");$(l).each(function(){var e=$(this).text(),a="breadcrumbs-"+slugify(e);$("header#page-header").addClass(a)});var c=$(".page-header-headings > h1").text(),o=/^(.*)\:(.*)\((.*)\)/gi,p=o.exec(c);if(p){if(a=p[1].split("|").sort(),a=$.map(a,function(e){return e.trim()}),$.each(a,function(e,a){var n="code-"+slugify(a);$("header#page-header").addClass(n)}),i=1===a.length?'<div id ="codes"><span>Code: </span>'+a+"</div>":'<div id ="codes"><span>Codes: </span>'+a.slice(0,a.length-1).join(", ")+" & "+a[a.length-1]+"</div>",$(".page-header-headings").append(i),r=p[2].trim(),$(".page-header-headings > h1").text(r),n=p[3].split(","),n=$.map(n,function(e){return e.trim()}),1===n.length)s=n[0];else{audience_str=n.slice(0,n.length-1).join(", "),-1!==audience_str.indexOf("-")?(t="",audience_arr=audience_str.split("-"),audience_newarr=[],$.each(audience_arr,function(e,a){var n=friendlyname(a);audience_newarr.push(n)}),t=audience_newarr.join(", ")):t=friendlyname(audience_str),console.log("@GB: audience_name = ",t),d='<div id ="audience"><span>Audience: </span>'+t+"</div>",$(".page-header-headings").append(d);var u="audience-"+slugify(audience_str);$("header#page-header").addClass(u),s=n[n.length-1]}$(".page-header-headings").prepend('<div id ="year" class="panel pull-right text-center"> <div class="panel-body ">'+s+"</div>");var g="year-"+slugify(s);$("header#page-header").addClass(g),"ID"===s.substring(0,2)&&($("#year").prepend('<div class="panel-heading">In Development</div>'),$("#year").addClass("panel-danger")),"LD"===s.substring(0,2)&&($("#year").prepend('<div class="panel-heading">Learning Development</div>'),$("#year").addClass("panel-danger")),"SP"===s.substring(0,2)&&($("#year").prepend('<div class="panel-heading">Staff Sandpit</div>'),$("#year").addClass("panel-danger")),"TB"===s.substring(0,2)&&($("#year").prepend('<div class="panel-heading">TEST BANNER</div>'),$("#year").addClass("panel-danger"),$("#page").addClass("test-banner"))}$(".block_readspeaker_embhl .title h2").text("Listen to this page"),$(".block_readspeaker_embhl>.content").append('<small>Highlight the text that you would like to hear, then click the \'play\' button. <br> <a  target="_blank" href="https://youtu.be/6RpliafTRDI">(Watch a tutorial)</a> </small>')});