<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="img/mm.png" />
    <title>教务管理系统</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/public.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/min.css"/>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css"/>

    <style>

        .navbar-header:hover{
            cursor: pointer;
        }

        .nav navbar-nav li a:hover{
            cursor: pointer;
        }


        body{
            width:100%;
            height: 100%;
        }



        .carousel-index {
            width: var(--tankuan);
            /*width: 300px;*/
            position: fixed;
            z-index: 9998;
            box-shadow: 0 0 30px rgba(0,0,0,0.6);
            border: 3px solid white;
            border-radius: 15px;
            animation: smooth-drift 40s infinite ease-in-out;
            transform: translateZ(0);
            will-change: transform;
        }

        @keyframes smooth-drift {
            0%, 100% {
                transform: translate(5vw, 20vh);
            }
            25% {
                transform: translate(40vw, 1vh);
            }
            50% {
                transform: translate(65vw, 30vh);
            }
            75% {
                transform: translate(30vw, 50vh);
            }
        }

        .index-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 15px;
            backface-visibility: hidden;
        }

        .marquee-container {
            flex: 1;
            overflow: hidden;
            margin: 0 10px;
            position: relative;
            height: 36px; /* 增加高度 */
            background: linear-gradient(
                    135deg,
                    rgba(46, 139, 87, 0.3) 0%,
                    rgba(60, 179, 113, 0.3) 30%,
                    rgba(79, 206, 123, 0.3) 70%,
                    rgba(102, 217, 143, 0.3) 100%
            );
            border-radius: 18px; /* 增加圆角 */
            padding: 0 15px;
            display: flex;
            align-items: center;
            box-shadow: 0 2px 8px rgba(46, 139, 87, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .marquee-content {
            color: white;
            white-space: nowrap;
            position: absolute;
            animation: marquee 25s linear infinite; /* 减慢速度 */
            font-size: 14px;
            font-weight: 500;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.3);
            padding-right: 50px; /* 增加右侧内边距 */
            min-width: max-content; /* 确保内容完整显示 */
        }

        @keyframes marquee {
            0% { transform: translateX(100%); }
            100% { transform: translateX(-100%); }
        }

        .scrolling-container {
            width: 200px; /* 增加宽度 */
            height: 36px; /* 增加高度 */
            overflow: hidden;
            white-space: nowrap;
            background: linear-gradient(
                    135deg,
                    rgba(46, 139, 87, 0.25) 0%,
                    rgba(60, 179, 113, 0.25) 100%
            );
            border-radius: 18px; /* 增加圆角 */
            position: relative;
            /*float: center;*/
            box-shadow: 0 2px 6px rgba(46, 139, 87, 0.15);
            border: 1px solid rgba(255, 255, 255, 0.15);
        }

        .scrolling-text {
            position: absolute;
            right: 0;
            color: white;
            font-weight: 500;
            padding: 8px 15px; /* 增加内边距 */
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.3);
            white-space: nowrap;
            animation: scroll-text 10s linear infinite; /* 添加动画 */
        }

        @keyframes scroll-text {
            0% { transform: translateX(100%); }
            100% { transform: translateX(-100%); }
        }


        #Iframe1 {
            height:100%;
        }

        .clean-btn-div {
            background-color: transparent;
            color: white;
            width: 20px;
            height: 20px;
            border: 1px solid white;
            font-size: 13px;
            border-radius: 50%;
            position: absolute;
            z-index: 9999;
            top: 0;
            right: 0;
            text-align: center;
            margin: 10px;
            transform: none;
        }

        .index-btn-div {
            background-color: transparent;
            color: white;
            width: 20px;
            height: 20px;
            border: 1px solid white;
            font-size: 13px;
            border-radius: 50%;
            position: absolute;
            z-index: 9999;
            top: 0;
            right: 0;
            text-align: center;
            margin: 10px;
            transform: none;
        }

        .index-btn-div:hover {
            cursor: pointer;
        }

        .clean-btn-div:hover {
            cursor: pointer;
        }
        .hidden {
            display: none;
        }
        .content-main{
            width: 100%;
            display: flex;
        }
        .content-left{
            width: 15%;
            background-color: #000000;
        }
        .content-right{
            width: 85%;

        }

        .carousel-container {
            width: 100%;
            height: var(--dinggao, 400px);
            position: relative;
            overflow: hidden;
            margin-bottom:5px;

        }

        /* 轮播图片容器 */
        .carousel-images {
            width: 100%;
            height: 100%;
            position: relative;
        }

        /* 轮播项样式 */
        .carousel-item {
            position: absolute;
            width: 100%;
            height: 100%;
            opacity: 0;
            transition: opacity 0.8s ease-in-out;
            z-index: 1;
        }

        .carousel-item.active {
            opacity: 1;
            z-index: 2;
        }

        .carousel-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }


        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Microsoft YaHei', 'Segoe UI', Arial, sans-serif;
        }

        body {
            background-color: #f5f7fa;
            color: #333;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 5px 25px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        /* 优化后的导航栏容器 */
        .container-fluid {
            width: 100%;
            display: flex;
            background: linear-gradient(135deg, #1F1C2C 0%, #2A2470 40%, #4A42B5 80%, #7678ed 100%);
            padding: 0 10px;
            align-items: center;
            min-height: 80px;
            position: relative;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.25);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        /* 添加装饰元素增强深度感 */
        .container-fluid::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 3px;
            background: linear-gradient(90deg, #FF5E62, #FF9966, #FF5E62);
            opacity: 0.7;
            z-index: 2;
        }


        .navbar-header {
            width: auto !important; /* 取消固定宽度限制 */
            min-width: unset; /* 移除最小宽度 */
            display: flex;
            align-items: center;
            flex: 0 0 auto; /* 根据内容自动调整宽度 */
            padding: 0 15px;
        }

        /* 确保容器正确布局 */
        .container-fluid {
            display: flex;
            align-items: center;
            justify-content: space-between; /* 左右分散对齐 */
            padding: 0 20px;
        }

        /* 导航菜单项优化 */
        .nav.navbar-nav {
            display: flex;
            align-items: center;
            flex: 1; /* 占据剩余空间 */
            justify-content: flex-end; /* 右对齐 */
            margin: 0;
            padding: 0;
        }

        /* 搜索框区域优化 */
        .form-inline {
            display: flex;
            min-width: 250px;
            margin-left: 15px;
        }

        /* 响应式调整 */
        @media (max-width: 1200px) {
            .navbar-header {
                flex: 0 0 auto;
            }

            .navbar-brand {
                font-size: 16px;
            }
        }

        @media (max-width: 992px) {
            .navbar-header {
                width: 100% !important;
                justify-content: center;
                margin-bottom: 10px;
            }

            .nav.navbar-nav {
                width: 100%;
                justify-content: center;
                order: 2;
            }

            .form-inline {
                width: 100%;
                margin: 10px 0;
                order: 3;
            }
        }

        @media (max-width: 768px) {
            .container-fluid {
                flex-direction: column;
                padding: 10px;
            }

            .navbar-header {
                margin-bottom: 10px;
            }

            .nav.navbar-nav {
                flex-wrap: wrap;
                justify-content: center;
            }

            .nav.navbar-nav > li {
                margin: 5px;
            }

            .form-inline {
                min-width: 100%;
            }
        }

        /*.navbar-header {*/
        /*    width: 100%;*/
        /*    min-width: 220px;*/
        /*    display: flex;*/
        /*    align-items: center;*/
        /*}*/

        .navbar-header img {
            width: 36px;
            height: 36px;
            margin-right: 12px;
            filter: drop-shadow(0 0 8px rgba(255, 255, 255, 0.6));
            transition: all 0.3s ease;
        }

        .navbar-header:hover img {
            transform: rotate(10deg);
        }

        .navbar-brand {
            color: white !important;
            font-weight: 700;
            font-size: 18px;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.4);
            white-space: nowrap;
            text-decoration: none;
            letter-spacing: 0.5px;
            position: relative;
            padding: 5px 0;
            line-height: 40px;
            margin-left: 10px;
        }

        .navbar-brand::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 0;
            height: 2px;
            background: linear-gradient(90deg, #FF9966, #FF5E62);
            transition: width 0.3s ease;
        }

        .navbar-brand:hover::after {
            width: 100%;
        }

        .marquee-container {
            flex: 1;
            margin: 2px 30px 0 30px;
            min-width: 8%;
            max-width: 30%;
            background: rgba(255, 255, 255, 0.12);
            border-radius: 8px;
            overflow: hidden;
            height: 44px;
            display: flex;
            align-items: center;
            backdrop-filter: blur(5px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.2);
        }

        .marquee-content {
            color: rgba(255, 255, 255, 0.95);
            font-size: 14px;
            white-space: nowrap;
            animation: marquee 25s linear infinite;
            font-weight: 500;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.3);
        }

        .marquee-content {
            white-space: nowrap;
            position: absolute;
            /* 关键修改：从容器外右侧开始，而不是100%宽度 */
            left: 100%;
            animation: marquee 20s linear infinite;
            color: #fff21b;
            font-weight: 500;
            font-size: 13px;
            padding: 0 10px;
            /* 确保动画元素不影响布局 */
            pointer-events: none;
        }

        @keyframes marquee {
            0% { transform: translateX(100%); }
            100% { transform: translateX(-100%); }
        }

        .nav.navbar-nav {
            display: flex;
            align-items: center;
            list-style: none;
            margin: 0;
            padding: 0;
            flex-wrap: nowrap;
        }

        .nav.navbar-nav > li {
            margin-left: 8px;
            position: relative;
            white-space: nowrap;
        }

        .nav.navbar-nav > li > a {
            color: rgba(255, 255, 255, 0.9);
            text-decoration: none;
            padding: 12px 8px;
            display: block;
            font-size: 14px;
            border-radius: 8px;
            transition: all 0.3s ease;
            font-weight: 500;
            position: relative;
            overflow: hidden;
        }

        .nav.navbar-nav > li > a::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.7s ease;
        }

        .nav.navbar-nav > li > a:hover::before {
            left: 100%;
        }

        .nav.navbar-nav > li > a:hover {
            color: white;
            background: rgba(255, 255, 255, 0.18);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .form-inline {
            display: flex;
            width: 100%;
        }

        .input-group {
            width: 100%;
            display: flex;
            border-radius: 25px;
            overflow: hidden;
            background: rgba(255, 255, 255, 0.18);
            transition: all 0.3s ease;
            border: 1px solid rgba(255, 255, 255, 0.15);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.15);
            min-width: 180px;
        }

        .input-group:hover, .input-group:focus-within {
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 0 15px rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
        }

        .form-control {
            width: 70%;
            flex: 1;
            border: none;
            background: transparent;
            color: white;
            font-size: 14px;
            outline: none;
            padding: 0 12px;
            min-width: 100px;
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.75);
            font-weight: 400;
        }

        .input-group-btn {
            display: flex;
        }

        /*.btn-default {*/
        /*    background: linear-gradient(135deg, #FF9966, #FF5E62);*/
        /*    border: none;*/
        /*    color: white;*/
        /*    cursor: pointer;*/
        /*    transition: all 0.3s ease;*/
        /*    white-space: nowrap;*/
        /*    font-weight: 600;*/
        /*    text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);*/
        /*    box-shadow: 0 3px 8px rgba(0, 0, 0, 0.2);*/
        /*    min-width: 60px;*/
        /*}*/

        /*.btn-default:hover {*/
        /*    background: linear-gradient(135deg, #FF5E62, #FF9966);*/
        /*    transform: translateY(-3px);*/
        /*    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);*/
        /*}*/

        /*.btn-default:active {*/
        /*    transform: translateY(1px);*/
        /*    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);*/
        /*}*/

        .search-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 10px 18px;
            border: none;
            border-radius: 8px;
            background: linear-gradient(135deg, #5a63d8 0%, #7678ed 100%);
            color: white;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            box-shadow: 0 3px 6px rgba(74, 66, 181, 0.15);
            height: 42px;
            margin-left: 8px;
            white-space: nowrap;
        }

        .search-btn:hover {
            background: linear-gradient(135deg, #4a42b5 0%, #6366f1 100%);
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(74, 66, 181, 0.2);
            color: #ffffff;
        }

        .search-btn:active {
            transform: translateY(0);
            box-shadow: 0 2px 4px rgba(74, 66, 181, 0.15);
        }

        /* 搜索图标样式 */
        .search-btn i {
            margin-right: 6px;
            font-size: 14px;
        }

        /* 响应式调整 */
        @media (max-width: 768px) {
            .search-btn {
                width: 100%;
                margin: 10px 0 0 0;
                justify-content: center;
            }
        }

        .dropdown {
            position: relative;
        }

        .dropdown-toggle {
            display: flex;
            align-items: center;
            padding-right: 20px !important;
        }

        .caret {
            margin-left: 4px;
            border-top: 5px solid rgba(255, 255, 255, 0.9);
            border-right: 5px solid transparent;
            border-left: 5px solid transparent;
            transition: transform 0.3s ease;
        }

        .dropdown:hover .caret {
            transform: rotate(180deg);
        }

        .dropdown-menu {
            position: absolute;
            top: 100%;
            right: 0;
            background: linear-gradient(135deg, #2A2470, #4A42B5);
            min-width: 200px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
            border-radius: 12px;
            padding: 12px 0;
            z-index: 1000;
            display: none;
            list-style: none;
            border: 1px solid rgba(255, 255, 255, 0.1);
            overflow: hidden;
            margin-top: 10px;
        }

        .dropdown:hover .dropdown-menu {
            display: block;
            animation: fadeIn 0.3s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .dropdown-menu li {
            padding: 0;
        }

        .dropdown-menu li a {
            padding: 10px 15px;
            display: block;
            color: rgba(255, 255, 255, 0.9);
            text-decoration: none;
            font-size: 14px;
            transition: all 0.2s ease;
            position: relative;



        }

        .dropdown-menu li a::before {
            content: '';
            position: absolute;
            left: 0;
            top: 0;
            height: 100%;
            width: 3px;
            background: linear-gradient(to bottom, #FF9966, #FF5E62);
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .dropdown-menu li a:hover {
            background: rgba(255, 255, 255, 0.1);
            color: white;
            padding-left: 18px;
        }

        .dropdown-menu li a:hover::before {
            opacity: 1;
        }

        .divider {
            height: 1px;
            background: rgba(255, 255, 255, 0.15);
            margin: 8px 0;
        }

        .preview-content {
            padding: 40px;
            text-align: center;
            background: linear-gradient(to bottom, #f9fafb, #f5f7fa);
        }

        .preview-title {
            font-size: 2.8rem;
            color: #2c3e50;
            margin-bottom: 20px;
            font-weight: 700;
        }

        .preview-subtitle {
            font-size: 1.3rem;
            color: #7f8c8d;
            margin-bottom: 30px;
            line-height: 1.6;
        }

        @media (max-width: 1200px) {
            .navbar-header {
                width: 30%;
                min-width: 200px;
            }

            .marquee-container {
                max-width: 22%;
                margin: 0 10px;
            }

            .nav.navbar-nav > li {
                margin-left: 6px;
            }

            .nav.navbar-nav > li > a {
                padding: 12px 6px;
                font-size: 13px;
            }

            .input-group {
                min-width: 160px;
            }
        }

        @media (max-width: 992px) {
            .navbar-header {
                width: 30%;
                min-width: 180px;
            }

            .marquee-container {
                display: none;
            }

            .nav.navbar-nav > li > a {
                padding: 10px 5px;
                font-size: 13px;
            }

            .input-group {
                min-width: 140px;
            }

            .btn-default {
                padding: 10px 12px;
            }
        }

        @media (max-width: 768px) {
            .container-fluid {
                flex-wrap: wrap;
                padding: 15px;
                min-height: auto;
            }

            .navbar-header {
                width: 100%;
                margin-bottom: 15px;
                justify-content: center;
                min-width: auto;
            }

            .nav.navbar-nav {
                width: 100%;
                justify-content: center;
                flex-wrap: wrap;
            }

            .nav.navbar-nav > li {
                margin: 8px;
            }

            .input-group {
                margin-top: 10px;
                min-width: 100%;
            }

            .form-control {
                min-width: auto;
            }
        }

        #tupian-modal .modal-dialog {
            width: 280px;
            height: 440px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto;
        }

        #tupian-modal .modal-content {
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
            border: none;
            background: linear-gradient(135deg, #f8f9fc 0%, #eef0f8 100%);
        }

        #tupian-modal .modal-header {
            background: linear-gradient(135deg, #4A42B5 0%, #7678ed 100%);
            color: white;
            border-bottom: none;
            padding: 15px 0px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            position: relative;
        }

        #tupian-modal .modal-title {
            font-weight: 600;
            font-size: 18px;
            margin-bottom: 2px;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
        }

        #tupian-modal .modal-header div:last-child {
            position: absolute;
            bottom: 8px;
            left: 20px;
            font-size: 12px;
            opacity: 0.9;
            width: calc(100% - 40px);
        }

        #tupian-modal .close {
            color: white;
            opacity: 0.95;
            text-shadow: none;
            font-size: 24px;
            position: relative;
            z-index: 1;
            transition: all 0.3s ease;
        }

        #tupian-modal .close:hover {
            color: white;
            opacity: 1;
            transform: scale(1.1);
        }

        #tupian-modal .modal-body {
            padding: 30px 20px;
            display: flex;
            flex-direction: column; /* 改为垂直布局 */
            align-items: center;
            justify-content: center;
            background: white;
            position: relative; /* 为背景添加定位 */
            overflow: hidden; /* 防止背景溢出 */
        }

        /* 添加背景装饰 */
        #tupian-modal .modal-body::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(118, 120, 237, 0.1) 0%, transparent 70%);
            z-index: 0;
            pointer-events: none;
        }

        #tupian-modal #add-form {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            z-index: 1; /* 确保内容在背景之上 */
        }

        #tupian-modal #qrcode {
            display: block;
            width: 180px;
            height: 180px;
            border: 10px solid white;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            background-color: #f8f9fa;
            position: relative;
            z-index: 1;
        }

        /* 添加加载中的动画效果 */
        #tupian-modal #qrcode:not([src]) {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        #tupian-modal #qrcode:not([src])::after {
            content: "加载中...";
            color: #6c757d;
            font-size: 14px;
        }

        /* 文字部分布局优化 */
        #tupian-modal .modal-body-text {
            margin-bottom: 20px;
            text-align: center;
            font-size: 14px;
            color: #495057;
            z-index: 1;
            position: relative;
        }

        /* 响应式调整 */
        @media (max-width: 576px) {
            #tupian-modal .modal-dialog {
                width: 250px;
                height: 400px;
                margin: 30px auto;
            }

            #tupian-modal #qrcode {
                width: 160px;
                height: 160px;
            }

            #tupian-modal .modal-title {
                font-size: 16px;
            }
        }


        .aaa{
            width: 100%;
            height: 100%;
            display: flex;
        }


    </style>
