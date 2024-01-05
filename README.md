<div>
  <h1 align="center">🔍 sagi_jeonae_app</h3>
  <p align="center">
    온라인 상품 URL을 입력하면 해당 상품의 모델명과 제조사를 추출하고, <br>이 정보를 활용하여 식약처에서 제공하는 데이터를 조회하는 서비스입니다.
  </p>
    <p align="center"> <img width="300" style="display: inline-block;" src="https://github.com/chaejin-jen/sagi-jeonae-flutter-app/assets/73324850/d76c4e08-5646-4b52-8316-559dc910d5b3"> </p>
</div>

## 프로젝트 소개
전자상거래에서 의료기기와 공산품을 혼동하는 문제를 해결하기 위한 웹앱 서비스입니다.  
제품 URL 입력 시, 의료기기 여부, 행정처분 이력, 회수 여부 등을 확인할 수 있습니다.  
또한, 모델명이나 제조사/수입사명으로 조회가 가능합니다.  
현재는 쿠팡 URL에 대한 구현이 완료되었습니다.

## 주요 기능
- **URL 조회 서비스:** 전자상거래 상품 페이지의 URL을 입력하여 의료기기와 제조사에 대한 정보를 조회합니다.
- **모델명 조회 서비스:** 상품의 모델명을 입력하여 공공데이터 포탈 API를 통해 조회합니다.
  - 로컬 환경에서 사용시, 공공데이터 포털의 [식품의약품안전처_의료기기 표준코드별 제품정보](https://www.data.go.kr/data/15073875/openapi.do) API 신청이 필요합니다.
- **제조사 조회 서비스:** 제조사 모델명을 공공데이터 포탈 API를 통해 조회합니다.
  - 로컬 환경에서 사용시, 공공데이터 포털의 [식품의약품안전처_의료기기 제조·수입업 허가정보](https://www.data.go.kr/data/15057971/openapi.do) API 신청이 필요합니다.

## 사용 기술
- **프론트엔드:** Flutter (v3.13.9)
- **백엔드:** Django (v4.2.7)


## Preview 🔍

### URL 검색 결과 페이지
| ![image](https://github.com/chaejin-jen/sagi-jeonae-flutter-app/assets/73324850/39f074d9-3382-4e38-8f4a-2e82644d9c69) | ![image](https://github.com/chaejin-jen/sagi-jeonae-flutter-app/assets/73324850/3057734b-b148-409a-bdb9-4702592763a2) | ![image](https://github.com/chaejin-jen/sagi-jeonae-flutter-app/assets/73324850/f11379e2-90c5-4031-916e-f110961fa650) | ![image](https://github.com/chaejin-jen/sagi-jeonae-flutter-app/assets/73324850/e6a9e11f-b164-4ac1-935a-a699d6cf77fc) |  ![image](https://github.com/chaejin-jen/sagi-jeonae-flutter-app/assets/73324850/1a6172fb-e771-4f8e-88b5-0d58a2c51611) |
| ------------- | ------------- | ------------- | ------------- | ------------- |


| 의료기기가 아닌 경우 |
| ------------- |
| <img width="200" src="https://github.com/chaejin-jen/sagi-jeonae-flutter-app/assets/73324850/c025950f-99f5-4be6-84b3-d017784d1ffc"> |


### 모델명 검색과 결과 페이지
| <img width="300" src="https://github.com/chaejin-jen/sagi-jeonae-flutter-app/assets/73324850/e59e9737-f596-4d5a-8724-b64851e37b8d"> | <img width="300" src="https://github.com/chaejin-jen/sagi-jeonae-flutter-app/assets/73324850/c91bbdca-12a0-4919-ae4f-6ed65b23ace2"> |
| ------------- | ------------- |

### 제조사 검색과 결과 페이지
| <img width="300" src="https://github.com/chaejin-jen/sagi-jeonae-flutter-app/assets/73324850/c6a2a4f3-c449-4b9d-94d9-8126402eb194"> | <img width="300" src="https://github.com/chaejin-jen/sagi-jeonae-flutter-app/assets/73324850/50aead2b-cc78-400b-acb6-9132d7283806"> |
| ------------- | ------------- |


</br>
