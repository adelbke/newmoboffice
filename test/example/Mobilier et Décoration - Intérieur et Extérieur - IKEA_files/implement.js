(function(h,d){function r(b){var a={},c="",g="",f=b.substring(0,1),n;a.response="text";a.async=!1;"d"==f?(g="Data",a.url=l+"data/test-settings.json"):"e"==f?(c="editions",g="Edition",a.url=l+"editions/test-settings.json"):"p"==f&&(c="plugin-tests",g="Plugins",a.url=l+"plugin-tests/test-settings.json");t(a,function(a){if(a){var e=!0;a=JSON.parse(a);for(var h=0;h<a.length;h++)if(a[h].testKey==b){e=!1;n=a[h];"d"==f?d.cookie="iplugins_pdd="+n.dirName+"; domain=.ikea.com; path=/":("p"==f||"e"==f)&&u(c,n);var k=g,m=n.dirName,l=d.createElement("div");l.setAttribute("style","position: fixed; top: 10px; left: 10px; margin: 0px; padding: 7px; border-radius: 5px; border: 1px solid rgb(217, 217, 217); font-family: Verdana; font-size: 12px; text-align: left; z-index: 10000; background-color: rgb(242, 242, 242);");l.innerHTML='<span style="display: block; color: rgb(51, 153, 255); font-weight: bold; font-size: 14px;">iplugins</span><span style="display: block; margin-bottom: 7px; color: rgb(51, 153, 255); font-size: 12px;">test mode</span><span style="display: block; margin-bottom: 2px; color: rgb(179, 179, 179); font-style: italic;">Test type</span><span style="display: block; margin-bottom: 7px;">'+k+'</span><span style="display: block; margin-bottom: 2px; color: rgb(179, 179, 179); font-style: italic;">Test name</span><span style="display: block;">'+m+"</span><a href=\"#\" onclick=\"window.open(document.URL + ((document.URL.indexOf('?') > -1) ? '&' : '?') + 'iplugins_rc', '_self');\" style=\"display: block; width: 100%; background-color: #0099ff; text-align: center; padding: 5px 0px 5px 0px; margin-top: 10px; color: white; border-radius: 4px; text-decoration: none; transition: .2s background-color;\" onMouseOver=\"this.style.backgroundColor='#4db8ff'\" onMouseOut=\"this.style.backgroundColor='#0099ff'\">Exit test</a>";d.getElementsByTagName("html").item(0).appendChild(l)}e&&v()}})}function B(){var b={response:"text",async:!1};b.url=l+"production-settings.json";t(b,function(a){a&&(a=JSON.parse(a),"online"==a.productionStatus&&u("editions",a))})}function u(b,a){function c(){var c=w("standard",b,a);c&&0<c.length&&p(c,function(){},this,!0)}var d=w("prio",b,a);d&&0<d.length&&(-1<k.indexOf("-m")?p(d,function(){},this,!0):x(d));a.devUrls&&a.devUrls.desktop&&0!=a.devUrls.desktop.filter(function(a){if(""!=a)return a})&&(-1<k.indexOf("-m")?p(a.devUrls.desktop,function(){},this,!0):x(a.devUrls.desktop));if("undefined"===a.existsCommonJs||"undefined"!==a.existsCommonJs&&0==a.existsCommonJs)c();else var f=setInterval(function(){h.ipluginsCommon&&(c(),clearInterval(f));h.setTimeout(function(){clearInterval(f)},2E3)},50)}function w(b,a,c){var d=[],f=l+a+"/"+c.dirName+"/"+b;"editions"==a&&(f+=".min");a="desktop"+b.charAt(0).toUpperCase()+b.slice(1)+"Css";b="desktop"+b.charAt(0).toUpperCase()+b.slice(1)+"Js";c.files&&(c.files[a]&&d.push(f+".css"),c.files[b]&&d.push(f+".js"));return d}function C(b,a){var c=".ikea.com";-1<d.URL.indexOf("ikea.cn")&&(c=".ikea.cn");d.cookie="iplugins_c="+b+"; domain="+c+"; path=/";a()}function v(){d.cookie="iplugins_c=; expires=Thu, 01 Jan 1970 00:00:01 GMT; domain=.ikea.com; path=/";h.location=d.URL.split("?")[0]}function y(b){b=b.replace(/[\[]/,"\\[").replace(/[\]]/,"\\]");b="[\\?&]"+b.toLowerCase()+"=([^&#]*)";b=(new RegExp(b)).exec(h.location.search.toLowerCase());return null==b?"":decodeURIComponent(b[1].replace(/\+/g," "))}function D(b){if(b=d.cookie.match(new RegExp(b+"=([^;]+)")))return b[1]}function t(b,a){void 0==b.method&&(b.method="get");void 0==b.async&&(b.async=!0);void 0==b.response&&(b.response="xml");var c=new XMLHttpRequest;c.onreadystatechange=function(){if(4==c.readyState)if(200==c.status){var d=c.responseXML;"text"==b.response&&(d=c.responseText);a(d)}else a(0)};c.open(b.method,b.url,b.async);c.send()}function x(b){if(b)for(var a=b.length,c=0;c<a;c++){var g=b[c].split(".").pop();"css"==g?d.write('<link rel="stylesheet" type="text/css" href="'+b[c]+'" />'):"js"==g&&d.write('<script type="text/javascript" src="'+b[c]+'">\x3c/script>')}}function p(b,a,c,g){c=c||this;var f=d.getElementsByTagName("head")[0],e=d.createDocumentFragment(),h=b.length,k=0,l=function(){k++;h==k&&"function"==typeof a?a.call(c):!0===g&&f.appendChild(q(b[k],l))};if(!0===g)f.appendChild(q(b[0],l));else{for(var m=0;m<h;m++)e.appendChild(q(b[m],l));f.appendChild(e)}}function q(b,a){var c=b.substr(b.lastIndexOf(".")+1);if("js"==c){c=d.createElement("script");c.type="text/javascript";c.src=b;var g=c}else"css"==c&&(c=d.createElement("link"),c.rel="stylesheet",c.type="text/css",c.href=b,g=c);g&&(g.readyState?g.onreadystatechange=function(){if("loaded"==g.readyState||"complete"==g.readyState)g.onreadystatechange=null,a()}:g.onload=a);return g}function E(){var b=h.navigator.userAgent,a=b.indexOf("MSIE ");return 0<a?parseInt(b.substring(a+5,b.indexOf(".",a)),10):!1}var k=function(){var b=d.documentElement;if((b=b.lang||b.getAttribute("xml:lang")||!1)&&5==b.length){var a=/^(m2?)/i.exec(location.hostname);a=b.replace("-","_")+(a?"-"+a[1]:"")}!a&&-1<d.URL.indexOf("https://www.ikea.com/")&&-1==d.URL.indexOf("webapp/wcs/stores/servlet/mOrderItemDisplayView")&&-1==d.URL.indexOf("webapp/wcs/stores/servlet/OrderItemDisplayMobile")&&(a=location.pathname.split("/"),a=-1<d.URL.indexOf("www.ikea.com/ms/")?a[2]:-1<d.URL.indexOf("www.ikea.com/ext/local-store/")?a[4]+"_"+a[3].toUpperCase():-1<d.URL.indexOf("mcommerce/shoppingcart")?a[2]+"_"+a[1].toUpperCase()+"-m":a[2]+"_"+a[1].toUpperCase());a||(b=d.getElementById("iplugins-implementation-tag"))&&(b=b.getAttribute("data-account"))&&(a=b);!a&&h.ipluginsImplementationSettings&&h.ipluginsImplementationSettings.account&&(a=h.ipluginsImplementationSettings.account);if("en_CN"==a||"en_CN-m2"==a||"zh_CN"==a||"zh_CN-m2"==a)if(-1<d.URL.indexOf("internal.cmirw101.cm01.test.ikea")||-1<d.URL.indexOf("internal.cfirw101.cf03.test.ikea")||-1<d.URL.indexOf("internal.pirw401.ikea.cn"))a+="-test";"ar_SA"==a?a="en_SA":"ar_SA-m"==a?a="en_SA-m":"ar_KW"==a?a="en_KW":"ar_KW-m"==a?a="en_KW-m":"ar_JO"==a?a="en_JO":"ar_JO-m"==a?a="en_JO-m":"fr_MA"==a?a="en_MA":"ar_MA"==a?a="en_MA":"ar_QA"==a?a="en_QA":"ar_EG"==a?a="en_EG":"ca_ES"==a?a="es_ES":"eu_ES"==a?a="es_ES":"en_PT"==a?a="pt_PT":"en_PT-m"==a?a="pt_PT-m":"fr_CA"==a?a="en_CA":"fr_CA-m"==a&&(a="en_CA-m");a&&-1<a.indexOf("nb_")&&(a=a.replace("nb_","no_"));"no_NO-m"==a&&(a="no_NO-m2");"ms_MY"==a?a="en_MY":"th_TH"==a?a="en_TH":"ms_MY-m"==a?a="en_MY-m":"th_TH-m"==a&&(a="en_TH-m");return a?(-1<a.indexOf("nb")&&(a=k.replace("nb","no")),a):!1}(),e=d.getElementById("iplugins-implementation-tag"),z=d.currentScript&&d.currentScript.async||e&&e.hasAttribute("async");e=e?e.getAttribute("data-version")||"":"";0<=["en_CA-m","fr_CA-m"].indexOf(k)&&(e="1");"sv_SE"==k&&(-1<d.location.href.indexOf("/webapp/wcs/stores/servlet/OrderItemDisplay")||-1<d.location.href.indexOf("/webapp/wcs/stores/servlet/IrwOrderItemDisplay")||-1<d.location.href.indexOf("/webapp/wcs/stores/servlet/PromotionCodeManage"))&&d.addEventListener("DOMContentLoaded",function(){setInterval(function(){d.cookie="preferedui=; path=/; domain=.ikea.com; expires=Thu, 01 Jan 1970 00:00:01 GMT"},300)});if(""===e||"2"===e)if(function(b,a,c,d,f,e){f._iPluginsReference=c;e=d.createElement(b);f[c]=f[c]||function(){(f[c].q=f[c].q||[]).push(arguments)};f[c].mapper=f[c].mapper||{ar_SA:"en_SA",ar_BH:"en_BH",ar_MA:"en_MA",fr_MA:"en_MA",ar_KW:"en_KW",ar_JO:"en_JO",fr_CA:"en_CA",nb_NO:"no_NO",ms_MY:"en_MY",th_TH:"en_TH",ar_QA:"en_QA",ar_AE:"en_AE",ar_EG:"en_EG",en_PT:"pt_PT",fr_BE:"nl_BE"};e.async=z;e.src=a;z?d.body.appendChild(e):d.write(e.outerHTML)}("script","//ww8.ikea.com/ext/iplugins/versions/iplugins.2.0.5.min.js","iPlugins",d,h),"2"===e)return;if(-1==d.URL.indexOf("noiplugins")&&-1==d.URL.indexOf("disableiplugins151")&&-1==d.URL.indexOf("ww8.ikea.com/checkout/")&&(e=E(),(0==e||e&&10<e)&&k)){e=d.URL;var l="https://ww8.ikea.com/ext/iplugins/"+k+"/production/";var A="https://ww8.ikea.com/ext/iplugins/"+k+"/resources/libs/";-1==d.URL.indexOf("ww8.ikea.com/clickandcollect")&&"sv_SE"==k&&p([A+"js/handlebars-v4.0.6.min.js",A+"js/apptus-esales-api-1.0.2.min.js"],function(){},this,!1);if(-1<e.indexOf("iplugins_sc")){var m=y("iplugins_sc");m&&!/^\d+$/.test(m)&&C(m,function(){r(m)})}else-1<e.indexOf("iplugins_rc")?v():(m=-1<e.indexOf("iplugins_qs")?y("iplugins_qs"):D("iplugins_c"))&&!/^\d+$/.test(m)?r(m):B()}})(window,document);