</head>
<body>
<!--头部-->
<div class="carousel-container">
    <button type="button" class="clean-btn-div" onclick="yinClick()">×</button>
    <div class="carousel-images" id="carouselImages"></div>
</div>

<div class="carousel-index">
    <button type="button" class="index-btn-div" onclick="tanClick()">×</button>
    <div class="index-images">
        <div class="index-item" id="Div1">
            <img src="https://picsum.photos/id/13/800/500" alt="图5">
        </div>
    </div>
</div>
<header class="publicHeader">
    <div class="aaa">
<%--    <canvas id="particleCanvas"></canvas>--%>
    <h1>教务管理系统</h1>

    <div class="marquee-container">
        <div class="marquee-content" id="marqueeText">

        </div>
    </div>
    <div class="publicHeaderR">
        <p style="font-size:13px"><span id="hours"></span><span style="color: #fff21b;">${GLOBAL_USER.realName} </span> , 欢迎你！</p>
        <input hidden="hidden" id="rongliang" value="${rongliang }"/>
        <a style="background: url(img/下载app.png);" href="<%=request.getContextPath() %>/pdf/app-debug.apk" >下载app</a>
        <a style="background: url(img/下载excel.png);" href="<%=request.getContextPath() %>/pdf/教务管理系统（20230618）.xlsm">下载表格</a>
        <a style="background: url(img/数据空间.png);" onclick="shujv()" >数据空间</a>
        <a style="background: url(img/退出.png);" href="<%=request.getContextPath() %>/login.jsp" >退出</a>
    </div>
