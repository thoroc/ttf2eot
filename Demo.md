# Introduction #

Simple demonstration of ttf2eot usage.


# Details #

First create the output file

`$ ttf2eot < input.ttf > output.eot`

If that worked, you can specify the file in your CSS.

```
<style>
@font-face { 
    font-family: "testing";
    src: url("output.eot");
}
</style>
<div style="font-family: testing">
Hello, World!
</div>
```

Only IE understands this format, other browsers (Safari 3.x, Firefox 3.1.x, Chrome 2.x) are likely to adopt `src: url("foo.ttf") format("truetype")` instead.

You can use [conditional comments](http://www.quirksmode.org/css/condcom.html) to specify both formats, simply provide the font in both EOT and TTF format, then use conditional comments to make IE see the EOT version.

```
<style>
@font-face { 
    font-family: "testing";
    src: url("output.ttf") format("truetype");
}
</style>
<!--[if IE]>
    <style>
    @font-face { 
        font-family: "testing";
        src: url("output.eot");
    }
    </style>
<![endif]-->
<div style="font-family: testing">
Hello, Multiple Browser World!
</div>
```

This should work in IE6, IE7, IE8, Safari 3/4 and Firefox 3.1+

### Note for Windows Users ###


If you're a Windows user - **this is probably not what you're looking for**.

You will probably feel more comfortable using "WEFT", Microsoft's own utility for handling EOT. ttf2eot is primarily for UNIX users who want to make font embedding work for IE without using Microsoft software.

However, if you're certain you do wish to use ttf2eot, a command line windows binary is provided. It is used like so:

```
C:\>ttf2eot.exe c:\windows\fonts\arial.ttf c:\output.eot

C:\>dir output.eot
 Volume in drive C has no label.
 Volume Serial Number is E4EC-5386

 Directory of C:\

30/04/2009  21:41           367,270 output.eot
               1 File(s)        367,270 bytes
               0 Dir(s)  51,782,295,552 bytes free

C:\>
```

Please note, It is unlikely the author will be able to help with Windows related questions.