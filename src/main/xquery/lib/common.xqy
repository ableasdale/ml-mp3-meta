xquery version "1.0-ml"; 

(: 
    Common Library functions for this application
:)

module namespace common="http://www.example.com/common";

declare function common:build-page($html as element(div)){
xdmp:set-response-content-type("text/html; charset=utf-8"),
'<?xml version="1.0" encoding="UTF-8"?>',
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',
common:html-page-enclosure($html)
};

declare function common:html-page-enclosure($content as element()) as element(html){
element html {attribute lang {"en"}, attribute xml:lang {"en"},
    element head {common:html-head()},
    element body {$content}
}
};

declare function common:html-head() {
(: element title {xdmp:get-session-field("collection"), " : ", $PAGE ," : ", $TITLE}, :)
element link {attribute rel {"stylesheet"}, attribute type{"text/css"}, attribute href {"http://yui.yahooapis.com/pure/0.4.2/pure-min.css"}}
(:element link {attribute rel {"stylesheet"}, attribute type{"text/css"}, attribute href {"/css/page.css"}},
element script {attribute src {"http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"}, attribute type {"text/javascript"}, " "},
element script {attribute src {"/js/jquery.sparkline.min.js"}, attribute type {"text/javascript"}, " "},
element script {attribute src {"/js/highcharts.js"}, attribute type {"text/javascript"}, " "}, :)
};