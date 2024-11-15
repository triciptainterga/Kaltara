﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Apps/Uidesk.Master" CodeBehind="Crm_Trx_Taskboard.aspx.vb" Inherits="UIDESK.Crm_Trx_Taskboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="js/jquery-1.9.1.min.js"></script>
    <script src="js/Crm_Trx_Taskboard.js"></script>
    <script src="js/sweetalert.min.js"></script>
    <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <style>
        @font-face {
            font-family: unicons-line;
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-0.eot);
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-0.eot#iefix) format('embedded-opentype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-0.woff2) format('woff2'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-0.woff) format('woff'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-0.ttf) format('truetype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-0.svg#unicons) format('svg');
            font-weight: 400;
            font-style: normal;
            unicode-range: U+E800-E83B
        }

        @font-face {
            font-family: unicons-line;
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-1.eot);
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-1.eot#iefix) format('embedded-opentype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-1.woff2) format('woff2'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-1.woff) format('woff'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-1.ttf) format('truetype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-1.svg#unicons) format('svg');
            font-weight: 400;
            font-style: normal;
            unicode-range: U+E83C-E877
        }

        @font-face {
            font-family: unicons-line;
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-10.eot);
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-10.eot#iefix) format('embedded-opentype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-10.woff2) format('woff2'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-10.woff) format('woff'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-10.ttf) format('truetype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-10.svg#unicons) format('svg');
            font-weight: 400;
            font-style: normal;
            unicode-range: U+EA58-EA93
        }

        @font-face {
            font-family: unicons-line;
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-11.eot);
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-11.eot#iefix) format('embedded-opentype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-11.woff2) format('woff2'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-11.woff) format('woff'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-11.ttf) format('truetype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-11.svg#unicons) format('svg');
            font-weight: 400;
            font-style: normal;
            unicode-range: U+EA94-EACF
        }

        @font-face {
            font-family: unicons-line;
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-12.eot);
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-12.eot#iefix) format('embedded-opentype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-12.woff2) format('woff2'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-12.woff) format('woff'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-12.ttf) format('truetype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-12.svg#unicons) format('svg');
            font-weight: 400;
            font-style: normal;
            unicode-range: U+EAD0-EB0C
        }

        @font-face {
            font-family: unicons-line;
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-13.eot);
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-13.eot#iefix) format('embedded-opentype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-13.woff2) format('woff2'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-13.woff) format('woff'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-13.ttf) format('truetype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-13.svg#unicons) format('svg');
            font-weight: 400;
            font-style: normal;
            unicode-range: U+EB0D-EB48
        }

        @font-face {
            font-family: unicons-line;
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-14.eot);
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-14.eot#iefix) format('embedded-opentype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-14.woff2) format('woff2'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-14.woff) format('woff'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-14.ttf) format('truetype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-14.svg#unicons) format('svg');
            font-weight: 400;
            font-style: normal;
            unicode-range: U+EB49-EB84
        }

        @font-face {
            font-family: unicons-line;
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-15.eot);
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-15.eot#iefix) format('embedded-opentype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-15.woff2) format('woff2'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-15.woff) format('woff'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-15.ttf) format('truetype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-15.svg#unicons) format('svg');
            font-weight: 400;
            font-style: normal;
            unicode-range: U+EB85-EBC0
        }

        @font-face {
            font-family: unicons-line;
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-16.eot);
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-16.eot#iefix) format('embedded-opentype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-16.woff2) format('woff2'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-16.woff) format('woff'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-16.ttf) format('truetype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-16.svg#unicons) format('svg');
            font-weight: 400;
            font-style: normal;
            unicode-range: U+EBC1-EBFC
        }

        @font-face {
            font-family: unicons-line;
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-17.eot);
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-17.eot#iefix) format('embedded-opentype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-17.woff2) format('woff2'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-17.woff) format('woff'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-17.ttf) format('truetype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-17.svg#unicons) format('svg');
            font-weight: 400;
            font-style: normal;
            unicode-range: U+EBFD-EC38
        }

        @font-face {
            font-family: unicons-line;
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-18.eot);
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-18.eot#iefix) format('embedded-opentype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-18.woff2) format('woff2'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-18.woff) format('woff'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-18.ttf) format('truetype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-18.svg#unicons) format('svg');
            font-weight: 400;
            font-style: normal;
            unicode-range: U+EC39-EC74
        }

        @font-face {
            font-family: unicons-line;
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-19.eot);
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-19.eot#iefix) format('embedded-opentype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-19.woff2) format('woff2'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-19.woff) format('woff'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-19.ttf) format('truetype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-19.svg#unicons) format('svg');
            font-weight: 400;
            font-style: normal;
            unicode-range: U+EC75-EC9E
        }

        @font-face {
            font-family: unicons-line;
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-2.eot);
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-2.eot#iefix) format('embedded-opentype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-2.woff2) format('woff2'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-2.woff) format('woff'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-2.ttf) format('truetype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-2.svg#unicons) format('svg');
            font-weight: 400;
            font-style: normal;
            unicode-range: U+E878-E8B3
        }

        @font-face {
            font-family: unicons-line;
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-3.eot);
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-3.eot#iefix) format('embedded-opentype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-3.woff2) format('woff2'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-3.woff) format('woff'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-3.ttf) format('truetype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-3.svg#unicons) format('svg');
            font-weight: 400;
            font-style: normal;
            unicode-range: U+E8B4-E8EF
        }

        @font-face {
            font-family: unicons-line;
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-4.eot);
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-4.eot#iefix) format('embedded-opentype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-4.woff2) format('woff2'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-4.woff) format('woff'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-4.ttf) format('truetype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-4.svg#unicons) format('svg');
            font-weight: 400;
            font-style: normal;
            unicode-range: U+E8F0-E92B
        }

        @font-face {
            font-family: unicons-line;
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-5.eot);
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-5.eot#iefix) format('embedded-opentype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-5.woff2) format('woff2'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-5.woff) format('woff'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-5.ttf) format('truetype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-5.svg#unicons) format('svg');
            font-weight: 400;
            font-style: normal;
            unicode-range: U+E92C-E967
        }

        @font-face {
            font-family: unicons-line;
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-6.eot);
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-6.eot#iefix) format('embedded-opentype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-6.woff2) format('woff2'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-6.woff) format('woff'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-6.ttf) format('truetype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-6.svg#unicons) format('svg');
            font-weight: 400;
            font-style: normal;
            unicode-range: U+E968-E9A3
        }

        @font-face {
            font-family: unicons-line;
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-7.eot);
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-7.eot#iefix) format('embedded-opentype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-7.woff2) format('woff2'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-7.woff) format('woff'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-7.ttf) format('truetype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-7.svg#unicons) format('svg');
            font-weight: 400;
            font-style: normal;
            unicode-range: U+E9A4-E9DF
        }

        @font-face {
            font-family: unicons-line;
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-8.eot);
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-8.eot#iefix) format('embedded-opentype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-8.woff2) format('woff2'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-8.woff) format('woff'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-8.ttf) format('truetype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-8.svg#unicons) format('svg');
            font-weight: 400;
            font-style: normal;
            unicode-range: U+E9E0-EA1B
        }

        @font-face {
            font-family: unicons-line;
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-9.eot);
            src: url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-9.eot#iefix) format('embedded-opentype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-9.woff2) format('woff2'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-9.woff) format('woff'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-9.ttf) format('truetype'),url(https://unicons.iconscout.com/release/v3.0.0/fonts/line/unicons-9.svg#unicons) format('svg');
            font-weight: 400;
            font-style: normal;
            unicode-range: U+EA1C-EA57
        }

        [class^=uil-]:before, [class*=" uil-"]:before {
            font-family: unicons-line;
            font-style: normal;
            font-weight: 400;
            speak: none;
            display: inline-block;
            text-decoration: inherit;
            font-variant: normal;
            text-transform: none;
            line-height: 1;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale
        }

        [class*=uil-].flip-horizontal:before {
            transform: scaleX(-1)
        }

        [class*=uil-].flip-horizontal.rotate-90:before {
            transform: rotate(90deg) scaleX(-1)
        }

        [class*=uil-].flip-horizontal.rotate-180:before {
            transform: rotate(180deg) scaleX(-1)
        }

        [class*=uil-].flip-horizontal.rotate-270:before {
            transform: rotate(270deg) scaleX(-1)
        }

        [class*=uil-].flip-horizontal.flip-vertical:before {
            transform: scale(-1)
        }

        [class*=uil-].flip-horizontal.flip-vertical.rotate-90:before {
            transform: rotate(90deg) scale(-1)
        }

        [class*=uil-].flip-horizontal.flip-vertical.rotate-180:before {
            transform: rotate(180deg) scale(-1)
        }

        [class*=uil-].flip-horizontal.flip-vertical.rotate-270:before {
            transform: rotate(270deg) scale(-1)
        }

        [class*=uil-].flip-vertical:before {
            transform: scaleY(-1)
        }

        [class*=uil-].flip-vertical.rotate-90:before {
            transform: rotate(90deg) scaleY(-1)
        }

        [class*=uil-].flip-vertical.rotate-180:before {
            transform: rotate(180deg) scaleY(-1)
        }

        [class*=uil-].flip-vertical.rotate-270:before {
            transform: rotate(270deg) scaleY(-1)
        }

        [class*=uil-].rotate-90:before {
            transform: rotate(90deg)
        }

        [class*=uil-].rotate-180:before {
            transform: rotate(180deg)
        }

        [class*=uil-].rotate-270:before {
            transform: rotate(270deg)
        }

        .uil-comment-block:before {
            content: '\e800'
        }

        .uil-comment-alt-edit:before {
            content: '\e801'
        }

        .uil-comments:before {
            content: '\e802'
        }

        .uil-comment-alt-search:before {
            content: '\e803'
        }

        .uil-comment-shield:before {
            content: '\e804'
        }

        .uil-comment-alt-dots:before {
            content: '\e805'
        }

        .uil-comment-download:before {
            content: '\e806'
        }

        .uil-comment-check:before {
            content: '\e807'
        }

        .uil-comment-alt-chart-lines:before {
            content: '\e808'
        }

        .uil-comment-alt-download:before {
            content: '\e809'
        }

        .uil-comment-alt-lock:before {
            content: '\e80a'
        }

        .uil-comment-medical:before {
            content: '\e80b'
        }

        .uil-comment-alt-heart:before {
            content: '\e80c'
        }

        .uil-comment:before {
            content: '\e80d'
        }

        .uil-comment-alt-share:before {
            content: '\e80e'
        }

        .uil-comment-alt-upload:before {
            content: '\e80f'
        }

        .uil-comment-dots:before {
            content: '\e810'
        }

        .uil-comment-alt-lines:before {
            content: '\e811'
        }

        .uil-comment-lock:before {
            content: '\e812'
        }

        .uil-comment-heart:before {
            content: '\e813'
        }

        .uil-comment-info-alt:before {
            content: '\e814'
        }

        .uil-comment-upload:before {
            content: '\e815'
        }

        .uil-comment-alt-medical:before {
            content: '\e816'
        }

        .uil-chat-info:before {
            content: '\e817'
        }

        .uil-comment-alt-notes:before {
            content: '\e818'
        }

        .uil-comment-alt-plus:before {
            content: '\e819'
        }

        .uil-comment-alt-image:before {
            content: '\e81a'
        }

        .uil-comment-share:before {
            content: '\e81b'
        }

        .uil-comment-edit:before {
            content: '\e81c'
        }

        .uil-comment-alt-block:before {
            content: '\e81d'
        }

        .uil-comment-chart-line:before {
            content: '\e81e'
        }

        .uil-comment-alt-question:before {
            content: '\e81f'
        }

        .uil-comment-lines:before {
            content: '\e820'
        }

        .uil-comment-redo:before {
            content: '\e821'
        }

        .uil-comment-alt-check:before {
            content: '\e822'
        }

        .uil-comment-alt-shield:before {
            content: '\e823'
        }

        .uil-chat:before {
            content: '\e824'
        }

        .uil-comment-alt-message:before {
            content: '\e825'
        }

        .uil-comment-search:before {
            content: '\e826'
        }

        .uil-chat-bubble-user:before {
            content: '\e827'
        }

        .uil-comments-alt:before {
            content: '\e828'
        }

        .uil-comment-image:before {
            content: '\e829'
        }

        .uil-comment-alt:before {
            content: '\e82a'
        }

        .uil-comment-verify:before {
            content: '\e82b'
        }

        .uil-comment-plus:before {
            content: '\e82c'
        }

        .uil-comment-question:before {
            content: '\e82d'
        }

        .uil-comment-notes:before {
            content: '\e82e'
        }

        .uil-comment-alt-exclamation:before {
            content: '\e82f'
        }

        .uil-comment-exclamation:before {
            content: '\e830'
        }

        .uil-no-entry:before {
            content: '\e831'
        }

        .uil-screw:before {
            content: '\e832'
        }

        .uil-tape:before {
            content: '\e833'
        }

        .uil-paint-tool:before {
            content: '\e834'
        }

        .uil-comment-alt-verify:before {
            content: '\e835'
        }

        .uil-comment-alt-redo:before {
            content: '\e836'
        }

        .uil-trowel:before {
            content: '\e837'
        }

        .uil-drill:before {
            content: '\e838'
        }

        .uil-comment-info:before {
            content: '\e839'
        }

        .uil-jackhammer:before {
            content: '\e83a'
        }

        .uil-comment-alt-info:before {
            content: '\e83b'
        }

        .uil-wheel-barrow:before {
            content: '\e83c'
        }

        .uil-comment-message:before {
            content: '\e83d'
        }

        .uil-shovel:before {
            content: '\e83e'
        }

        .uil-keyhole-square:before {
            content: '\e83f'
        }

        .uil-keyhole-circle:before {
            content: '\e840'
        }

        .uil-traffic-barrier:before {
            content: '\e841'
        }

        .uil-keyhole-square-full:before {
            content: '\e842'
        }

        .uil-wall:before {
            content: '\e843'
        }

        .uil-constructor:before {
            content: '\e844'
        }

        .uil-hard-hat:before {
            content: '\e845'
        }

        .uil-shield-exclamation:before {
            content: '\e846'
        }

        .uil-lock-open-alt:before {
            content: '\e847'
        }

        .uil-unlock:before {
            content: '\e848'
        }

        .uil-unlock-alt:before {
            content: '\e849'
        }

        .uil-heart-alt:before {
            content: '\e84a'
        }

        .uil-octagon:before {
            content: '\e84b'
        }

        .uil-lock:before {
            content: '\e84c'
        }

        .uil-triangle:before {
            content: '\e84d'
        }

        .uil-star:before {
            content: '\e84e'
        }

        .uil-shield-slash:before {
            content: '\e84f'
        }

        .uil-lock-access:before {
            content: '\e850'
        }

        .uil-pentagon:before {
            content: '\e851'
        }

        .uil-shield-check:before {
            content: '\e852'
        }

        .uil-square:before {
            content: '\e853'
        }

        .uil-shield-question:before {
            content: '\e854'
        }

        .uil-padlock:before {
            content: '\e855'
        }

        .uil-wheelchair:before {
            content: '\e856'
        }

        .uil-lock-alt:before {
            content: '\e857'
        }

        .uil-polygon:before {
            content: '\e858'
        }

        .uil-circle:before {
            content: '\e859'
        }

        .uil-copyright:before {
            content: '\e85a'
        }

        .uil-closed-captioning:before {
            content: '\e85b'
        }

        .uil-trademark:before {
            content: '\e85c'
        }

        .uil-heart:before {
            content: '\e85d'
        }

        .uil-parking-circle:before {
            content: '\e85e'
        }

        .uil-mars:before {
            content: '\e85f'
        }

        .uil-sad-squint:before {
            content: '\e860'
        }

        .uil-registered:before {
            content: '\e861'
        }

        .uil-nerd:before {
            content: '\e862'
        }

        .uil-smile:before {
            content: '\e863'
        }

        .uil-meh-alt:before {
            content: '\e864'
        }

        .uil-annoyed:before {
            content: '\e865'
        }

        .uil-sad-dizzy:before {
            content: '\e866'
        }

        .uil-sad:before {
            content: '\e867'
        }

        .uil-servicemark:before {
            content: '\e868'
        }

        .uil-closed-captioning-slash:before {
            content: '\e869'
        }

        .uil-venus:before {
            content: '\e86a'
        }

        .uil-creative-commons-pd:before {
            content: '\e86b'
        }

        .uil-frown:before {
            content: '\e86c'
        }

        .uil-accessible-icon-alt:before {
            content: '\e86d'
        }

        .uil-squint:before {
            content: '\e86e'
        }

        .uil-meh:before {
            content: '\e86f'
        }

        .uil-silence:before {
            content: '\e870'
        }

        .uil-dizzy-meh:before {
            content: '\e871'
        }

        .uil-parking-square:before {
            content: '\e872'
        }

        .uil-shield:before {
            content: '\e873'
        }

        .uil-smile-dizzy:before {
            content: '\e874'
        }

        .uil-ninja:before {
            content: '\e875'
        }

        .uil-smile-beam:before {
            content: '\e876'
        }

        .uil-laughing:before {
            content: '\e877'
        }

        .uil-forward:before {
            content: '\ea58'
        }

        .uil-image-times:before {
            content: '\ea59'
        }

        .uil-headphones-alt:before {
            content: '\ea5a'
        }

        .uil-previous:before {
            content: '\ea5b'
        }

        .uil-film:before {
            content: '\ea5c'
        }

        .uil-image-broken:before {
            content: '\ea5d'
        }

        .uil-incoming-call:before {
            content: '\ea5e'
        }

        .uil-image-check:before {
            content: '\ea5f'
        }

        .uil-image-plus:before {
            content: '\ea60'
        }

        .uil-video:before {
            content: '\ea61'
        }

        .uil-camera-plus:before {
            content: '\ea62'
        }

        .uil-play:before {
            content: '\ea63'
        }

        .uil-cloud-question:before {
            content: '\ea64'
        }

        .uil-skip-forward:before {
            content: '\ea65'
        }

        .uil-image-lock:before {
            content: '\ea66'
        }

        .uil-skip-forward-circle:before {
            content: '\ea67'
        }

        .uil-skip-forward-alt:before {
            content: '\ea68'
        }

        .uil-step-backward-circle:before {
            content: '\ea69'
        }

        .uil-boombox:before {
            content: '\ea6a'
        }

        .uil-step-backward-alt:before {
            content: '\ea6b'
        }

        .uil-image-share:before {
            content: '\ea6c'
        }

        .uil-cloud-database-tree:before {
            content: '\ea6d'
        }

        .uil-snowflake:before {
            content: '\ea6e'
        }

        .uil-temperature-quarter:before {
            content: '\ea6f'
        }

        .uil-cloud-showers-heavy:before {
            content: '\ea70'
        }

        .uil-fahrenheit:before {
            content: '\ea71'
        }

        .uil-snowflake-alt:before {
            content: '\ea72'
        }

        .uil-cloud-wind:before {
            content: '\ea73'
        }

        .uil-tornado:before {
            content: '\ea74'
        }

        .uil-cloud-sun-hail:before {
            content: '\ea75'
        }

        .uil-cloud:before {
            content: '\ea76'
        }

        .uil-image-edit:before {
            content: '\ea77'
        }

        .uil-cloud-moon-hail:before {
            content: '\ea78'
        }

        .uil-temperature-empty:before {
            content: '\ea79'
        }

        .uil-cloud-sun-rain:before {
            content: '\ea7a'
        }

        .uil-thunderstorm:before {
            content: '\ea7b'
        }

        .uil-thunderstorm-sun:before {
            content: '\ea7c'
        }

        .uil-temperature-three-quarter:before {
            content: '\ea7d'
        }

        .uil-thunderstorm-moon:before {
            content: '\ea7e'
        }

        .uil-snow-flake:before {
            content: '\ea7f'
        }

        .uil-raindrops:before {
            content: '\ea80'
        }

        .uil-forecastcloud-moon-tear:before {
            content: '\ea81'
        }

        .uil-cloud-rain:before {
            content: '\ea82'
        }

        .uil-cloud-sun-tear:before {
            content: '\ea83'
        }

        .uil-cloud-moon-showers:before {
            content: '\ea84'
        }

        .uil-cloud-rain-sun:before {
            content: '\ea85'
        }

        .uil-cloud-showers-alt:before {
            content: '\ea86'
        }

        .uil-cloud-showers:before {
            content: '\ea87'
        }

        .uil-cloud-hail:before {
            content: '\ea88'
        }

        .uil-cloud-drizzle:before {
            content: '\ea89'
        }

        .uil-cloud-moon:before {
            content: '\ea8a'
        }

        .uil-moon:before {
            content: '\ea8b'
        }

        .uil-cloud-moon-rain:before {
            content: '\ea8c'
        }

        .uil-moonset:before {
            content: '\ea8d'
        }

        .uil-celsius:before {
            content: '\ea8e'
        }

        .uil-image-upload:before {
            content: '\ea8f'
        }

        .uil-cloud-sun-meatball:before {
            content: '\ea90'
        }

        .uil-windsock:before {
            content: '\ea91'
        }

        .uil-stop-circle:before {
            content: '\ea92'
        }

        .uil-temperature-plus:before {
            content: '\ea93'
        }

        .uil-moon-eclipse:before {
            content: '\ea94'
        }

        .uil-vertical-align-top:before {
            content: '\ea95'
        }

        .uil-cloud-meatball:before {
            content: '\ea96'
        }

        .uil-temperature:before {
            content: '\ea97'
        }

        .uil-cloud-moon-meatball:before {
            content: '\ea98'
        }

        .uil-flip-h-alt:before {
            content: '\ea99'
        }

        .uil-vector-square-alt:before {
            content: '\ea9a'
        }

        .uil-object-ungroup:before {
            content: '\ea9b'
        }

        .uil-th:before {
            content: '\ea9c'
        }

        .uil-images:before {
            content: '\ea9d'
        }

        .uil-temperature-minus:before {
            content: '\ea9e'
        }

        .uil-flip-v:before {
            content: '\ea9f'
        }

        .uil-cloud-sun-rain-alt:before {
            content: '\eaa0'
        }

        .uil-vertical-align-center:before {
            content: '\eaa1'
        }

        .uil-square-full:before {
            content: '\eaa2'
        }

        .uil-vertical-distribute-bottom:before {
            content: '\eaa3'
        }

        .uil-panorama-h-alt:before {
            content: '\eaa4'
        }

        .uil-pathfinder-unite:before {
            content: '\eaa5'
        }

        .uil-wind:before {
            content: '\eaa6'
        }

        .uil-vector-square:before {
            content: '\eaa7'
        }

        .uil-vertical-align-bottom:before {
            content: '\eaa8'
        }

        .uil-ruler:before {
            content: '\eaa9'
        }

        .uil-object-group:before {
            content: '\eaaa'
        }

        .uil-panorama-v:before {
            content: '\eaab'
        }

        .uil-panorama-h:before {
            content: '\eaac'
        }

        .uil-temperature-half:before {
            content: '\eaad'
        }

        .uil-cloud-sun:before {
            content: '\eaae'
        }

        .uil-layers-alt:before {
            content: '\eaaf'
        }

        .uil-line-alt:before {
            content: '\eab0'
        }

        .uil-image-resize-landscape:before {
            content: '\eab1'
        }

        .uil-image-resize-square:before {
            content: '\eab2'
        }

        .uil-pathfinder:before {
            content: '\eab3'
        }

        .uil-flip-h:before {
            content: '\eab4'
        }

        .uil-horizontal-distribution-right:before {
            content: '\eab5'
        }

        .uil-horizontal-distribution-left:before {
            content: '\eab6'
        }

        .uil-horizontal-distribution-center:before {
            content: '\eab7'
        }

        .uil-horizontal-align-center:before {
            content: '\eab8'
        }

        .uil-ruler-combined:before {
            content: '\eab9'
        }

        .uil-horizontal-align-right:before {
            content: '\eaba'
        }

        .uil-horizontal-align-left:before {
            content: '\eabb'
        }

        .uil-table:before {
            content: '\eabc'
        }

        .uil-th-slash:before {
            content: '\eabd'
        }

        .uil-crop-alt-rotate-right:before {
            content: '\eabe'
        }

        .uil-apps:before {
            content: '\eabf'
        }

        .uil-exclude:before {
            content: '\eac0'
        }

        .uil-crop-alt:before {
            content: '\eac1'
        }

        .uil-grids:before {
            content: '\eac2'
        }

        .uil-flip-v-alt:before {
            content: '\eac3'
        }

        .uil-vertical-distribution-center:before {
            content: '\eac4'
        }

        .uil-crop-alt-rotate-left:before {
            content: '\eac5'
        }

        .uil-vertical-distribution-top:before {
            content: '\eac6'
        }

        .uil-brush-alt:before {
            content: '\eac7'
        }

        .uil-circle-layer:before {
            content: '\eac8'
        }

        .uil-modem:before {
            content: '\eac9'
        }

        .uil-webcam:before {
            content: '\eaca'
        }

        .uil-hdd:before {
            content: '\eacb'
        }

        .uil-monitor:before {
            content: '\eacc'
        }

        .uil-dice-four:before {
            content: '\eacd'
        }

        .uil-wifi-router:before {
            content: '\eace'
        }

        .uil-dice-five:before {
            content: '\eacf'
        }

        .uil-dice-one:before {
            content: '\ead0'
        }

        .uil-dice-two:before {
            content: '\ead1'
        }

        .uil-dice-six:before {
            content: '\ead2'
        }

        .uil-windy:before {
            content: '\ead3'
        }

        .uil-swatchbook:before {
            content: '\ead4'
        }

        .uil-cancel:before {
            content: '\ead5'
        }

        .uil-clouds:before {
            content: '\ead6'
        }

        .uil-mountains-sun:before {
            content: '\ead7'
        }

        .uil-history:before {
            content: '\ead8'
        }

        .uil-n-a:before {
            content: '\ead9'
        }

        .uil-plane:before {
            content: '\eada'
        }

        .uil-plane-departure:before {
            content: '\eadb'
        }

        .uil-auto-flash:before {
            content: '\eadc'
        }

        .uil-glass-martini:before {
            content: '\eadd'
        }

        .uil-mobile-vibrate:before {
            content: '\eade'
        }

        .uil-trees:before {
            content: '\eadf'
        }

        .uil-voicemail:before {
            content: '\eae0'
        }

        .uil-voicemail-rectangle:before {
            content: '\eae1'
        }

        .uil-plane-fly:before {
            content: '\eae2'
        }

        .uil-sync-exclamation:before {
            content: '\eae3'
        }

        .uil-tachometer-fast:before {
            content: '\eae4'
        }

        .uil-sign-in-alt:before {
            content: '\eae5'
        }

        .uil-archive-alt:before {
            content: '\eae6'
        }

        .uil-power:before {
            content: '\eae7'
        }

        .uil-pizza-slice:before {
            content: '\eae9'
        }

        .uil-refresh:before {
            content: '\eaea'
        }

        .uil-anchor:before {
            content: '\eaeb'
        }

        .uil-sync-slash:before {
            content: '\eaec'
        }

        .uil-upload:before {
            content: '\eaed'
        }

        .uil-glass:before {
            content: '\eaee'
        }

        .uil-sign-out-alt:before {
            content: '\eaef'
        }

        .uil-newspaper:before {
            content: '\eaf0'
        }

        .uil-signin:before {
            content: '\eaf1'
        }

        .uil-processor:before {
            content: '\eaf2'
        }

        .uil-hunting:before {
            content: '\eaf3'
        }

        .uil-coffee:before {
            content: '\eaf4'
        }

        .uil-history-alt:before {
            content: '\eaf5'
        }

        .uil-weight:before {
            content: '\eaf6'
        }

        .uil-plane-arrival:before {
            content: '\eaf7'
        }

        .uil-gift:before {
            content: '\eaf8'
        }

        .uil-circuit:before {
            content: '\eaf9'
        }

        .uil-archive:before {
            content: '\eafa'
        }

        .uil-ban:before {
            content: '\eafb'
        }

        .uil-crosshair-alt:before {
            content: '\eafc'
        }

        .uil-crosshair:before {
            content: '\eafd'
        }

        .uil-record-audio:before {
            content: '\eafe'
        }

        .uil-flower:before {
            content: '\eaff'
        }

        .uil-airplay:before {
            content: '\eb00'
        }

        .uil-rss-interface:before {
            content: '\eb01'
        }

        .uil-equal-circle:before {
            content: '\eb02'
        }

        .uil-shutter:before {
            content: '\eb03'
        }

        .uil-microphone-slash:before {
            content: '\eb04'
        }

        .uil-life-ring:before {
            content: '\eb05'
        }

        .uil-sliders-v-alt:before {
            content: '\eb06'
        }

        .uil-compact-disc:before {
            content: '\eb07'
        }

        .uil-sitemap:before {
            content: '\eb08'
        }

        .uil-sliders-v:before {
            content: '\eb09'
        }

        .uil-shutter-alt:before {
            content: '\eb0a'
        }

        .uil-clapper-board:before {
            content: '\eb0b'
        }

        .uil-water:before {
            content: '\eb0c'
        }

        .uil-rainbow:before {
            content: '\eb0d'
        }

        .uil-desert:before {
            content: '\eb0e'
        }

        .uil-sunset:before {
            content: '\eb0f'
        }

        .uil-mountains:before {
            content: '\eb10'
        }

        .uil-bolt-slash:before {
            content: '\eb11'
        }

        .uil-telescope:before {
            content: '\eb12'
        }

        .uil-sperms:before {
            content: '\eb13'
        }

        .uil-game-structure:before {
            content: '\eb14'
        }

        .uil-ticket:before {
            content: '\eb15'
        }

        .uil-presentation-play:before {
            content: '\eb16'
        }

        .uil-book-open:before {
            content: '\eb17'
        }

        .uil-notebooks:before {
            content: '\eb18'
        }

        .uil-award-alt:before {
            content: '\eb19'
        }

        .uil-bug:before {
            content: '\eb1a'
        }

        .uil-browser:before {
            content: '\eb1b'
        }

        .uil-rss-alt:before {
            content: '\eb1c'
        }

        .uil-building:before {
            content: '\eb1d'
        }

        .uil-lamp:before {
            content: '\eb1e'
        }

        .uil-heart-rate:before {
            content: '\eb1f'
        }

        .uil-swimmer:before {
            content: '\eb20'
        }

        .uil-pump:before {
            content: '\eb21'
        }

        .uil-crockery:before {
            content: '\eb22'
        }

        .uil-message:before {
            content: '\eb23'
        }

        .uil-bed-double:before {
            content: '\eb24'
        }

        .uil-rope-way:before {
            content: '\eb25'
        }

        .uil-water-glass:before {
            content: '\eb26'
        }

        .uil-rotate-360:before {
            content: '\eb27'
        }

        .uil-feedback:before {
            content: '\eb28'
        }

        .uil-bed:before {
            content: '\eb29'
        }

        .uil-utensils:before {
            content: '\eb2a'
        }

        .uil-align-center-h:before {
            content: '\eb2b'
        }

        .uil-baby-carriage:before {
            content: '\eb2c'
        }

        .uil-post-stamp:before {
            content: '\eb2d'
        }

        .uil-arrow-growth:before {
            content: '\eb2e'
        }

        .uil-enter:before {
            content: '\eb2f'
        }

        .uil-arrow:before {
            content: '\eb30'
        }

        .uil-arrows-shrink-h:before {
            content: '\eb31'
        }

        .uil-arrows-resize:before {
            content: '\eb32'
        }

        .uil-presentation:before {
            content: '\eb33'
        }

        .uil-arrows-h:before {
            content: '\eb34'
        }

        .uil-scaling-right:before {
            content: '\eb35'
        }

        .uil-import:before {
            content: '\eb36'
        }

        .uil-arrow-circle-down:before {
            content: '\eb37'
        }

        .uil-angle-double-down:before {
            content: '\eb38'
        }

        .uil-chart-down:before {
            content: '\eb39'
        }

        .uil-angle-down:before {
            content: '\eb3a'
        }

        .uil-expand-left:before {
            content: '\eb3b'
        }

        .uil-arrow-resize-diagonal:before {
            content: '\eb3c'
        }

        .uil-exchange-alt:before {
            content: '\eb3d'
        }

        .uil-angle-double-left:before {
            content: '\eb3e'
        }

        .uil-expand-alt:before {
            content: '\eb3f'
        }

        .uil-compress-arrows:before {
            content: '\eb40'
        }

        .uil-caret-right:before {
            content: '\eb41'
        }

        .uil-scroll-h:before {
            content: '\eb42'
        }

        .uil-angle-double-right:before {
            content: '\eb43'
        }

        .uil-arrow-to-bottom:before {
            content: '\eb44'
        }

        .uil-sort:before {
            content: '\eb45'
        }

        .uil-scaling-left:before {
            content: '\eb46'
        }

        .uil-arrows-resize-h:before {
            content: '\eb47'
        }

        .uil-arrow-from-top:before {
            content: '\eb48'
        }

        .uil-arrows-up-right:before {
            content: '\eb49'
        }

        .uil-arrows-left-down:before {
            content: '\eb4a'
        }

        .uil-arrows-right-down:before {
            content: '\eb4b'
        }

        .uil-arrows-h-alt:before {
            content: '\eb4c'
        }

        .uil-download-alt:before {
            content: '\eb4d'
        }

        .uil-compress-point:before {
            content: '\eb4e'
        }

        .uil-arrow-up-left:before {
            content: '\eb4f'
        }

        .uil-arrow-compress-h:before {
            content: '\eb50'
        }

        .uil-arrows-v-alt:before {
            content: '\eb51'
        }

        .uil-arrows-v:before {
            content: '\eb52'
        }

        .uil-arrows-shrink-v:before {
            content: '\eb53'
        }

        .uil-arrow-break:before {
            content: '\eb54'
        }

        .uil-align-center-v:before {
            content: '\eb55'
        }

        .uil-angle-up:before {
            content: '\eb56'
        }

        .uil-arrow-circle-up:before {
            content: '\eb57'
        }

        .uil-export:before {
            content: '\eb58'
        }

        .uil-arrows-resize-v:before {
            content: '\eb59'
        }

        .uil-upload-alt:before {
            content: '\eb5a'
        }

        .uil-arrow-up-right:before {
            content: '\eb5b'
        }

        .uil-corner-up-right:before {
            content: '\eb5c'
        }

        .uil-angle-double-up:before {
            content: '\eb5d'
        }

        .uil-sorting:before {
            content: '\eb5e'
        }

        .uil-exchange:before {
            content: '\eb5f'
        }

        .uil-corner-down-left:before {
            content: '\eb60'
        }

        .uil-corner-right-down:before {
            content: '\eb61'
        }

        .uil-corner-down-right:before {
            content: '\eb62'
        }

        .uil-corner-up-left:before {
            content: '\eb63'
        }

        .uil-corner-left-down:before {
            content: '\eb64'
        }

        .uil-maximize-left:before {
            content: '\eb65'
        }

        .uil-corner-up-right-alt:before {
            content: '\eb66'
        }

        .uil-corner-down-right-alt:before {
            content: '\eb67'
        }

        .uil-top-arrow-from-top:before {
            content: '\eb68'
        }

        .uil-top-arrow-to-top:before {
            content: '\eb69'
        }

        .uil-arrow-random:before {
            content: '\eb6a'
        }

        .uil-shuffle:before {
            content: '\eb6b'
        }

        .uil-direction:before {
            content: '\eb6c'
        }

        .uil-angle-right:before {
            content: '\eb6d'
        }

        .uil-arrow-circle-right:before {
            content: '\eb6e'
        }

        .uil-arrow-to-right:before {
            content: '\eb6f'
        }

        .uil-arrow-from-right:before {
            content: '\eb70'
        }

        .uil-expand-from-corner:before {
            content: '\eb71'
        }

        .uil-expand-arrows:before {
            content: '\eb72'
        }

        .uil-arrows-maximize:before {
            content: '\eb73'
        }

        .uil-arrow-down-left:before {
            content: '\eb74'
        }

        .uil-expand-arrows-alt:before {
            content: '\eb75'
        }

        .uil-compress-alt:before {
            content: '\eb76'
        }

        .uil-scroll:before {
            content: '\eb77'
        }

        .uil-arrow-circle-left:before {
            content: '\eb78'
        }

        .uil-angle-left:before {
            content: '\eb79'
        }

        .uil-arrows-merge:before {
            content: '\eb7a'
        }

        .uil-arrow-down-right:before {
            content: '\eb7b'
        }

        .uil-corner-up-left-alt:before {
            content: '\eb7c'
        }

        .uil-left-arrow-to-left:before {
            content: '\eb7d'
        }

        .uil-minus-path:before {
            content: '\eb7e'
        }

        .uil-left-arrow-from-left:before {
            content: '\eb7f'
        }

        .uil-repeat:before {
            content: '\eb80'
        }

        .uil-th-large:before {
            content: '\eb81'
        }

        .uil-line-spacing:before {
            content: '\eb82'
        }

        .uil-shrink:before {
            content: '\eb83'
        }

        .uil-compress-alt-left:before {
            content: '\eb84'
        }

        .uil-bring-front:before {
            content: '\eb85'
        }

        .uil-compress-lines:before {
            content: '\eb86'
        }

        .uil-bring-bottom:before {
            content: '\eb87'
        }

        .uil-compress-v:before {
            content: '\eb88'
        }

        .uil-spin:before {
            content: '\eb89'
        }

        .uil-border-out:before {
            content: '\eb8a'
        }

        .uil-border-horizontal:before {
            content: '\eb8b'
        }

        .uil-document-layout-left:before {
            content: '\eb8c'
        }

        .uil-compress:before {
            content: '\eb8d'
        }

        .uil-grip-horizontal-line:before {
            content: '\eb8e'
        }

        .uil-dialpad-alt:before {
            content: '\eb8f'
        }

        .uil-document-layout-center:before {
            content: '\eb90'
        }

        .uil-border-bottom:before {
            content: '\eb91'
        }

        .uil-dialpad:before {
            content: '\eb92'
        }

        .uil-document-layout-right:before {
            content: '\eb93'
        }

        .uil-align-center:before {
            content: '\eb94'
        }

        .uil-sort-amount-down:before {
            content: '\eb95'
        }

        .uil-align-center-alt:before {
            content: '\eb96'
        }

        .uil-align-letter-right:before {
            content: '\eb97'
        }

        .uil-border-alt:before {
            content: '\eb98'
        }

        .uil-align-center-justify:before {
            content: '\eb99'
        }

        .uil-align-alt:before {
            content: '\eb9a'
        }

        .uil-border-vertical:before {
            content: '\eb9b'
        }

        .uil-sort-amount-up:before {
            content: '\eb9c'
        }

        .uil-wrap-text:before {
            content: '\eb9d'
        }

        .uil-align-left-justify:before {
            content: '\eb9e'
        }

        .uil-angle-right-b:before {
            content: '\eb9f'
        }

        .uil-paragraph:before {
            content: '\eba0'
        }

        .uil-right-indent-alt:before {
            content: '\eba1'
        }

        .uil-border-right:before {
            content: '\eba2'
        }

        .uil-align-right-justify:before {
            content: '\eba3'
        }

        .uil-align:before {
            content: '\eba4'
        }

        .uil-border-clear:before {
            content: '\eba5'
        }

        .uil-align-right:before {
            content: '\eba6'
        }

        .uil-list-ui-alt:before {
            content: '\eba7'
        }

        .uil-left-indent:before {
            content: '\eba8'
        }

        .uil-left-indent-alt:before {
            content: '\eba9'
        }

        .uil-border-left:before {
            content: '\ebaa'
        }

        .uil-border-top:before {
            content: '\ebab'
        }

        .uil-align-justify:before {
            content: '\ebac'
        }

        .uil-subject:before {
            content: '\ebad'
        }

        .uil-bars:before {
            content: '\ebae'
        }

        .uil-eye:before {
            content: '\ebaf'
        }

        .uil-exposure-increase:before {
            content: '\ebb0'
        }

        .uil-bright:before {
            content: '\ebb1'
        }

        .uil-exposure-alt:before {
            content: '\ebb2'
        }

        .uil-capture:before {
            content: '\ebb3'
        }

        .uil-arrow-left:before {
            content: '\ebb4'
        }

        .uil-arrow-right:before {
            content: '\ebb5'
        }

        .uil-arrow-up:before {
            content: '\ebb6'
        }

        .uil-focus-target:before {
            content: '\ebb7'
        }

        .uil-external-link-alt:before {
            content: '\ebb8'
        }

        .uil-card-atm:before {
            content: '\ebb9'
        }

        .uil-focus-add:before {
            content: '\ebba'
        }

        .uil-focus:before {
            content: '\ebbb'
        }

        .uil-border-inner:before {
            content: '\ebbc'
        }

        .uil-glass-tea:before {
            content: '\ebbd'
        }

        .uil-streering:before {
            content: '\ebbe'
        }

        .uil-tv-retro-slash:before {
            content: '\ebbf'
        }

        .uil-wrench:before {
            content: '\ebc0'
        }

        .uil-football-american:before {
            content: '\ebc1'
        }

        .uil-water-drop-slash:before {
            content: '\ebc2'
        }

        .uil-layers:before {
            content: '\ebc3'
        }

        .uil-print-slash:before {
            content: '\ebc4'
        }

        .uil-android-phone-slash:before {
            content: '\ebc5'
        }

        .uil-calendar-slash:before {
            content: '\ebc6'
        }

        .uil-image-slash:before {
            content: '\ebc7'
        }

        .uil-image-alt-slash:before {
            content: '\ebc8'
        }

        .uil-lock-slash:before {
            content: '\ebc9'
        }

        .uil-money-bill-slash:before {
            content: '\ebca'
        }

        .uil-comment-slash:before {
            content: '\ebcb'
        }

        .uil-map-marker-slash:before {
            content: '\ebcc'
        }

        .uil-tear:before {
            content: '\ebcd'
        }

        .uil-comment-alt-slash:before {
            content: '\ebce'
        }

        .uil-folder-slash:before {
            content: '\ebcf'
        }

        .uil-filter-slash:before {
            content: '\ebd0'
        }

        .uil-file-slash:before {
            content: '\ebd1'
        }

        .uil-file-lanscape-slash:before {
            content: '\ebd2'
        }

        .uil-glass-martini-alt-slash:before {
            content: '\ebd3'
        }

        .uil-car-slash:before {
            content: '\ebd4'
        }

        .uil-camera-slash:before {
            content: '\ebd5'
        }

        .uil-list-ul:before {
            content: '\ebd6'
        }

        .uil-layer-group-slash:before {
            content: '\ebd7'
        }

        .uil-plug:before {
            content: '\ebd8'
        }

        .uil-bell-slash:before {
            content: '\ebd9'
        }

        .uil-expand-right:before {
            content: '\ebda'
        }

        .uil-bell:before {
            content: '\ebdb'
        }

        .uil-desktop-alt-slash:before {
            content: '\ebdc'
        }

        .uil-align-left:before {
            content: '\ebdd'
        }

        .uil-layers-slash:before {
            content: '\ebde'
        }

        .uil-angry:before {
            content: '\ebdf'
        }

        .uil-ear:before {
            content: '\ebe0'
        }

        .uil-desktop-slash:before {
            content: '\ebe1'
        }

        .uil-text-strike-through:before {
            content: '\ebe2'
        }

        .uil-bold:before {
            content: '\ebe3'
        }

        .uil-text:before {
            content: '\ebe4'
        }

        .uil-assistive-listening-systems:before {
            content: '\ebe5'
        }

        .uil-palette:before {
            content: '\ebe6'
        }

        .uil-underline:before {
            content: '\ebe7'
        }

        .uil-text-fields:before {
            content: '\ebe8'
        }

        .uil-arrow-down:before {
            content: '\ebe9'
        }

        .uil-text-size:before {
            content: '\ebea'
        }

        .uil-italic:before {
            content: '\ebeb'
        }

        .uil-right-to-left-text-direction:before {
            content: '\ebec'
        }

        .uil-sigma:before {
            content: '\ebed'
        }

        .uil-12-plus:before {
            content: '\ebee'
        }

        .uil-left-to-right-text-direction:before {
            content: '\ebef'
        }

        .uil-10-plus:before {
            content: '\ebf0'
        }

        .uil-16-plus:before {
            content: '\ebf1'
        }

        .uil-13-plus:before {
            content: '\ebf2'
        }

        .uil-21-plus:before {
            content: '\ebf3'
        }

        .uil-17-plus:before {
            content: '\ebf4'
        }

        .uil-6-plus:before {
            content: '\ebf5'
        }

        .uil-0-plus:before {
            content: '\ebf6'
        }

        .uil-3-plus:before {
            content: '\ebf7'
        }

        .uil-eye-slash:before {
            content: '\ebf8'
        }

        .uil-archway:before {
            content: '\ebf9'
        }

        .uil-18-plus:before {
            content: '\ebfa'
        }

        .uil-robot:before {
            content: '\ebfb'
        }

        .uil-selfie:before {
            content: '\ebfc'
        }

        .uil-bag-slash:before {
            content: '\ebfd'
        }

        .uil-instagram:before {
            content: '\ebfe'
        }

        .uil-line:before {
            content: '\ebff'
        }

        .uil-facebook-messenger:before {
            content: '\ec00'
        }

        .uil-facebook-f:before {
            content: '\ec01'
        }

        .uil-black-berry:before {
            content: '\ec02'
        }

        .uil-linkedin:before {
            content: '\ec03'
        }

        .uil-snapchat-ghost:before {
            content: '\ec04'
        }

        .uil-intercom:before {
            content: '\ec05'
        }

        .uil-youtube:before {
            content: '\ec06'
        }

        .uil-snapchat-square:before {
            content: '\ec07'
        }

        .uil-apple:before {
            content: '\ec08'
        }

        .uil-instagram-alt:before {
            content: '\ec09'
        }

        .uil-whatsapp-alt:before {
            content: '\ec0a'
        }

        .uil-behance:before {
            content: '\ec0b'
        }

        .uil-twitter:before {
            content: '\ec0c'
        }

        .uil-500px:before {
            content: '\ec0d'
        }

        .uil-tumblr:before {
            content: '\ec0e'
        }

        .uil-github-alt:before {
            content: '\ec0f'
        }

        .uil-tumblr-square:before {
            content: '\ec10'
        }

        .uil-google:before {
            content: '\ec11'
        }

        .uil-medium-m:before {
            content: '\ec12'
        }

        .uil-slack:before {
            content: '\ec13'
        }

        .uil-paypal:before {
            content: '\ec14'
        }

        .uil-reddit-alien-alt:before {
            content: '\ec15'
        }

        .uil-linkedin-alt:before {
            content: '\ec16'
        }

        .uil-google-hangouts:before {
            content: '\ec17'
        }

        .uil-java-script:before {
            content: '\ec18'
        }

        .uil-google-play:before {
            content: '\ec19'
        }

        .uil-google-drive:before {
            content: '\ec1a'
        }

        .uil-asterisk:before {
            content: '\ec1b'
        }

        .uil-android:before {
            content: '\ec1c'
        }

        .uil-github:before {
            content: '\ec1d'
        }

        .uil-balance-scale:before {
            content: '\ec1e'
        }

        .uil-amazon:before {
            content: '\ec1f'
        }

        .uil-slack-alt:before {
            content: '\ec20'
        }

        .uil-dashboard:before {
            content: '\ec21'
        }

        .uil-vuejs-alt:before {
            content: '\ec22'
        }

        .uil-adobe-alt:before {
            content: '\ec23'
        }

        .uil-ankh:before {
            content: '\ec24'
        }

        .uil-twitter-alt:before {
            content: '\ec25'
        }

        .uil-opera:before {
            content: '\ec26'
        }

        .uil-intercom-alt:before {
            content: '\ec27'
        }

        .uil-tumblr-alt:before {
            content: '\ec28'
        }

        .uil-react:before {
            content: '\ec29'
        }

        .uil-camera-change:before {
            content: '\ec2a'
        }

        .uil-master-card:before {
            content: '\ec2b'
        }

        .uil-snapchat-alt:before {
            content: '\ec2c'
        }

        .uil-opera-alt:before {
            content: '\ec2d'
        }

        .uil-html3-alt:before {
            content: '\ec2e'
        }

        .uil-swiggy:before {
            content: '\ec2f'
        }

        .uil-html3:before {
            content: '\ec30'
        }

        .uil-google-hangouts-alt:before {
            content: '\ec31'
        }

        .uil-adobe:before {
            content: '\ec32'
        }

        .uil-facebook-messenger-alt:before {
            content: '\ec33'
        }

        .uil-blogger-alt:before {
            content: '\ec34'
        }

        .uil-blogger:before {
            content: '\ec35'
        }

        .uil-behance-alt:before {
            content: '\ec36'
        }

        .uil-apple-alt:before {
            content: '\ec37'
        }

        .uil-bitcoin:before {
            content: '\ec38'
        }

        .uil-megaphone:before {
            content: '\ec39'
        }

        .uil-bitcoin-alt:before {
            content: '\ec3a'
        }

        .uil-bowling-ball:before {
            content: '\ec3b'
        }

        .uil-percentage:before {
            content: '\ec3c'
        }

        .uil-hourglass:before {
            content: '\ec3d'
        }

        .uil-process:before {
            content: '\ec3e'
        }

        .uil-university:before {
            content: '\ec3f'
        }

        .uil-skype-alt:before {
            content: '\ec40'
        }

        .uil-wind-sun:before {
            content: '\ec41'
        }

        .uil-vk-alt:before {
            content: '\ec42'
        }

        .uil-skype:before {
            content: '\ec43'
        }

        .uil-telegram-alt:before {
            content: '\ec44'
        }

        .uil-vuejs:before {
            content: '\ec45'
        }

        .uil-vk:before {
            content: '\ec46'
        }

        .uil-telegram:before {
            content: '\ec47'
        }

        .uil-yin-yang:before {
            content: '\ec48'
        }

        .uil-angle-left-b:before {
            content: '\ec49'
        }

        .uil-bath:before {
            content: '\ec4a'
        }

        .uil-metro:before {
            content: '\ec4b'
        }

        .uil-comment-add:before {
            content: '\ec4c'
        }

        .uil-fire:before {
            content: '\ec4d'
        }

        .uil-qrcode-scan:before {
            content: '\ec4e'
        }

        .uil-panel-add:before {
            content: '\ec4f'
        }

        .uil-brackets-curly:before {
            content: '\ec50'
        }

        .uil-folder-open:before {
            content: '\ec51'
        }

        .uil-comparison:before {
            content: '\ec52'
        }

        .uil-file-export:before {
            content: '\ec53'
        }

        .uil-channel-add:before {
            content: '\ec54'
        }

        .uil-rupee-sign:before {
            content: '\ec55'
        }

        .uil-channel:before {
            content: '\ec56'
        }

        .uil-link-add:before {
            content: '\ec57'
        }

        .uil-file-import:before {
            content: '\ec58'
        }

        .uil-x:before {
            content: '\ec59'
        }

        .uil-save:before {
            content: '\ec5a'
        }

        .uil-heart-break:before {
            content: '\ec5b'
        }

        .uil-tachometer-fast-alt:before {
            content: '\ec5c'
        }

        .uil-facebook:before {
            content: '\ec5d'
        }

        .uil-create-dashboard:before {
            content: '\ec5e'
        }

        .uil-whatsapp:before {
            content: '\ec5f'
        }

        .uil-setting:before {
            content: '\ec60'
        }

        .uil-rocket:before {
            content: '\ec61'
        }

        .uil-share:before {
            content: '\ec62'
        }

        .uil-x-add:before {
            content: '\ec63'
        }

        .uil-user-nurse:before {
            content: '\ec64'
        }

        .uil-microscope:before {
            content: '\ec65'
        }

        .uil-virus-slash:before {
            content: '\ec66'
        }

        .uil-visual-studio:before {
            content: '\ec67'
        }

        .uil-head-side-mask:before {
            content: '\ec68'
        }

        .uil-baseball-ball:before {
            content: '\ec69'
        }

        .uil-stethoscope-alt:before {
            content: '\ec6a'
        }

        .uil-hospital-symbol:before {
            content: '\ec6b'
        }

        .uil-hospital-square-sign:before {
            content: '\ec6c'
        }

        .uil-head-side:before {
            content: '\ec6d'
        }

        .uil-head-side-cough:before {
            content: '\ec6e'
        }

        .uil-clinic-medical:before {
            content: '\ec6f'
        }

        .uil-wind-moon:before {
            content: '\ec70'
        }

        .uil-hospital:before {
            content: '\ec71'
        }

        .uil-stethoscope:before {
            content: '\ec72'
        }

        .uil-sanitizer:before {
            content: '\ec73'
        }

        .uil-toilet-paper:before {
            content: '\ec74'
        }

        .uil-coronavirus:before {
            content: '\ec75'
        }

        .uil-user-arrows:before {
            content: '\ec76'
        }

        .uil-house-user:before {
            content: '\ec77'
        }

        .uil-social-distancing:before {
            content: '\ec78'
        }

        .uil-credit-card-search:before {
            content: '\ec79'
        }

        .uil-android-alt:before {
            content: '\ec7a'
        }

        .uil-shield-plus:before {
            content: '\ec7b'
        }

        .uil-user-md:before {
            content: '\ec7c'
        }

        .uil-transaction:before {
            content: '\ec7d'
        }

        .uil-store-slash:before {
            content: '\ec7e'
        }

        .uil-code-branch:before {
            content: '\ec7f'
        }

        .uil-google-drive-alt:before {
            content: '\ec80'
        }

        .uil-sanitizer-alt:before {
            content: '\ec80'
        }

        .uil-envelope-block:before {
            content: '\ec81'
        }

        .uil-mailbox-alt:before {
            content: '\ec82'
        }

        .uil-raindrops-alt:before {
            content: '\ec83'
        }

        .uil-signout:before {
            content: '\ec83'
        }

        .uil-slider-h:before {
            content: '\ec84'
        }

        .uil-lira-sign:before {
            content: '\ec85'
        }

        .uil-slider-h-range:before {
            content: '\ec86'
        }

        .uil-file-graph:before {
            content: '\ec87'
        }

        .uil-wordpress-simple:before {
            content: '\ec88'
        }

        .uil-bing:before {
            content: '\ec89'
        }

        .uil-wordpress:before {
            content: '\ec8a'
        }

        .uil-html5:before {
            content: '\ec8b'
        }

        .uil-programming-language:before {
            content: '\ec8c'
        }

        .uil-css3-simple:before {
            content: '\ec8d'
        }

        .uil-html5-alt:before {
            content: '\ec8e'
        }

        .uil-discord:before {
            content: '\ec8f'
        }

        .uil-draggabledots:before {
            content: '\ec90'
        }

        .uil-font:before {
            content: '\ec91'
        }

        .uil-video-question:before {
            content: '\ec92'
        }

        .uil-headphone-slash:before {
            content: '\ec93'
        }

        .uil-info:before {
            content: '\ec94'
        }

        .uil-letter-chinese-a:before {
            content: '\ec95'
        }

        .uil-letter-hindi-a:before {
            content: '\ec96'
        }

        .uil-english-to-chinese:before {
            content: '\ec97'
        }

        .uil-question:before {
            content: '\ec98'
        }

        .uil-letter-english-a:before {
            content: '\ec99'
        }

        .uil-hindi-to-chinese:before {
            content: '\ec9a'
        }

        .uil-inbox:before {
            content: '\ec9b'
        }

        .uil-letter-japanese-a:before {
            content: '\ec9c'
        }

        .uil-exclamation:before {
            content: '\ec9d'
        }

        .uil-language:before {
            content: '\ec9e'
        }

        .uil-grin:before {
            content: '\e878'
        }

        .uil-sad-cry:before {
            content: '\e879'
        }

        .uil-sad-crying:before {
            content: '\e87a'
        }

        .uil-surprise:before {
            content: '\e87b'
        }

        .uil-unamused:before {
            content: '\e87c'
        }

        .uil-confused:before {
            content: '\e87d'
        }

        .uil-grin-tongue-wink:before {
            content: '\e87e'
        }

        .uil-grin-tongue-wink-alt:before {
            content: '\e87f'
        }

        .uil-kid:before {
            content: '\e880'
        }

        .uil-smile-wink-alt:before {
            content: '\e881'
        }

        .uil-smile-squint-wink:before {
            content: '\e882'
        }

        .uil-annoyed-alt:before {
            content: '\e883'
        }

        .uil-silent-squint:before {
            content: '\e884'
        }

        .uil-sick:before {
            content: '\e885'
        }

        .uil-shopping-cart-alt:before {
            content: '\e886'
        }

        .uil-shopping-bag:before {
            content: '\e887'
        }

        .uil-pricetag-alt:before {
            content: '\e888'
        }

        .uil-shopping-cart:before {
            content: '\e889'
        }

        .uil-smile-squint-wink-alt:before {
            content: '\e88a'
        }

        .uil-store-alt:before {
            content: '\e88b'
        }

        .uil-emoji:before {
            content: '\e88c'
        }

        .uil-trademark-circle:before {
            content: '\e88d'
        }

        .uil-basketball:before {
            content: '\e88e'
        }

        .uil-square-shape:before {
            content: '\e88f'
        }

        .uil-label:before {
            content: '\e890'
        }

        .uil-shopping-basket:before {
            content: '\e891'
        }

        .uil-smile-wink:before {
            content: '\e892'
        }

        .uil-tag:before {
            content: '\e893'
        }

        .uil-label-alt:before {
            content: '\e894'
        }

        .uil-tag-alt:before {
            content: '\e895'
        }

        .uil-store:before {
            content: '\e896'
        }

        .uil-meh-closed-eye:before {
            content: '\e897'
        }

        .uil-trophy:before {
            content: '\e898'
        }

        .uil-dice-three:before {
            content: '\e899'
        }

        .uil-football-ball:before {
            content: '\e89a'
        }

        .uil-basketball-hoop:before {
            content: '\e89b'
        }

        .uil-club:before {
            content: '\e89c'
        }

        .uil-tennis-ball:before {
            content: '\e89d'
        }

        .uil-football:before {
            content: '\e89e'
        }

        .uil-volleyball:before {
            content: '\e89f'
        }

        .uil-heart-sign:before {
            content: '\e8a0'
        }

        .uil-spade:before {
            content: '\e8a1'
        }

        .uil-diamond:before {
            content: '\e8a2'
        }

        .uil-money-stack:before {
            content: '\e8a3'
        }

        .uil-money-withdrawal:before {
            content: '\e8a4'
        }

        .uil-presentation-line:before {
            content: '\e8a5'
        }

        .uil-kayak:before {
            content: '\e8a6'
        }

        .uil-chart-pie:before {
            content: '\e8a7'
        }

        .uil-dumbbell:before {
            content: '\e8a8'
        }

        .uil-suitcase-alt:before {
            content: '\e8a9'
        }

        .uil-yen:before {
            content: '\e8aa'
        }

        .uil-yen-circle:before {
            content: '\e8ab'
        }

        .uil-briefcase-alt:before {
            content: '\e8ac'
        }

        .uil-receipt:before {
            content: '\e8ad'
        }

        .uil-pound:before {
            content: '\e8ae'
        }

        .uil-invoice:before {
            content: '\e8af'
        }

        .uil-pound-circle:before {
            content: '\e8b0'
        }

        .uil-analysis:before {
            content: '\e8b1'
        }

        .uil-suitcase:before {
            content: '\e8b2'
        }

        .uil-moneybag-alt:before {
            content: '\e8b3'
        }

        .uil-bag-alt:before {
            content: '\e8b4'
        }

        .uil-moneybag:before {
            content: '\e8b5'
        }

        .uil-bag:before {
            content: '\e8b6'
        }

        .uil-money-insert:before {
            content: '\e8b7'
        }

        .uil-chart-line:before {
            content: '\e8b8'
        }

        .uil-dollar-sign-alt:before {
            content: '\e8b9'
        }

        .uil-euro:before {
            content: '\e8ba'
        }

        .uil-usd-circle:before {
            content: '\e8bb'
        }

        .uil-euro-circle:before {
            content: '\e8bc'
        }

        .uil-usd-square:before {
            content: '\e8bd'
        }

        .uil-money-bill-stack:before {
            content: '\e8be'
        }

        .uil-dollar-alt:before {
            content: '\e8bf'
        }

        .uil-money-withdraw:before {
            content: '\e8c0'
        }

        .uil-credit-card:before {
            content: '\e8c1'
        }

        .uil-money-bill:before {
            content: '\e8c2'
        }

        .uil-bitcoin-sign:before {
            content: '\e8c3'
        }

        .uil-signal-alt-3:before {
            content: '\e8c4'
        }

        .uil-receipt-alt:before {
            content: '\e8c5'
        }

        .uil-graph-bar:before {
            content: '\e8c6'
        }

        .uil-analytics:before {
            content: '\e8c7'
        }

        .uil-table-tennis:before {
            content: '\e8c8'
        }

        .uil-bill:before {
            content: '\e8c9'
        }

        .uil-chart-bar:before {
            content: '\e8ca'
        }

        .uil-chart-growth:before {
            content: '\e8cb'
        }

        .uil-chart-growth-alt:before {
            content: '\e8cc'
        }

        .uil-shop:before {
            content: '\e8cd'
        }

        .uil-chart-bar-alt:before {
            content: '\e8ce'
        }

        .uil-dollar-sign:before {
            content: '\e8cf'
        }

        .uil-chart:before {
            content: '\e8d0'
        }

        .uil-briefcase:before {
            content: '\e8d1'
        }

        .uil-bitcoin-circle:before {
            content: '\e8d2'
        }

        .uil-chart-pie-alt:before {
            content: '\e8d3'
        }

        .uil-golf-ball:before {
            content: '\e8d4'
        }

        .uil-calculator-alt:before {
            content: '\e8d5'
        }

        .uil-coins:before {
            content: '\e8d6'
        }

        .uil-map-pin-alt:before {
            content: '\e8d7'
        }

        .uil-lightbulb:before {
            content: '\e8d8'
        }

        .uil-map-marker-question:before {
            content: '\e8d9'
        }

        .uil-map-marker-shield:before {
            content: '\e8da'
        }

        .uil-schedule:before {
            content: '\e8db'
        }

        .uil-calendar-alt:before {
            content: '\e8dc'
        }

        .uil-crosshairs:before {
            content: '\e8dd'
        }

        .uil-puzzle-piece:before {
            content: '\e8de'
        }

        .uil-gold:before {
            content: '\e8df'
        }

        .uil-compass:before {
            content: '\e8e0'
        }

        .uil-map:before {
            content: '\e8e1'
        }

        .uil-location-point:before {
            content: '\e8e2'
        }

        .uil-map-marker-info:before {
            content: '\e8e3'
        }

        .uil-map-marker-edit:before {
            content: '\e8e4'
        }

        .uil-map-marker-plus:before {
            content: '\e8e5'
        }

        .uil-map-pin:before {
            content: '\e8e6'
        }

        .uil-navigator:before {
            content: '\e8e7'
        }

        .uil-location-pin-alt:before {
            content: '\e8e8'
        }

        .uil-map-marker-minus:before {
            content: '\e8e9'
        }

        .uil-map-marker-alt:before {
            content: '\e8ea'
        }

        .uil-sign-left:before {
            content: '\e8eb'
        }

        .uil-map-marker:before {
            content: '\e8ec'
        }

        .uil-sign-right:before {
            content: '\e8ed'
        }

        .uil-directions:before {
            content: '\e8ee'
        }

        .uil-location-arrow:before {
            content: '\e8ef'
        }

        .uil-dna:before {
            content: '\e8f0'
        }

        .uil-sign-alt:before {
            content: '\e8f1'
        }

        .uil-presentation-lines-alt:before {
            content: '\e8f2'
        }

        .uil-atom:before {
            content: '\e8f3'
        }

        .uil-flask:before {
            content: '\e8f4'
        }

        .uil-diary:before {
            content: '\e8f5'
        }

        .uil-presentation-times:before {
            content: '\e8f6'
        }

        .uil-diary-alt:before {
            content: '\e8f7'
        }

        .uil-presentation-plus:before {
            content: '\e8f8'
        }

        .uil-presentation-minus:before {
            content: '\e8f9'
        }

        .uil-presentation-edit:before {
            content: '\e8fa'
        }

        .uil-backpack:before {
            content: '\e8fb'
        }

        .uil-notes:before {
            content: '\e8fc'
        }

        .uil-location-arrow-alt:before {
            content: '\e8fd'
        }

        .uil-book-alt:before {
            content: '\e8fe'
        }

        .uil-book:before {
            content: '\e8ff'
        }

        .uil-medal:before {
            content: '\e900'
        }

        .uil-award:before {
            content: '\e901'
        }

        .uil-flask-potion:before {
            content: '\e902'
        }

        .uil-bell-school:before {
            content: '\e903'
        }

        .uil-podium:before {
            content: '\e904'
        }

        .uil-graduation-cap:before {
            content: '\e905'
        }

        .uil-medical-square:before {
            content: '\e906'
        }

        .uil-ambulance:before {
            content: '\e907'
        }

        .uil-medical-square-full:before {
            content: '\e908'
        }

        .uil-cell:before {
            content: '\e909'
        }

        .uil-band-aid:before {
            content: '\e90a'
        }

        .uil-lightbulb-alt:before {
            content: '\e90b'
        }

        .uil-wheelchair-alt:before {
            content: '\e90c'
        }

        .uil-thermometer:before {
            content: '\e90d'
        }

        .uil-abacus:before {
            content: '\e90e'
        }

        .uil-syringe:before {
            content: '\e90f'
        }

        .uil-tablets:before {
            content: '\e910'
        }

        .uil-capsule:before {
            content: '\e911'
        }

        .uil-stretcher:before {
            content: '\e912'
        }

        .uil-presentation-check:before {
            content: '\e913'
        }

        .uil-medkit:before {
            content: '\e914'
        }

        .uil-meeting-board:before {
            content: '\e915'
        }

        .uil-monitor-heart-rate:before {
            content: '\e916'
        }

        .uil-file-medical-alt:before {
            content: '\e917'
        }

        .uil-heartbeat:before {
            content: '\e918'
        }

        .uil-prescription-bottle:before {
            content: '\e919'
        }

        .uil-clock-two:before {
            content: '\e91a'
        }

        .uil-medical-drip:before {
            content: '\e91b'
        }

        .uil-book-medical:before {
            content: '\e91c'
        }

        .uil-watch-alt:before {
            content: '\e91d'
        }

        .uil-stopwatch:before {
            content: '\e91e'
        }

        .uil-watch:before {
            content: '\e91f'
        }

        .uil-clock:before {
            content: '\e920'
        }

        .uil-clock-seven:before {
            content: '\e921'
        }

        .uil-clock-three:before {
            content: '\e922'
        }

        .uil-clock-nine:before {
            content: '\e923'
        }

        .uil-clock-ten:before {
            content: '\e924'
        }

        .uil-files-landscapes:before {
            content: '\e925'
        }

        .uil-clock-five:before {
            content: '\e926'
        }

        .uil-brain:before {
            content: '\e927'
        }

        .uil-file-plus-alt:before {
            content: '\e928'
        }

        .uil-file-network:before {
            content: '\e929'
        }

        .uil-file-contract-dollar:before {
            content: '\e92a'
        }

        .uil-file-upload-alt:before {
            content: '\e92b'
        }

        .uil-clock-eight:before {
            content: '\e92c'
        }

        .uil-clipboard-alt:before {
            content: '\e92d'
        }

        .uil-books:before {
            content: '\e92e'
        }

        .uil-file-search-alt:before {
            content: '\e92f'
        }

        .uil-file-upload:before {
            content: '\e930'
        }

        .uil-file-share-alt:before {
            content: '\e931'
        }

        .uil-file-minus-alt:before {
            content: '\e932'
        }

        .uil-folder-minus:before {
            content: '\e933'
        }

        .uil-file-shield-alt:before {
            content: '\e934'
        }

        .uil-file-minus:before {
            content: '\e935'
        }

        .uil-folder-medical:before {
            content: '\e936'
        }

        .uil-file-redo-alt:before {
            content: '\e937'
        }

        .uil-file-lock-alt:before {
            content: '\e938'
        }

        .uil-folder-lock:before {
            content: '\e939'
        }

        .uil-heart-medical:before {
            content: '\e93a'
        }

        .uil-file-question-alt:before {
            content: '\e93b'
        }

        .uil-files-landscapes-alt:before {
            content: '\e93c'
        }

        .uil-file-medical:before {
            content: '\e93d'
        }

        .uil-file-landscape:before {
            content: '\e93e'
        }

        .uil-file-question:before {
            content: '\e93f'
        }

        .uil-folder-question:before {
            content: '\e940'
        }

        .uil-file-landscape-alt:before {
            content: '\e941'
        }

        .uil-folder:before {
            content: '\e942'
        }

        .uil-file-edit-alt:before {
            content: '\e943'
        }

        .uil-folder-heart:before {
            content: '\e944'
        }

        .uil-folder-exclamation:before {
            content: '\e945'
        }

        .uil-folder-info:before {
            content: '\e946'
        }

        .uil-file-download-alt:before {
            content: '\e947'
        }

        .uil-file-download:before {
            content: '\e948'
        }

        .uil-file-copy-alt:before {
            content: '\e949'
        }

        .uil-file-heart:before {
            content: '\e94a'
        }

        .uil-file-alt:before {
            content: '\e94b'
        }

        .uil-copy-landscape:before {
            content: '\e94c'
        }

        .uil-copy-alt:before {
            content: '\e94d'
        }

        .uil-folder-upload:before {
            content: '\e94e'
        }

        .uil-file-exclamation-alt:before {
            content: '\e94f'
        }

        .uil-file-exclamation:before {
            content: '\e950'
        }

        .uil-copy:before {
            content: '\e951'
        }

        .uil-file-blank:before {
            content: '\e952'
        }

        .uil-stopwatch-slash:before {
            content: '\e953'
        }

        .uil-file:before {
            content: '\e954'
        }

        .uil-folder-times:before {
            content: '\e955'
        }

        .uil-document-info:before {
            content: '\e956'
        }

        .uil-file-times:before {
            content: '\e957'
        }

        .uil-file-info-alt:before {
            content: '\e958'
        }

        .uil-clipboard-blank:before {
            content: '\e959'
        }

        .uil-clipboard-notes:before {
            content: '\e95a'
        }

        .uil-file-times-alt:before {
            content: '\e95b'
        }

        .uil-folder-download:before {
            content: '\e95c'
        }

        .uil-file-bookmark-alt:before {
            content: '\e95d'
        }

        .uil-file-block-alt:before {
            content: '\e95e'
        }

        .uil-folder-check:before {
            content: '\e95f'
        }

        .uil-file-check:before {
            content: '\e960'
        }

        .uil-folder-plus:before {
            content: '\e961'
        }

        .uil-clipboard:before {
            content: '\e962'
        }

        .uil-file-check-alt:before {
            content: '\e963'
        }

        .uil-print:before {
            content: '\e964'
        }

        .uil-folder-network:before {
            content: '\e965'
        }

        .uil-desktop-alt:before {
            content: '\e966'
        }

        .uil-mouse-alt:before {
            content: '\e967'
        }

        .uil-tablet:before {
            content: '\e968'
        }

        .uil-desktop:before {
            content: '\e969'
        }

        .uil-mobile-android-alt:before {
            content: '\e96a'
        }

        .uil-search-alt:before {
            content: '\e96b'
        }

        .uil-volume-up:before {
            content: '\e96c'
        }

        .uil-mouse:before {
            content: '\e96d'
        }

        .uil-mouse-alt-2:before {
            content: '\e96e'
        }

        .uil-mobile-android:before {
            content: '\e96f'
        }

        .uil-laptop:before {
            content: '\e970'
        }

        .uil-search-minus:before {
            content: '\e971'
        }

        .uil-bluetooth-b:before {
            content: '\e972'
        }

        .uil-video-slash:before {
            content: '\e973'
        }

        .uil-search-plus:before {
            content: '\e974'
        }

        .uil-tv-retro:before {
            content: '\e975'
        }

        .uil-toggle-on:before {
            content: '\e976'
        }

        .uil-toggle-off:before {
            content: '\e977'
        }

        .uil-traffic-light:before {
            content: '\e978'
        }

        .uil-bolt:before {
            content: '\e979'
        }

        .uil-trash-alt:before {
            content: '\e97a'
        }

        .uil-star-half-alt:before {
            content: '\e97b'
        }

        .uil-utensils-alt:before {
            content: '\e97c'
        }

        .uil-share-alt:before {
            content: '\e97d'
        }

        .uil-volume-down:before {
            content: '\e97e'
        }

        .uil-wifi:before {
            content: '\e97f'
        }

        .uil-cog:before {
            content: '\e980'
        }

        .uil-bookmark:before {
            content: '\e981'
        }

        .uil-wallet:before {
            content: '\e982'
        }

        .uil-minus:before {
            content: '\e983'
        }

        .uil-rss:before {
            content: '\e984'
        }

        .uil-sync:before {
            content: '\e985'
        }

        .uil-redo:before {
            content: '\e986'
        }

        .uil-bookmark-full:before {
            content: '\e987'
        }

        .uil-umbrella:before {
            content: '\e988'
        }

        .uil-trash:before {
            content: '\e989'
        }

        .uil-wifi-slash:before {
            content: '\e98a'
        }

        .uil-plus-square:before {
            content: '\e98b'
        }

        .uil-plus:before {
            content: '\e98c'
        }

        .uil-signal-alt:before {
            content: '\e98d'
        }

        .uil-pen:before {
            content: '\e98e'
        }

        .uil-package:before {
            content: '\e98f'
        }

        .uil-edit:before {
            content: '\e990'
        }

        .uil-signal:before {
            content: '\e991'
        }

        .uil-glass-martini-alt:before {
            content: '\e992'
        }

        .uil-file-plus:before {
            content: '\e993'
        }

        .uil-minus-circle:before {
            content: '\e994'
        }

        .uil-microphone:before {
            content: '\e995'
        }

        .uil-minus-square:before {
            content: '\e996'
        }

        .uil-minus-square-full:before {
            content: '\e997'
        }

        .uil-volume-mute:before {
            content: '\e998'
        }

        .uil-link-h:before {
            content: '\e999'
        }

        .uil-search:before {
            content: '\e99a'
        }

        .uil-ellipsis-v:before {
            content: '\e99b'
        }

        .uil-ellipsis-h:before {
            content: '\e99c'
        }

        .uil-link-alt:before {
            content: '\e99d'
        }

        .uil-calculator:before {
            content: '\e99e'
        }

        .uil-layer-group:before {
            content: '\e99f'
        }

        .uil-car:before {
            content: '\e9a0'
        }

        .uil-thumbs-up:before {
            content: '\e9a1'
        }

        .uil-link:before {
            content: '\e9a2'
        }

        .uil-home-alt:before {
            content: '\e9a3'
        }

        .uil-home:before {
            content: '\e9a4'
        }

        .uil-keyboard:before {
            content: '\e9a5'
        }

        .uil-volume-off:before {
            content: '\e9a6'
        }

        .uil-edit-alt:before {
            content: '\e9a7'
        }

        .uil-restaurant:before {
            content: '\e9a8'
        }

        .uil-exclamation-octagon:before {
            content: '\e9a9'
        }

        .uil-globe:before {
            content: '\e9aa'
        }

        .uil-favorite:before {
            content: '\e9ab'
        }

        .uil-question-circle:before {
            content: '\e9ac'
        }

        .uil-info-circle:before {
            content: '\e9ad'
        }

        .uil-filter:before {
            content: '\e9ae'
        }

        .uil-volume:before {
            content: '\e9af'
        }

        .uil-exclamation-triangle:before {
            content: '\e9b0'
        }

        .uil-exclamation-circle:before {
            content: '\e9b1'
        }

        .uil-thumbs-down:before {
            content: '\e9b2'
        }

        .uil-multiply:before {
            content: '\e9b3'
        }

        .uil-check-square:before {
            content: '\e9b4'
        }

        .uil-times-circle:before {
            content: '\e9b5'
        }

        .uil-box:before {
            content: '\e9b6'
        }

        .uil-sim-card:before {
            content: '\e9b7'
        }

        .uil-times:before {
            content: '\e9b8'
        }

        .uil-times-square:before {
            content: '\e9b9'
        }

        .uil-link-broken:before {
            content: '\e9ba'
        }

        .uil-cube:before {
            content: '\e9bb'
        }

        .uil-bolt-alt:before {
            content: '\e9bc'
        }

        .uil-calender:before {
            content: '\e9bd'
        }

        .uil-battery-empty:before {
            content: '\e9be'
        }

        .uil-at:before {
            content: '\e9bf'
        }

        .uil-battery-bolt:before {
            content: '\e9c0'
        }

        .uil-plus-circle:before {
            content: '\e9c1'
        }

        .uil-check-circle:before {
            content: '\e9c2'
        }

        .uil-check:before {
            content: '\e9c3'
        }

        .uil-adjust-half:before {
            content: '\e9c4'
        }

        .uil-paperclip:before {
            content: '\e9c5'
        }

        .uil-bullseye:before {
            content: '\e9c6'
        }

        .uil-brightness:before {
            content: '\e9c7'
        }

        .uil-adjust-alt:before {
            content: '\e9c8'
        }

        .uil-adjust-circle:before {
            content: '\e9c9'
        }

        .uil-brightness-half:before {
            content: '\e9ca'
        }

        .uil-brightness-empty:before {
            content: '\e9cb'
        }

        .uil-sun:before {
            content: '\e9cc'
        }

        .uil-brightness-plus:before {
            content: '\e9cd'
        }

        .uil-key-skeleton:before {
            content: '\e9ce'
        }

        .uil-backspace:before {
            content: '\e9cf'
        }

        .uil-adjust:before {
            content: '\e9d0'
        }

        .uil-keyboard-hide:before {
            content: '\e9d1'
        }

        .uil-brightness-minus:before {
            content: '\e9d2'
        }

        .uil-key-skeleton-alt:before {
            content: '\e9d3'
        }

        .uil-bus:before {
            content: '\e9d4'
        }

        .uil-parcel:before {
            content: '\e9d5'
        }

        .uil-car-sideview:before {
            content: '\e9d6'
        }

        .uil-car-wash:before {
            content: '\e9d7'
        }

        .uil-bus-school:before {
            content: '\e9d8'
        }

        .uil-subway:before {
            content: '\e9d9'
        }

        .uil-ship:before {
            content: '\e9da'
        }

        .uil-bus-alt:before {
            content: '\e9db'
        }

        .uil-subway-alt:before {
            content: '\e9dc'
        }

        .uil-taxi:before {
            content: '\e9dd'
        }

        .uil-truck-loading:before {
            content: '\e9de'
        }

        .uil-dribbble:before {
            content: '\e9df'
        }

        .uil-dropbox:before {
            content: '\e9e0'
        }

        .uil-envelope-check:before {
            content: '\e9e1'
        }

        .uil-envelope-add:before {
            content: '\e9e2'
        }

        .uil-envelope-exclamation:before {
            content: '\e9e3'
        }

        .uil-phone-slash:before {
            content: '\e9e4'
        }

        .uil-outgoing-call:before {
            content: '\e9e5'
        }

        .uil-envelope:before {
            content: '\e9e6'
        }

        .uil-phone:before {
            content: '\e9e7'
        }

        .uil-calling:before {
            content: '\e9e8'
        }

        .uil-phone-times:before {
            content: '\e9e9'
        }

        .uil-envelope-search:before {
            content: '\e9ea'
        }

        .uil-phone-volume:before {
            content: '\e9eb'
        }

        .uil-envelope-upload:before {
            content: '\e9ec'
        }

        .uil-forwaded-call:before {
            content: '\e9ed'
        }

        .uil-envelope-share:before {
            content: '\e9ee'
        }

        .uil-envelope-upload-alt:before {
            content: '\e9ef'
        }

        .uil-envelope-minus:before {
            content: '\e9f0'
        }

        .uil-envelope-receive:before {
            content: '\e9f1'
        }

        .uil-envelope-redo:before {
            content: '\e9f2'
        }

        .uil-envelope-download-alt:before {
            content: '\e9f3'
        }

        .uil-envelope-download:before {
            content: '\e9f4'
        }

        .uil-brightness-low:before {
            content: '\e9f5'
        }

        .uil-envelope-shield:before {
            content: '\e9f6'
        }

        .uil-envelope-open:before {
            content: '\e9f7'
        }

        .uil-envelope-lock:before {
            content: '\e9f8'
        }

        .uil-keyboard-show:before {
            content: '\e9f9'
        }

        .uil-truck:before {
            content: '\e9fa'
        }

        .uil-envelopes:before {
            content: '\e9fb'
        }

        .uil-mailbox:before {
            content: '\e9fc'
        }

        .uil-envelope-heart:before {
            content: '\e9fd'
        }

        .uil-space-key:before {
            content: '\e9fe'
        }

        .uil-keyboard-alt:before {
            content: '\e9ff'
        }

        .uil-envelope-edit:before {
            content: '\ea00'
        }

        .uil-postcard:before {
            content: '\ea01'
        }

        .uil-fast-mail-alt:before {
            content: '\ea02'
        }

        .uil-envelope-question:before {
            content: '\ea03'
        }

        .uil-fast-mail:before {
            content: '\ea04'
        }

        .uil-envelope-info:before {
            content: '\ea05'
        }

        .uil-laptop-cloud:before {
            content: '\ea06'
        }

        .uil-desktop-cloud-alt:before {
            content: '\ea07'
        }

        .uil-envelope-star:before {
            content: '\ea08'
        }

        .uil-envelope-times:before {
            content: '\ea09'
        }

        .uil-luggage-cart:before {
            content: '\ea0a'
        }

        .uil-envelope-bookmark:before {
            content: '\ea0b'
        }

        .uil-missed-call:before {
            content: '\ea0c'
        }

        .uil-user:before {
            content: '\ea0d'
        }

        .uil-user-plus:before {
            content: '\ea0e'
        }

        .uil-envelope-alt:before {
            content: '\ea0f'
        }

        .uil-user-location:before {
            content: '\ea10'
        }

        .uil-users-alt:before {
            content: '\ea11'
        }

        .uil-book-reader:before {
            content: '\ea12'
        }

        .uil-cloud-bookmark:before {
            content: '\ea13'
        }

        .uil-phone-alt:before {
            content: '\ea14'
        }

        .uil-cloud-computing:before {
            content: '\ea15'
        }

        .uil-cloud-check:before {
            content: '\ea16'
        }

        .uil-user-minus:before {
            content: '\ea17'
        }

        .uil-cloud-times:before {
            content: '\ea18'
        }

        .uil-cloud-block:before {
            content: '\ea19'
        }

        .uil-columns:before {
            content: '\ea1a'
        }

        .uil-web-section:before {
            content: '\ea1b'
        }

        .uil-grid:before {
            content: '\ea1c'
        }

        .uil-web-grid-alt:before {
            content: '\ea1d'
        }

        .uil-window-maximize:before {
            content: '\ea1e'
        }

        .uil-web-section-alt:before {
            content: '\ea1f'
        }

        .uil-web-grid:before {
            content: '\ea20'
        }

        .uil-server-connection:before {
            content: '\ea21'
        }

        .uil-cloud-slash:before {
            content: '\ea22'
        }

        .uil-cloud-upload:before {
            content: '\ea23'
        }

        .uil-cloud-exclamation:before {
            content: '\ea24'
        }

        .uil-database:before {
            content: '\ea25'
        }

        .uil-server:before {
            content: '\ea26'
        }

        .uil-cloud-unlock:before {
            content: '\ea27'
        }

        .uil-cloud-share:before {
            content: '\ea28'
        }

        .uil-envelope-send:before {
            content: '\ea29'
        }

        .uil-cloud-shield:before {
            content: '\ea2a'
        }

        .uil-laptop-connection:before {
            content: '\ea2b'
        }

        .uil-server-network-alt:before {
            content: '\ea2c'
        }

        .uil-cloud-redo:before {
            content: '\ea2d'
        }

        .uil-servers:before {
            content: '\ea2e'
        }

        .uil-server-network:before {
            content: '\ea2f'
        }

        .uil-cloud-heart:before {
            content: '\ea30'
        }

        .uil-database-alt:before {
            content: '\ea31'
        }

        .uil-cloud-lock:before {
            content: '\ea32'
        }

        .uil-cloud-info:before {
            content: '\ea33'
        }

        .uil-phone-pause:before {
            content: '\ea34'
        }

        .uil-user-square:before {
            content: '\ea35'
        }

        .uil-user-exclamation:before {
            content: '\ea36'
        }

        .uil-cloud-download:before {
            content: '\ea37'
        }

        .uil-user-circle:before {
            content: '\ea38'
        }

        .uil-cloud-wifi:before {
            content: '\ea39'
        }

        .uil-data-sharing:before {
            content: '\ea3a'
        }

        .uil-cloud-data-connection:before {
            content: '\ea3b'
        }

        .uil-backward:before {
            content: '\ea3c'
        }

        .uil-camera:before {
            content: '\ea3d'
        }

        .uil-music-tune-slash:before {
            content: '\ea3e'
        }

        .uil-user-times:before {
            content: '\ea3f'
        }

        .uil-scenery:before {
            content: '\ea40'
        }

        .uil-user-check:before {
            content: '\ea41'
        }

        .uil-headphones:before {
            content: '\ea42'
        }

        .uil-step-backward:before {
            content: '\ea43'
        }

        .uil-image-search:before {
            content: '\ea44'
        }

        .uil-image-minus:before {
            content: '\ea45'
        }

        .uil-window-section:before {
            content: '\ea46'
        }

        .uil-play-circle:before {
            content: '\ea47'
        }

        .uil-pause-circle:before {
            content: '\ea48'
        }

        .uil-window-grid:before {
            content: '\ea49'
        }

        .uil-image-shield:before {
            content: '\ea4a'
        }

        .uil-window:before {
            content: '\ea4b'
        }

        .uil-pause:before {
            content: '\ea4c'
        }

        .uil-server-alt:before {
            content: '\ea4d'
        }

        .uil-image-question:before {
            content: '\ea4e'
        }

        .uil-music:before {
            content: '\ea4f'
        }

        .uil-image-block:before {
            content: '\ea50'
        }

        .uil-music-note:before {
            content: '\ea51'
        }

        .uil-step-forward:before {
            content: '\ea52'
        }

        .uil-image-redo:before {
            content: '\ea53'
        }

        .uil-image:before {
            content: '\ea54'
        }

        .uil-picture:before {
            content: '\ea55'
        }

        .uil-image-download:before {
            content: '\ea56'
        }

        .uil-image-v:before {
            content: '\ea57'
        }
    </style>
    <asp:HiddenField ID="TrxID" runat="server" />
    <asp:HiddenField ID="TrxUserName" runat="server" />
    <asp:HiddenField ID="TrxLevelUser" runat="server" />
    <asp:HiddenField ID="TrxTelepon" runat="server" />
    <div class="row">
        <div class="col-12">
            <div class="page-title-box d-flex align-items-center justify-content-between">
                <h4 class="mb-0">Taskboard Ticket</h4>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="d-flex flex-wrap gap-2">
                <a href="Crm_Trx_Ticket_System.aspx?idpage=1009&n=4" class="btn btn-outline-primary" id="PageCreateTicket" style="display:none;"><i class="uil uil-create-dashboard me-2"></i>Create Ticket</a>
                <a href="Crm_Trm_HistoryTicket.aspx" class="btn btn-outline-success" id="PageHistoryTicket"><i class="uil uil-history me-2"></i>History Ticket</a>
                <a href="#" class="btn btn-outline-warning" onclick="FU()" id="PageFollowTicket"><i class="uil uil-history me-2"></i>Follow Up Ticket</a>
            </div>
            <div class="card">
                <div class="card-body">
                    <div class="row" id="divCountingDataCall"></div>
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <%--<h5 class="card-title">Taskboard Ticket</h5>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <table class="table align-middle table-nowrap table-check" id="TaskboardTicket">
                                        <thead>
                                            <tr>
                                                <th style="width: 150px; min-width: 150px;">Ticket Number</th>
                                                <th style="width: 150px; min-width: 150px;">Name/PIC</th>
                                                <th style="width: 150px; min-width: 150px;">Kategori</th>
                                                <th style="width: 150px; min-width: 150px;">Sub Kategori</th>
                                                <th style="width: 150px; min-width: 150px;">Agent</th>
                                                <%--<th style="width: 150px; min-width: 150px;">Note SLA</th>--%>
                                                <th style="width: 150px; min-width: 150px;">Position</th>
                                                <th style="width: 150px; min-width: 150px;">Status</th>
                                                <th style="width: 150px; min-width: 150px;">Date Create</th>
                                                <th style="width: 30px; min-width: 30px;">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade bs-example-modal-xl" tabindex="-1" role="dialog" id="modal-note"
        aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="myExtraLargeModalLabel">Internal Note</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>
                <div class="modal-body">
                    <div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <%--<label for="addcontact-designation-input" class="form-label">Note</label>--%>
                                    <textarea class="form-control" placeholder="Leave a comment here" id="Note" name="Note" style="height: 250px"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light w-sm" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary w-sm" onclick="ActionSimpan()" id="Simpan">Submit</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade bs-example-modal-xl" tabindex="-1" role="dialog" id="modal-followup"
        aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="myExtraLargeModalLabelfollow">Form Channel</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close">
                    </button>
                </div>
                <div class="modal-body">
                    <div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label for="workexperience-category-input">Nomor Telepon</label>
                                    <input type="text" class="form-control" id="Form_Channel" placeholder="Nomor Telepon">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light w-sm" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary w-sm" onclick="ActionFollow()" id="ActionSimpanFU">Submit</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>