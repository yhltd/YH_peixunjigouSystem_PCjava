// ȫ�ֱ��������ڴ洢�ֲ�ͼ��ʱ��
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

            // ��鷵�ص����ݽṹ
            if (!res) {
                console.error("��������Ϊ��");
                return;
            }

            console.log("22 - ��ʼ��������");

            if (carouselInterval) {
                clearInterval(carouselInterval);
                carouselInterval = null;
            }

            // ����ʵ�ʷ��ص��ֶ�������
            images = [
                { tptop2: "" },
                { tptop3: "" },
                { tptop4: "" },
                { tptop5: "" },
                { tptop6: "" }
            ];

            // ʹ��ʵ�ʵ��ֶ�����tpname1 ������ tptop1
            xuantu = res[0].tptop1 ? "data:image/jpg;base64," + res[0].tptop1 : "";

            // ����ͼƬ���� - ʹ����ȷ���ֶ���
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


            // ʹ����ȷ���ֶ���
            tankuan = res[0].xuankuan;  // ע�⣺ԭ����xuankuan��������topkuan
            dingkuan = 100;
            dinggao = res[0].topgao;   // ԭ����topgao������һ��
            textboxValue = res[0].textbox;
            localStorage.setItem('marqueeTextValue', textboxValue);

            // �����ֲ�ͼ����
            var carouselImages = [
                { url: images[0].tptop2 || "https://picsum.photos/id/10/800/500", alt: "ͼ1" },
                { url: images[1].tptop3 || "https://picsum.photos/id/11/800/500", alt: "ͼ2" },
                { url: images[2].tptop4 || "https://picsum.photos/id/12/800/500", alt: "ͼ3" },
                { url: images[3].tptop5 || "https://picsum.photos/id/13/800/500", alt: "ͼ4" },
                { url: images[4].tptop6 || "https://picsum.photos/id/14/800/500", alt: "ͼ5" }
            ];

            console.log(carouselImages, "�ֲ�ͼͼƬ����");

            // ����������ʽ
            $(".carousel-container").css({
                width: dingkuan + "%",
                height: dinggao + "px"
            });

            var currentIndex = 0;
            var totalItems = carouselImages.length;

            // ��ʼ���ֲ�ͼ
            function initCarousel() {
                var carouselImagesContainer = $("#carouselImages");
                var indicatorsContainer = $("#carouselIndicators");
                carouselImagesContainer.empty();
                indicatorsContainer.empty();

                // �������鶯̬�����ֲ���
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

                    // ���ָʾ��
                    var indicator = $("<div>")
                        .addClass("indicator")
                        .data("index", i);

                    if (i === 0) {
                        indicator.addClass("active");
                    }

                    indicatorsContainer.append(indicator);
                }

                // ��ָʾ������¼�
                $(".indicator").on("click", function() {
                    var index = $(this).data("index");
                    goToSlide(index);
                });

                // �󶨵�����ť�¼�
                $(".prev-btn").on("click", function() {
                    goToSlide((currentIndex - 1 + totalItems) % totalItems);
                });

                $(".next-btn").on("click", function() {
                    goToSlide((currentIndex + 1) % totalItems);
                });
            }

            // �л���ָ���õ�Ƭ
            function goToSlide(index) {
                // ���ص�ǰͼƬ
                $("#img" + (currentIndex + 1)).removeClass("active");
                $(".indicator").eq(currentIndex).removeClass("active");

                currentIndex = index;

                // ��ʾ��һ��ͼƬ
                $("#img" + (currentIndex + 1)).addClass("active");
                $(".indicator").eq(currentIndex).addClass("active");
            }

            // �л�ͼƬ����
            function switchImage() {
                goToSlide((currentIndex + 1) % totalItems);
            }

            // ��ʼ���ֲ�ͼ
            initCarousel();

            // �����Զ��л� - ʹ��ȫ�ֱ���
            carouselInterval = setInterval(switchImage, 5000);

            // �����ͣʱ��ͣ�ֲ� - ʹ��ȫ�ֱ���
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

            // ����CSS����
            document.documentElement.style.setProperty('--tankuan', tankuan + "px");
            console.log(tankuan,"tankuan")
            document.documentElement.style.setProperty('--dinggao', dinggao + "px");

            // ��������ͼƬ
            var targetImg = document.querySelector('.index-images img');
            if (targetImg && xuantu) {
                targetImg.src = xuantu;
            }
        }
    });
}
// function getList() {
//     console.log("�����ڲ�");
//     $.ajax({
//         type: 'post',
//         url: '/maven_web_demo_war/pushnews/getnews.action',
//     }, false, '', function(res) {
//         if (res.code == 200) {
//             // ���֮ǰ�Ķ�ʱ��
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
//             // ����ͼƬ����
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
//             // �����ֲ�ͼ����
//             var carouselImages = [
//                 { url: images[0].tptop2 || "https://picsum.photos/id/10/800/500", alt: "ͼ1" },
//                 { url: images[1].tptop3 || "https://picsum.photos/id/11/800/500", alt: "ͼ2" },
//                 { url: images[2].tptop4 || "https://picsum.photos/id/12/800/500", alt: "ͼ3" },
//                 { url: images[3].tptop5 || "https://picsum.photos/id/13/800/500", alt: "ͼ4" },
//                 { url: images[4].tptop6 || "https://picsum.photos/id/14/800/500", alt: "ͼ5" }
//             ];
//
//             console.log(carouselImages, "�ֲ�ͼͼƬ����");
//
//             // ����������ʽ
//             $(".carousel-container").css({
//                 width: dingkuan + "%",
//                 height: dinggao + "px"
//             });
//
//             var currentIndex = 0;
//             var totalItems = carouselImages.length;
//
//             // ��ʼ���ֲ�ͼ
//             function initCarousel() {
//                 var carouselImagesContainer = $("#carouselImages");
//                 var indicatorsContainer = $("#carouselIndicators");
//                 carouselImagesContainer.empty();
//                 indicatorsContainer.empty();
//
//                 // �������鶯̬�����ֲ���
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
//                     // ���ָʾ��
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
//                 // ��ָʾ������¼�
//                 $(".indicator").on("click", function() {
//                     var index = $(this).data("index");
//                     goToSlide(index);
//                 });
//
//                 // �󶨵�����ť�¼�
//                 $(".prev-btn").on("click", function() {
//                     goToSlide((currentIndex - 1 + totalItems) % totalItems);
//                 });
//
//                 $(".next-btn").on("click", function() {
//                     goToSlide((currentIndex + 1) % totalItems);
//                 });
//             }
//
//             // �л���ָ���õ�Ƭ
//             function goToSlide(index) {
//                 // ���ص�ǰͼƬ
//                 $("#img" + (currentIndex + 1)).removeClass("active");
//                 $(".indicator").eq(currentIndex).removeClass("active");
//
//                 currentIndex = index;
//
//                 // ��ʾ��һ��ͼƬ
//                 $("#img" + (currentIndex + 1)).addClass("active");
//                 $(".indicator").eq(currentIndex).addClass("active");
//             }
//
//             // �л�ͼƬ����
//             function switchImage() {
//                 goToSlide((currentIndex + 1) % totalItems);
//             }
//
//             // ��ʼ���ֲ�ͼ
//             initCarousel();
//
//             // �����Զ��л� - ʹ��ȫ�ֱ���
//             carouselInterval = setInterval(switchImage, 5000);
//
//             // �����ͣʱ��ͣ�ֲ� - ʹ��ȫ�ֱ���
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
//             // ����CSS����
//             document.documentElement.style.setProperty('--tankuan', tankuan + "px");
//             document.documentElement.style.setProperty('--dinggao', dinggao + "px");
//
//             // ��������ͼƬ
//             var targetImg = document.querySelector('.index-images img');
//             if (targetImg && xuantu) {
//                 targetImg.src = xuantu;
//             }
//         }
//     });
// }

// ҳ��ж��ʱ����ʱ������ֹ�ڴ�й©
$(window).on('beforeunload', function() {
    if (carouselInterval) {
        clearInterval(carouselInterval);
        carouselInterval = null;
    }
});



function yinClick() {
    document.querySelector('.carousel-container').classList.add('hidden');  // ���ض���Ԫ��
}
function tanClick() {
    document.querySelector('.carousel-index').classList.add('hidden');  // ���ص���Ԫ��
}


document.addEventListener('DOMContentLoaded', function() {
    var textboxValue = localStorage.getItem('marqueeTextValue');
    var marqueetext = document.getElementById("marqueeText");

    if(marqueetext && textboxValue){
        console.log("��localStorage��ȡ������:", textboxValue);
        marqueetext.textContent = textboxValue;
    }
});