<%--    <a href="<%=request.getContextPath() %>/tea/teacher.action"><img src="img/yyh.png" style="width: 32px;height: 32px;float:right;margin-top: 8px;"></a>--%>
    </div>
</header>
<!--时间-->
<%--<section class="publicTime">--%>
<%--    <span id="time"></span>--%>
<%--    <a href="#" style="color: red">${msg}</a>--%>
<%--</section>--%>
<!--主体内容-->
<section class="publicMian">
    <div class="left-bg">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
        <nav>
            <ul class="list">
                <li><a href="<%=request.getContextPath() %>/main.jsp">主页</a></li>
                <li><a href="<%=request.getContextPath() %>/te/shezhi.action">设置</a></li>
                <li><a href="<%=request.getContextPath() %>/stu/student1.action">学生信息</a></li>
                <li><a href="<%=request.getContextPath() %>/teacherInfo/getList1.action">教师信息</a></li>
                <li><a href="<%=request.getContextPath() %>/pay/payment1.action">缴费记录</a></li>
                <li><a href="<%=request.getContextPath() %>/keshi/getList1.action">课时统计</a></li>
                <li><a href="<%=request.getContextPath() %>/inc/income.action">收支明细</a></li>
                <li><a href="<%=request.getContextPath() %>/stu/arr.action">欠费学员</a></li>
                <li><a href="<%=request.getContextPath() %>/tea/jisuan.jsp">教师工资</a></li>
                <li><a href="<%=request.getContextPath() %>/keshi/getTeacherKeshiList.action">教师课时统计</a></li>
                <li><a href="<%=request.getContextPath() %>/tea/teacher.action">用户管理</a></li>
                <li><a href="<%=request.getContextPath() %>/pdf/云合教务管理系统_使用说明.rar">使用说明</a></li>
            </ul>
        </nav>
    </div>
    </div>
    <div class="right" style="background: url(https://gips1.baidu.com/it/u=234355050,149471300&fm=3086&app=3086&f=JPEG&wm=1,baiduai3,0,0,13,9&wmo=5,5&w=1024&h=1024); background-size: cover">
        <div class="wFont">
            <div class="location">
                <strong>你现在所在的位置是:</strong>
                <span>主页</span>
                <span id="time"></span>
                <div title="学生信息页面可以对学生基本信息进行操作，已上课时和已缴费会根据后面页面的数据自动计算" style="color: red">*</div>
            </div>
            <div id="min3">
                <p style="color: #00ccef;text-shadow: 1px 1px #414040;">${qianfei}</p>
                <span  style="display: inline-block; position: relative;">
    <a href="<%=request.getContextPath() %>/pushnews/getnews.action" class="circle-link" style="display: block;">学生信息</a>
