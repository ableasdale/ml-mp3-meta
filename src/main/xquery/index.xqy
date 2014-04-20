xquery version "1.0-ml";

declare namespace xhtml = "http://www.w3.org/1999/xhtml";


declare function local:escape-for-regex( $arg as xs:string? ) as xs:string {
    replace($arg, '(\.|\[|\]|\\|\||\-|\^|\$|\?|\*|\+|\{|\}|\(|\))','\\$1')
};

declare function local:substring-after-last($arg as xs:string?, $delim as xs:string) as xs:string {
    replace($arg,concat('^.*',local:escape-for-regex($delim)),'')
};


(xdmp:set-response-content-type("text/html; charset=utf-8"),
'<?xml version="1.0" encoding="UTF-8"?>',
'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">',

<html>
<head></head>
<body>
    <ul>
        {for $x in doc()
        return 
        element li {element a {attribute href {concat("/view.xqy?uri=",fn:encode-for-uri(xdmp:node-uri($x)))}, local:substring-after-last(xdmp:node-uri($x), "/")}}}
    </ul>
</body>
</html>)