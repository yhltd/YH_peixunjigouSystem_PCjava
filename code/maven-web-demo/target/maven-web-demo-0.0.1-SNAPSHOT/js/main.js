// 全局变量，用于存储轮播图定时器
var carouselInterval = null;

$(function() {
    getList();
});
function getList() {

    $.ajax({
        type: 'POST',
        url: '/maven_web_demo_war/pushnews/getnews.action',
        dataType: 'json',
        success: function(res) {

            // 检查返回的数据结构
            if (!res) {
                console.error("返回数据为空");
                return;
            }
            if (res[0].beizhu1.length === 4) {
                // 使用CSS隐藏而不是删除，避免布局问题
                $('.carousel-container, .carousel-index').css({
                    'display': 'none',
                    'visibility': 'hidden'
                });

                // 或者直接添加隐藏类
                $('.carousel-container, .carousel-index').addClass('hidden');
            }

            if (res[0].beizhu2 && res[0].beizhu2.trim() !== "") {
                var logoImage = "data:image/jpg;base64," + res[0].beizhu2;
                var imgElement = document.querySelector('header.publicHeader img');

                if (imgElement) {
                    imgElement.src = logoImage;
                    console.log("Logo图片已替换为base64图片");
                } else {
                    console.log("未找到header中的img元素");
                }
            }

            if (res[0].beizhu3 && res[0].beizhu3.trim() !== "") {
                var systemName = res[0].beizhu3;

                // 只替换特定的元素，避免修改title
                var titleElement = document.querySelector('header.publicHeader h2');
                if (titleElement) {
                    titleElement.textContent = systemName;
                    console.log("系统名称已替换为:", systemName);
                } else {
                    console.log("未找到header中的h1元素");
                }

                // 如果需要更新页面标题，单独设置
                document.title = systemName;
            }


            if (carouselInterval) {
                clearInterval(carouselInterval);
                carouselInterval = null;
            }

            // 根据实际返回的字段名调整
            images = [
                { tptop2: "" },
                { tptop3: "" },
                { tptop4: "" },
                { tptop5: "" },
                { tptop6: "" }
            ];

            // 使用实际的字段名：tpname1 而不是 tptop1
            xuantu = res[0].tptop1 ? "data:image/jpg;base64," + res[0].tptop1 : "";

            // 设置图片数据 - 使用正确的字段名
            if (res[0].tptop2 && res[0].tptop2.trim() !== "") {
                images[0].tptop2 = "data:image/jpg;base64," + res[0].tptop2;
            }
            if (res[0].tptop3 && res[0].tptop3.trim() !== "") {
                images[1].tptop3 = "data:image/jpg;base64," + res[0].tptop3;
            }
            if (res[0].tptop4 && res[0].tptop4.trim() !== "") {
                images[2].tptop4 = "data:image/jpg;base64," + res[0].tptop4;
            }
            if (res[0].tptop5 && res[0].tptop5.trim() !== "") {
                images[3].tptop5 = "data:image/jpg;base64," + res[0].tptop5;
            }
            if (res[0].tptop6 && res[0].tptop6.trim() !== "") {
                images[4].tptop6 = "data:image/jpg;base64," + res[0].tptop6;
            }


            // 使用正确的字段名
            tankuan = res[0].xuankuan;  // 注意：原来是xuankuan，现在是topkuan
            dingkuan = 100;
            dinggao = res[0].topgao;   // 原来是topgao，保持一致
            textboxValue = res[0].textbox;
            localStorage.setItem('marqueeTextValue', textboxValue);

            // 创建轮播图数据
            var carouselImages = [
                { url: images[0].tptop2 , alt: "图1" },
                { url: images[1].tptop3 , alt: "图2" },
                { url: images[2].tptop4 , alt: "图3" },
                { url: images[3].tptop5 , alt: "图4" },
                { url: images[4].tptop6 , alt: "图5" }
            ];

            console.log(carouselImages, "轮播图图片数据");

            // 设置容器样式
            $(".carousel-container").css({
                width: dingkuan + "%",
                height: dinggao + "px"
            });

            var currentIndex = 0;
            var totalItems = carouselImages.length;

            // 初始化轮播图
            function initCarousel() {
                var carouselImagesContainer = $("#carouselImages");
                var indicatorsContainer = $("#carouselIndicators");
                carouselImagesContainer.empty();
                indicatorsContainer.empty();

                // 根据数组动态生成轮播项
                for (var i = 0; i < carouselImages.length; i++) {
                    var item = $("<div>")
                        .addClass("carousel-item")
                        .attr("id", "img" + (i + 1))
                        .data("index", i);

                    if (i === 0) {
                        item.addClass("active");
                    }

                    var img = $("<img>")
                        .attr("src", carouselImages[i].url)
                        .attr("alt", carouselImages[i].alt);

                    item.append(img);
                    carouselImagesContainer.append(item);

                    // 添加指示器
                    var indicator = $("<div>")
                        .addClass("indicator")
                        .data("index", i);

                    if (i === 0) {
                        indicator.addClass("active");
                    }

                    indicatorsContainer.append(indicator);
                }

                // 绑定指示器点击事件
                $(".indicator").on("click", function() {
                    var index = $(this).data("index");
                    goToSlide(index);
                });

                // 绑定导航按钮事件
                $(".prev-btn").on("click", function() {
                    goToSlide((currentIndex - 1 + totalItems) % totalItems);
                });

                $(".next-btn").on("click", function() {
                    goToSlide((currentIndex + 1) % totalItems);
                });
            }

            // 切换到指定幻灯片
            function goToSlide(index) {
                // 隐藏当前图片
                $("#img" + (currentIndex + 1)).removeClass("active");
                $(".indicator").eq(currentIndex).removeClass("active");

                currentIndex = index;

                // 显示下一张图片
                $("#img" + (currentIndex + 1)).addClass("active");
                $(".indicator").eq(currentIndex).addClass("active");
            }

            // 切换图片函数
            function switchImage() {
                goToSlide((currentIndex + 1) % totalItems);
            }

            // 初始化轮播图
            initCarousel();

            // 设置自动切换 - 使用全局变量
            carouselInterval = setInterval(switchImage, 5000);

            // 鼠标悬停时暂停轮播 - 使用全局变量
            $(".carousel-container").hover(
                function() {
                    if (carouselInterval) {
                        clearInterval(carouselInterval);
                        carouselInterval = null;
                    }
                },
                function() {
                    if (!carouselInterval) {
                        carouselInterval = setInterval(switchImage, 5000);
                    }
                }
            );

            // 设置CSS变量
            document.documentElement.style.setProperty('--tankuan', tankuan + "px");
            console.log(tankuan,"tankuan")
            document.documentElement.style.setProperty('--dinggao', dinggao + "px");

            // 设置其他图片
            var targetImg = document.querySelector('.index-images img');
            if (targetImg && xuantu) {
                targetImg.src = xuantu;
            }
        }
    });
}
// function getList() {
//     console.log("方法内部");
//     $.ajax({
//         type: 'post',
//         url: '/maven_web_demo_war/pushnews/getnews.action',
//     }, false, '', function(res) {
//         if (res.code == 200) {
//             // 清除之前的定时器
//             if (carouselInterval) {
//                 clearInterval(carouselInterval);
//                 carouselInterval = null;
//             }
//
//             images = [
//                 { tptop2: "" },
//                 { tptop3: "" },
//                 { tptop4: "" },
//                 { tptop5: "" },
//                 { tptop6: "" }
//             ]
//
//             xuantu = "data:image/jpg;base64," + res.data[0].tptop1;
//
//             // 设置图片数据
//             if (res.data[0].tptop2 && res.data[0].tptop2.trim() !== "") {
//                 images[0].tptop2 = "data:image/jpg;base64," + res.data[0].tptop2;
//             }
//             if (res.data[0].tptop3 && res.data[0].tptop3.trim() !== "") {
//                 images[1].tptop3 = "data:image/jpg;base64," + res.data[0].tptop3;
//             }
//             if (res.data[0].tptop4 && res.data[0].tptop4.trim() !== "") {
//                 images[2].tptop4 = "data:image/jpg;base64," + res.data[0].tptop4;
//             }
//             if (res.data[0].tptop5 && res.data[0].tptop5.trim() !== "") {
//                 images[3].tptop5 = "data:image/jpg;base64," + res.data[0].tptop5;
//             }
//             if (res.data[0].tptop6 && res.data[0].tptop6.trim() !== "") {
//                 images[4].tptop6 = "data:image/jpg;base64," + res.data[0].tptop6;
//             }
//
//             tankuan = res.data[0].xuankuan;
//             dingkuan = 100;
//             dinggao = res.data[0].topgao;
//             textboxValue = res.data[0].textbox;
//             localStorage.setItem('marqueeTextValue', textboxValue);
//
//             // 创建轮播图数据
//             var carouselImages = [
//                 { url: images[0].tptop2 || "https://picsum.photos/id/10/800/500", alt: "图1" },
//                 { url: images[1].tptop3 || "https://picsum.photos/id/11/800/500", alt: "图2" },
//                 { url: images[2].tptop4 || "https://picsum.photos/id/12/800/500", alt: "图3" },
//                 { url: images[3].tptop5 || "https://picsum.photos/id/13/800/500", alt: "图4" },
//                 { url: images[4].tptop6 || "https://picsum.photos/id/14/800/500", alt: "图5" }
//             ];
//
//             console.log(carouselImages, "轮播图图片数据");
//
//             // 设置容器样式
//             $(".carousel-container").css({
//                 width: dingkuan + "%",
//                 height: dinggao + "px"
//             });
//
//             var currentIndex = 0;
//             var totalItems = carouselImages.length;
//
//             // 初始化轮播图
//             function initCarousel() {
//                 var carouselImagesContainer = $("#carouselImages");
//                 var indicatorsContainer = $("#carouselIndicators");
//                 carouselImagesContainer.empty();
//                 indicatorsContainer.empty();
//
//                 // 根据数组动态生成轮播项
//                 for (var i = 0; i < carouselImages.length; i++) {
//                     var item = $("<div>")
//                         .addClass("carousel-item")
//                         .attr("id", "img" + (i + 1))
//                         .data("index", i);
//
//                     if (i === 0) {
//                         item.addClass("active");
//                     }
//
//                     var img = $("<img>")
//                         .attr("src", carouselImages[i].url)
//                         .attr("alt", carouselImages[i].alt);
//
//                     item.append(img);
//                     carouselImagesContainer.append(item);
//
//                     // 添加指示器
//                     var indicator = $("<div>")
//                         .addClass("indicator")
//                         .data("index", i);
//
//                     if (i === 0) {
//                         indicator.addClass("active");
//                     }
//
//                     indicatorsContainer.append(indicator);
//                 }
//
//                 // 绑定指示器点击事件
//                 $(".indicator").on("click", function() {
//                     var index = $(this).data("index");
//                     goToSlide(index);
//                 });
//
//                 // 绑定导航按钮事件
//                 $(".prev-btn").on("click", function() {
//                     goToSlide((currentIndex - 1 + totalItems) % totalItems);
//                 });
//
//                 $(".next-btn").on("click", function() {
//                     goToSlide((currentIndex + 1) % totalItems);
//                 });
//             }
//
//             // 切换到指定幻灯片
//             function goToSlide(index) {
//                 // 隐藏当前图片
//                 $("#img" + (currentIndex + 1)).removeClass("active");
//                 $(".indicator").eq(currentIndex).removeClass("active");
//
//                 currentIndex = index;
//
//                 // 显示下一张图片
//                 $("#img" + (currentIndex + 1)).addClass("active");
//                 $(".indicator").eq(currentIndex).addClass("active");
//             }
//
//             // 切换图片函数
//             function switchImage() {
//                 goToSlide((currentIndex + 1) % totalItems);
//             }
//
//             // 初始化轮播图
//             initCarousel();
//
//             // 设置自动切换 - 使用全局变量
//             carouselInterval = setInterval(switchImage, 5000);
//
//             // 鼠标悬停时暂停轮播 - 使用全局变量
//             $(".carousel-container").hover(
//                 function() {
//                     if (carouselInterval) {
//                         clearInterval(carouselInterval);
//                         carouselInterval = null;
//                     }
//                 },
//                 function() {
//                     if (!carouselInterval) {
//                         carouselInterval = setInterval(switchImage, 5000);
//                     }
//                 }
//             );
//
//             // 设置CSS变量
//             document.documentElement.style.setProperty('--tankuan', tankuan + "px");
//             document.documentElement.style.setProperty('--dinggao', dinggao + "px");
//
//             // 设置其他图片
//             var targetImg = document.querySelector('.index-images img');
//             if (targetImg && xuantu) {
//                 targetImg.src = xuantu;
//             }
//         }
//     });
// }

// 页面卸载时清理定时器，防止内存泄漏
$(window).on('beforeunload', function() {
    if (carouselInterval) {
        clearInterval(carouselInterval);
        carouselInterval = null;
    }
});



function yinClick() {
    document.querySelector('.carousel-container').classList.add('hidden');  // 隐藏顶部元素
}
function tanClick() {
    document.querySelector('.carousel-index').classList.add('hidden');  // 隐藏弹窗元素
}


document.addEventListener('DOMContentLoaded', function() {
    var textboxValue = localStorage.getItem('marqueeTextValue');
    var marqueetext = document.getElementById("marqueeText");

    if(marqueetext && textboxValue){
        console.log("从localStorage获取到数据:", textboxValue);
        marqueetext.textContent = textboxValue;
    }
});
