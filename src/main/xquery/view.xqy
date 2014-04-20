xquery version "1.0-ml";

import module namespace common = "http://www.example.com/common" at "/lib/common.xqy";

declare variable $fname as xs:string := xdmp:get-request-field("uri");

common:build-page(
<div id="content">
    <h1>{$fname}</h1>
    <pre>{doc(xdmp:url-decode($fname))}</pre>
    <code>{doc(xdmp:url-decode($fname))}</code>
</div>)