</span>
                <span style="display: inline-block; position: relative;">
    <a href="<%=request.getContextPath() %>/teacherInfo/getList1.action" class="circle-link" style="display: block;">教师信息</a>
</span>


                <span style="display: inline-block; position: relative;">
                    <a href="<%=request.getContextPath() %>/pay/payment.action" class="circle-link" style="display: block;">缴费记录</a>
                </span>
                <span style="display: inline-block; position: relative;">
                    <a href="<%=request.getContextPath() %>/keshi/getList1.action" class="circle-link" style="display: block;">课时统计</a>
                </span>
                <br>

                <span style="display: inline-block; position: relative;">
                    <a href="<%=request.getContextPath() %>/inc/income.action" class="circle-link" style="display: block;">收支明细</a>
                </span>
                <span style="display: inline-block; position: relative;">
                    <a href="<%=request.getContextPath() %>/stu/arr.action" class="circle-link" style="display: block; ">欠费学员</a>
                </span>


                <span style="display: inline-block; position: relative;">
                    <a href="<%=request.getContextPath() %>/tea/jisuan.jsp" class="circle-link" style="display: block; ">教师工资</a>
                </span>
                <span style="display: inline-block; position: relative;">
                    <a href="<%=request.getContextPath() %>/te/shezhi.action" class="circle-link" style="display: block; ">自定义参数</a>
                </span>
            </div>
        </div>
    </div>
</section>

<footer class="footer">
</footer>
<script src="<%=request.getContextPath() %>/js/time.js"></script>
<script src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script src="<%=request.getContextPath() %>/js/js.js"></script>
<script src="<%=request.getContextPath() %>/js/main.js"></script>

<div style="text-align:center;">
</div>
</body>
<script>
    function shujv() {
        alert($('#rongliang').val());
        return false;
    }
</script>
</html>