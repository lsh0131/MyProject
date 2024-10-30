<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>가게 상세페이지</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }

        .header {
            background-color: #d3b3b3;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h1 {
            margin: 0;
            font-size: 18px;
            color: #fff;
        }

        .nav {
            display: flex;
            align-items: center;
        }

        .nav button {
            background-color: #d3b3b3;
            border: none;
            color: #fff;
            font-size: 14px;
            margin-right: 5px;
            cursor: pointer;
        }

        .container {
            padding: 20px;
        }

        .section {
            background-color: #ddd;
            padding: 20px;
            margin-bottom: 15px;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .slider {
            position: relative;
            width: 100%;
            height: 300px;
            overflow: hidden;
            border: 1px dashed #999;
            border-radius: 5px;
        }

        .slide {
            min-width: 100%;
            height: 100%;
            transition: 0.5s ease;
            background-color: #aaa;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 16px;
            color: #666;
        }

        .slider img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 5px;
        }

        .slider-nav {
            position: absolute;
            top: 50%;
            width: 100%;
            display: flex;
            justify-content: space-between;
            transform: translateY(-50%);
            z-index: 1;
        }

        .slider-nav button {
            background-color: rgba(0, 0, 0, 0.5);
            color: #fff;
            border: none;
            font-size: 18px;
            padding: 10px;
            cursor: pointer;
        }

        .store-info {
            margin-top: 10px;
            font-weight: bold;
        }

        /* 메뉴 카드 스타일 */
        .menu-card {
            display: flex;
            align-items: center;
            background-color: #fff;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border: 1px solid #ddd;
        }

        .menu-card img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 8px;
            margin-right: 15px;
        }

        .menu-card .menu-info {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            /* 오른쪽 정렬 */
            text-align: right;
            /* 텍스트 오른쪽 정렬 */
            flex: 1;
        }

        .menu-card .menu-info .menu-name {
            font-size: 16px;
            font-weight: bold;
            color: #333;
            margin: 0;
        }

        .menu-card .menu-info .menu-description {
            font-size: 14px;
            color: #666;
            margin: 5px 0;
        }

        .menu-card .menu-info .menu-price {
            font-size: 14px;
            font-weight: bold;
            color: #000;
        }

        /* 기본 이미지 스타일 */
        .default-image {
            width: 80px;
            height: 80px;
            background-color: #e0e0e0;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 8px;
            color: #bbb;
            font-size: 24px;
            margin-right: 15px;
        }

        /* select 스타일 */
        .styled-select {
            width: 100%;
            padding: 10px 15px;
            font-size: 15px;
            border: 1px solid #b3a3a3;
            border-radius: 8px;
            appearance: none;
            background: linear-gradient(45deg, #d3b3b3, #e0c1c1);
            color: #333;    /* 텍스트 색상 어둡게 변경 */
            cursor: pointer;
            font-weight: bold;
            text-align: center;
            box-shadow: 0px 3px 6px rgba(0, 0, 0, 0.1);
        }

        .styled-select:focus {
            outline: none;
            box-shadow: 0 0 8px rgba(211, 179, 179, 0.5);
        }

        .map-container {
            width: 100%;
            height: 400px;
            margin-top: 10px;
            border: 1px solid #999;
            border-radius: 5px;
        }

        /* 리뷰 목록 스타일 */
        .review-section {
            background-color: #f7f7f7;
            padding: 15px;
            border-radius: 5px;
            margin-top: 20px;
            border: 1px solid #ccc;
        }

        .review-title {
            font-weight: bold;
            font-size: 16px;
            margin-bottom: 10px;
            color: #333;
        }

        .review-item {
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            background-color: #fff;
            border: 1px solid #ddd;
            display: flex;
            flex-direction: column;
        }

        .review-item .reviewer {
            font-weight: bold;
            color: #555;
        }

        .review-item .review-text {
            margin-top: 5px;
            color: #333;
        }

        .star-rating {
            color: #ffcc00;
            font-size: 14px;
        }

        .review-button {
            align-self: flex-end;
            text-align: center;
            margin-top: 10px;
        }

        .review-button a {
            display: inline-block;
            padding: 8px 15px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }

        .review-button a:hover {
            background-color: #0056b3;
        }

        @media (max-width: 600px) {
            .header h1 {
                font-size: 16px;
            }

            .nav button {
                font-size: 12px;
            }

            .slider {
                height: 200px;
            }

            .map-container {
                height: 300px;
            }
        }

        /* 반응형 디자인 */
        @media (max-width: 600px) {
            .header h1 {
                font-size: 16px;
            }

            .nav button {
                font-size: 12px;
            }

            .slider {
                height: 200px;
            }

            .map-container {
                height: 300px;
            }
        }
    </style>
</head>

<body>

    <div class="header">
        <h1>가게 상세페이지</h1>
        <div class="nav">
            <button>로그인/회원가입</button>
            <button>☰</button>
        </div>
    </div>

    <div class="container">
        <div class="section">
            <label for="district-select">이동경로</label>
            <select id="district-select" class="styled-select" onchange="navigateToDistrict()">
                <option value="">카테고리 선택</option>
                <option value="#">메인</option>
                <option value="#">지역별</option>
                <option value="#">업종별</option>
                <option value="#">테마별</option>
            </select>
        </div>

        <div class="section main-photo">
            <div class="section-title">가게 메인 사진</div>
            <div class="slider" id="slider">
                <div class="slide"><img src="/Project/img/Jellyfish.jpg"></div>
                <div class="slide"><img src="/Project/img/Penguins.jpg"></div>
                <div class="slide"><img src="/Project/img/Koala.jpg"></div>
            </div>
            <div class="slider-nav">
                <button aria-label="이전 슬라이드" onclick="prevSlide()">&#10094;</button>
                <button aria-label="다음 슬라이드" onclick="nextSlide()">&#10095;</button>
            </div>
            <div class="store-info">
                <strong>가게 주소:</strong> 서울 강남구 테헤란로7길 7 에스코빌딩 5~7층
            </div>
        </div>

        <div class="section menu-price-section">
            <div class="section-title">메뉴 가격 목록</div>

            <div class="menu-card">
                <img src="img/pasta.jpg" alt="감자 사진">
                <div class="menu-info">
                    <p class="menu-name">감자</p>
                    <p class="menu-description">감자, 간장 글레이즈, 수제 아이올리</p>
                    <p class="menu-price">9,000원</p>
                </div>
            </div>

            <div class="menu-card">
                <img src="img/food.jpg" alt="육회 사진">
                <div class="menu-info">
                    <p class="menu-name">육회</p>
                    <p class="menu-description">1++한우, 엔다이브, 배 잼</p>
                    <p class="menu-price">19,000원</p>
                </div>
            </div>

            <div class="menu-card">
                <div class="default-image">🍴</div>
                <div class="menu-info">
                    <p class="menu-name">골뱅이</p>
                    <p class="menu-description">골뱅이, 마늘, 버터, 링귀니</p>
                    <p class="menu-price">19,000원</p>
                </div>
            </div>

            <div class="menu-card">
                <img src="img/pizza.jpg" alt="시금치 사진">
                <div class="menu-info">
                    <p class="menu-name">시금치</p>
                    <p class="menu-description">시금치 페스토, 삼겹살, 오르끼에떼</p>
                    <p class="menu-price">19,000원</p>
                </div>
            </div>
        </div>

        <div class="section map-section">
            <div class="section-title">가게 상세지도</div>
            <div id="map" class="map-container"></div>
        </div>

        <div class="section review-section">
            <div class="review-title">리뷰 목록</div>
            <div class="review-item">
                <div class="reviewer">김철수 <span class="star-rating">★★★★☆</span></div>
                <div class="review-text">맛있고 분위기 좋은 가게였습니다!</div>
            </div>
            <div class="review-item">
                <div class="reviewer">박영희 <span class="star-rating">★★★★★</span></div>
                <div class="review-text">친절한 직원들과 깔끔한 인테리어가 마음에 들었어요.</div>
            </div>
            <div class="review-item">
                <div class="reviewer">이민수 <span class="star-rating">★★★☆☆</span></div>
                <div class="review-text">가격 대비 훌륭한 맛이었습니다.</div>
            </div>

            <div class="review-button">
                <a href="review-details.jsp">리뷰 더보기</a>
            </div>

        </div>
    </div>

    <!-- 네이버 지도 API를 위한 JavaScript 파일 -->
    <script type="text/javascript"
        src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=eyf1ptej0y"></script>
    <script>
        // 네이버 지도 초기화
        var mapOptions = {
            center: new naver.maps.LatLng(37.498095, 127.027610), // 강남 테헤란로7길 근처
            zoom: 15
        };
        var map = new naver.maps.Map('map', mapOptions);

        // 메인 사진 슬라이드 기능 구현
        let currentIndex = 0;
        const slides = document.querySelectorAll('#slider .slide');
        let slideInterval = setInterval(nextSlide, 3000);

        function showSlide(index) {
            slides.forEach((slide, i) => {
                slide.style.transform = `translateX(-${index * 100}%)`;
            });
        }

        function nextSlide() {
            currentIndex = (currentIndex + 1) % slides.length;
            showSlide(currentIndex);
        }

        function prevSlide() {
            currentIndex = (currentIndex - 1 + slides.length) % slides.length;
            showSlide(currentIndex);
        }

        // 이동경로 select 옵션 변경 시 페이지 이동
        function navigateToDistrict() {
            const select = document.getElementById("district-select");
            const selectedValue = select.value;
            if (selectedValue) {
                window.location.href = selectedValue;
            }
        }

        showSlide(currentIndex);
    </script>

</body>

</html>
