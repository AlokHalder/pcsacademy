<%@taglib prefix="tiles" uri="/WEB-INF/struts-tiles.tld"%>

<!DOCTYPE html>
<html lang="en-gb" dir="ltr" class='com_content view-featured itemid-435 j33 mm-hover'>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="generator" content="text/html; charset=utf-8" />
        <title>PCS Academy</title>
        <link href="images/logo1.png" rel="shortcut icon" type="image/vnd.microsoft.icon" />
        <link rel="stylesheet" href="css/main.css" type="text/css" />
        <link rel="stylesheet" href="css/style.css" type="text/css" />
        <link rel="stylesheet" href="css/revolution.css" type="text/css" />
        <link rel="stylesheet" href="css/settings.css" type="text/css" />
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
        <link rel="stylesheet" href="font-awesome/css/font-awesome.css" type="text/css" />
        <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 100%;
      margin: auto;
  }
  </style>
        <script src="js/js-847d5.js" type="text/javascript"></script>
        <script src="js/acymailing_module.js" type="text/javascript"></script>
        <script src="js/js-534c2.js" type="text/javascript"></script>
        <script type="text/javascript">
            jQuery(window).on('load', function() {
                new JCaption('img.caption');
            });
            var acymailing = Array();
            acymailing['NAMECAPTION'] = 'Name';
            acymailing['NAME_MISSING'] = 'Please enter your name';
            acymailing['EMAILCAPTION'] = 'E-mail';
            acymailing['VALID_EMAIL'] = 'Please enter a valid e-mail address';
            acymailing['ACCEPT_TERMS'] = 'Please check the Terms and Conditions';
            acymailing['CAPTCHA_MISSING'] = 'Please enter the security code displayed in the image';
            acymailing['NO_LIST_SELECTED'] = 'Please select the lists you want to subscribe to';

            ;
            (function($) {
                $(document).ready(function() {
                    var hoverTimeout;
                    $('#ja-imagesmap104 #cd-dropdown').jadropdown({
                        gutter: 0,
                        stack: false
                    });
                    popovers = function() {
                        $('#ja-imagesmap104 a.point').each(function() {
                            $(this).hover(function() {
                                clearTimeout(hoverTimeout);
                                current_hover = $(this).prop('id');
                                $('#ja-imagesmap104 a.point').each(function() {
                                    if ($(this).prop('id') != current_hover) {
                                        $(this).popover('destroy');
                                        $(this).show();
                                    }
                                });
                                $(this).popover('show');
                            }, function() {
                                (function(t) {
                                    hoverTimeout = setTimeout(function() {
                                        $(t).popover('destroy');
                                        $(t).show();
                                    }, 2000);
                                })(this);
                            });
                        });
                    };
                    popovers();

                    $('#ja-imagesmap104 .cd-dropdown ul li').click(function() {
                        var target = $(this).attr('data-value');
                        $('#ja-imagesmap104 a.point').each(function() {
                            if ($(this).prop('id') != target) {
                                $(this).popover('destroy');
                                $(this).show();
                            }
                        });
                        $('#ja-imagesmap104 #' + target).popover('show');
                    });
                });
            })(jQuery);
            jQuery(function($) {
                $('.hasTip').each(function() {
                    var title = $(this).attr('title');
                    if (title) {
                        var parts = title.split('::', 2);
                        $(this).data('tip:title', parts[0]);
                        $(this).data('tip:text', parts[1]);
                    }
                });
                var JTooltips = new Tips($('.hasTip').get(), {"maxTitleChars": 50, "fixed": false});
            });
            window.setInterval(function() {
                var r;
                try {
                    r = window.XMLHttpRequest ? new XMLHttpRequest() : new ActiveXObject("Microsoft.XMLHTTP")
                } catch (e) {
                }
                if (r) {
                    r.open("", "index.html", true);
                    r.send(null)
                }
            }, 840000);
        </script>
        <script type="text/javascript">
            (function() {
                var strings = {"JLIB_FORM_FIELD_INVALID": "Invalid field:&#160"};
                if (typeof Rohit == 'undefined') {
                    Rohit = {};
                    Rohit.JText = strings;
                }
                else {
                    Rohit.JText.load(strings);
                }
            })();
        </script>
        <script type="text/javascript">
            /*<![CDATA[*/

            //
            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', 'UA-243376-1']);
            _gaq.push(['_setDomainName', 'pcs.com']);
            _gaq.push(['_trackPageview']);

            (function() {
                var ga = document.createElement('script');
                ga.type = 'text/javascript';
                ga.async = true;
                ga.src = ('js/ga.js');
                var s = document.getElementsByTagName('script')[0];
                s.parentNode.insertBefore(ga, s);
            })();
            /*]]>*/
        </script>

        <!-- META FOR IOS & HANDHELD -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
        <style type="text/stylesheet">
            @-webkit-viewport   { width: device-width; }
            @-moz-viewport      { width: device-width; }
            @-ms-viewport       { width: device-width; }
            @-o-viewport        { width: device-width; }
            @viewport           { width: device-width; }
        </style>
        <script type="text/javascript">
            //<![CDATA[
            if (navigator.userAgent.match(/IEMobile\/10\.0/)) {
                var msViewportStyle = document.createElement("style");
                msViewportStyle.appendChild(
                        document.createTextNode("@-ms-viewport{width:auto!important}")
                        );
                document.getElementsByTagName("head")[0].appendChild(msViewportStyle);
            }
            //]]>
        </script>
        <meta name="HandheldFriendly" content="true"/>
        <meta name="apple-mobile-web-app-capable" content="YES"/>
        <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $(".login-switch").click(function() {
                    $("#ja-user-login").toggle(100);
                    $("#ja-user-register").hide();
                });
            });
            $(document).ready(function() {
                $(".register-switch").click(function() {
                    $("#ja-user-register").toggle(100);
                    $("#ja-user-login").hide();
                });
            });
            $(document).ready(function() {
                $("#choose_pcs_more").click(function() {
                    $("#more-less2").hide(1000);
                    $("#more-less").toggle(1000);
                });
            });
            $(document).ready(function() {
                $("#choose_pcs_more2").click(function() {
                    $("#more-less").hide(1000);
                    $("#more-less2").toggle(1000);
                });
            });
        </script>
    </head>




    <body>
        <!--header start...-->
        <div class="t3-wrapper home"><!-- Need this wrapper for off-canvas menu. Remove if you don't use of-canvas --> 
            <tiles:insert attribute="header2" />
        </div>
        <!--header end...-->


        <!--body start...-->
        <div id="t3-mainbody" class="container t3-mainbody" >
            <div class="main-container">
                <div class="row"> 
                    <!-- MAIN CONTENT -->
                    <div id="t3-content" class="t3-content col-xs-12 col-sm-8 col-sm-push-4 col-md-9 col-md-push-3"> 
                        <tiles:insert attribute="body" />
                    </div>
                    <!-- //MAIN CONTENT --> 
                    <!-- SIDEBAR LEFT -->
                    <tiles:insert attribute="menu" />
                    <!-- //SIDEBAR LEFT --> 
                </div>
            </div>
        </div>
        <!--body end...-->


        <!--footer start...-->
        <tiles:insert attribute="footer" />
        <!--footer end...-->
    </body>



    <script src="js/jquery-1.8.3.js"></script><!-- jQuery library --> 
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/jquery.themepunch.plugins.min.js"></script> 
    <script type="text/javascript" src="js/jquery.themepunch.revolution.min.js"></script> 
    <script>
            /* <![CDATA[ */
            // REVOLUTION SLIDER 
            jQuery(document).ready(function() {

                if (jQuery.fn.cssOriginal !== undefined)   // CHECK IF fn.css already extended
                    jQuery.fn.css = jQuery.fn.cssOriginal;

                jQuery('.fullwidthbanner').revolution(
                        {
                            delay: 5000,
                            startheight: 413,
                            startwidth: 940,
                            hideThumbs: 200,
                            thumbWidth: 100,
                            thumbHeight: 50,
                            thumbAmount: 5,
                            navigationType: "none",
                            navigationArrows: "verticalcentered",
                            navigationStyle: "round",
                            navigationHAlign: "right",
                            navigationVAlign: "top",
                            navigationHOffset: 0,
                            navigationVOffset: 20,
                            soloArrowLeftHalign: "left",
                            soloArrowLeftValign: "center",
                            soloArrowLeftHOffset: 20,
                            soloArrowLeftVOffset: 0,
                            soloArrowRightHalign: "right",
                            soloArrowRightValign: "center",
                            soloArrowRightHOffset: 20,
                            soloArrowRightVOffset: 0,
                            touchenabled: "on",
                            onHoverStop: "on",
                            navOffsetHorizontal: 0,
                            navOffsetVertical: 20,
                            hideCaptionAtLimit: 0,
                            hideAllCaptionAtLilmit: 0,
                            hideSliderAtLimit: 0,
                            stopAtSlide: -1,
                            stopAfterLoops: -1,
                            shadow: 0,
                            fullWidth: "on"

                        });
            });

            // PORTFOLIO CAROUSEL
            $("#foo2").carouFredSel({
                auto: false,
                scroll: 1,
                pagination: "#foo2_pag",
                swipe: {
                    ontouch: true,
                    onMouse: true
                },
                width: 'variable',
                height: 'variable',
                items: {
                    width: 'auto',
                    visible: 4
                }
            });

            // FOOTER CAROUSEL ARTICLE 
            $("#foo1").carouFredSel({
                auto: true,
                scroll: 1,
                pagination: "#foo1_pag",
                width: 'variable',
                height: 'variable',
                items: {
                    width: 'auto',
                    visible: 1
                },
                swipe: {
                    ontouch: true,
                    onMouse: true
                }
            });

            // FOOTER CAROUSEL ARTICLE 
            $("#foo3").carouFredSel({
                auto: 5000,
                scroll: 1,
                pagination: "#foo3_pag",
                width: 'variable',
                height: 'variable',
                items: {
                    width: 'auto',
                    visible: 1
                },
                swipe: {
                    ontouch: true,
                    onMouse: true
                }
            });


            // TESTIMONIALS ALTERNATIVE VERSION
            $('.testimonials-alternative-nav').on('click', 'a', function(e) {
                e.preventDefault();
                var $current = $(this);
                $('.testimonials-alternative-nav a').removeClass();
                $('.testimonials-alternative-content .content').hide();
                $current.addClass('active');
                var contentID = $current.attr('href');
                $('.testimonials-alternative-content').find(contentID).fadeIn();
            });

            /* ]]> */
    </script> 



