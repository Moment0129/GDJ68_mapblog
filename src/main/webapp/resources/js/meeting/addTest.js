// date 객체
let now_utc = Date.now();
// date 객체로 now를 꺼내면 UTC timzone 영국기준 한국시간에 맞춰서 시간을 빼줘야함
let timeOff = new Date().getTimezoneOffset() * 60000;
// today = now_utc - timeoff 를 빼면 한국과 영국 표준시간의 차이를 구할 수 있고 substring으로 필요한 정보만큼 잘라냄 16은 분까지
let today = new Date(now_utc - timeOff).toISOString().substring(0, 16);

// date로 만들면 현재 시간이 위에서 한것처럼 계산할 필요없이 utc timezone 알아서 설정되서 나옴
let now = new Date();
// 2주 뒤에 값까지만 제어하기위해 14일을 더함
let maxDate = new Date(now.setDate(now.getDate() + 14))
  .toISOString()
  .substring(0, 16);

// meetingDate 에 속성중 최솟값을 today 값으로
$("#meetingDate").attr("min", today);
// meetingDate 에 속성중 최댓값을 maxDate 값으로
$("#meetingDate").attr("max", maxDate);

// 기본 설정 map 센터 좌표 (kakao 제주도 위치)
let centertLat = 33.450701;
let centerLng = 126.570667;

getLocation();
function getLocation() {
  if (navigator.geolocation) {
    // GPS를 지원하고 alert 에서 gps 정보 동의
    navigator.geolocation.getCurrentPosition(
      function (position) {
        // alert(position.coords.latitude + ' ' + position.coords.longitude);
        centertLat = position.coords.latitude;
        centerLng = position.coords.longitude;
        getKakaoMap2(centertLat, centerLng);
        $("#lat").val(centertLat);
        $("#lng").val(centerLng);
      },
      function (error) {
        //GPS를 지원하고 alert 에서 gps 정보 거부
        console.error(error);
        alert("GPS 지원을 동의하지 않으셨습니다.");
        getKakaoMap2(centertLat, centerLng);
        $("#lat").val(centertLat);
        $("#lng").val(centerLng);
      },
      {
        enableHighAccuracy: false,
        maximumAge: 0,
        timeout: Infinity,
      }
    );
  } else {
    //GPS를 지원하지 않았을 때
    alert("GPS를 지원하지 않습니다");
    getKakaoMap2(centertLat, centerLng);
    $("#lat").val(centertLat);
    $("#lng").val(centerLng);
  }
}

//주소 검색 버튼 클릭시 getKaKaoMap 펑션 실행 이벤트
$("#btn2").on("click", function () {
  getKakaoMap(centertLat, centerLng);
});

function getKakaoMap(centertLat, centerLng) {
  let mapContainer = document.getElementById("map"), // 지도를 표시할 div
    mapOption = {
      center: new kakao.maps.LatLng(centertLat, centerLng), // 지도의 중심좌표
      level: 3, // 지도의 확대 레벨
    };

  let map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

  // 주소-좌표 변환 객체를 생성합니다
  let geocoder = new kakao.maps.services.Geocoder();

  var infowindow = new kakao.maps.InfoWindow({ zindex: 1 }); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

  // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
  searchAddrFromCoords(map.getCenter(), displayCenterInfo);

  // 주소로 좌표를 검색합니다
  geocoder.addressSearch($("#adrs").val(), function (result, status) {
    // 정상적으로 검색이 완료됐으면
    if (status === kakao.maps.services.Status.OK) {
      let coords = new kakao.maps.LatLng(result[0].y, result[0].x);

      // 결과값으로 받은 위치를 마커로 표시합니다
      let marker = new kakao.maps.Marker({
        map: map,
        position: coords,
      });
      // 검색완료시 마커를 클릭하지 않으면 lat lng 가 설정 되지않기때문에 해당위치로 coords.Ma, coords.La로 설정
      $("#lat").val(coords.Ma);
      $("#lng").val(coords.La);
      map.setCenter(coords);
      searchDetailAddrFromCoords(coords, function (result, status) {
        if (status === kakao.maps.services.Status.OK) {
          var detailAddr = !!result[0].road_address
            ? "<div>도로명주소 : " +
              result[0].road_address.address_name +
              "</div>"
            : "";
          detailAddr +=
            "<div>지번 주소 : " + result[0].address.address_name + "</div>";

          var content =
            '<div class="bAddr">' +
            '<span class="title">법정동 주소정보</span>' +
            detailAddr +
            "</div>";

          // 마커를 클릭한 위치에 표시합니다
          marker.setPosition(coords);
          marker.setMap(map);

          // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
          infowindow.setContent(content);
          infowindow.open(map, marker);
          setAddress(result[0]);
        }
      });

      kakao.maps.event.addListener(map, "click", function (mouseEvent) {
        // 클릭한 위도, 경도 정보를 가져옵니다
        let latlng = mouseEvent.latLng;

        // 마커 위치를 클릭한 위치로 옮깁니다
        marker.setPosition(latlng);

        let message = "클릭한 위치의 위도는 " + latlng.getLat() + " 이고, ";
        message += "경도는 " + latlng.getLng() + " 입니다";

        let resultDiv = document.getElementById("clickLatlng");
        resultDiv.innerHTML = message;

        $("#lat").val(latlng.getLat());
        $("#lng").val(latlng.getLng());

        searchDetailAddrFromCoords(
          mouseEvent.latLng,
          function (result, status) {
            if (status === kakao.maps.services.Status.OK) {
              var detailAddr = !!result[0].road_address
                ? "<div>도로명주소 : " +
                  result[0].road_address.address_name +
                  "</div>"
                : "";
              detailAddr +=
                "<div>지번 주소 : " + result[0].address.address_name + "</div>";

              var content =
                '<div class="bAddr">' +
                '<span class="title">법정동 주소정보</span>' +
                detailAddr +
                "</div>";

              // 마커를 클릭한 위치에 표시합니다
              marker.setPosition(mouseEvent.latLng);
              marker.setMap(map);

              // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
              infowindow.setContent(content);
              infowindow.open(map, marker);
              setAddress(result[0]);
            }
          }
        );
      });
    } else {
      alert("검색 실패");
      // 지도를 클릭한 위치에 표출할 마커입니다
      let marker = new kakao.maps.Marker({
        // 지도 중심좌표에 마커를 생성합니다
        position: map.getCenter(),
      });
      // 지도에 마커를 표시합니다
      marker.setMap(map);

      // 지도에 클릭 이벤트를 등록합니다
      // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
      kakao.maps.event.addListener(map, "click", function (mouseEvent) {
        // 클릭한 위도, 경도 정보를 가져옵니다
        let latlng = mouseEvent.latLng;

        // 마커 위치를 클릭한 위치로 옮깁니다
        marker.setPosition(latlng);

        let message = "클릭한 위치의 위도는 " + latlng.getLat() + " 이고, ";
        message += "경도는 " + latlng.getLng() + " 입니다";

        let resultDiv = document.getElementById("clickLatlng");
        resultDiv.innerHTML = message;

        $("#lat").val(latlng.getLat());
        $("#lng").val(latlng.getLng());

        searchDetailAddrFromCoords(
          mouseEvent.latLng,
          function (result, status) {
            if (status === kakao.maps.services.Status.OK) {
              var detailAddr = !!result[0].road_address
                ? "<div>도로명주소 : " +
                  result[0].road_address.address_name +
                  "</div>"
                : "";
              detailAddr +=
                "<div>지번 주소 : " + result[0].address.address_name + "</div>";

              var content =
                '<div class="bAddr">' +
                '<span class="title">법정동 주소정보</span>' +
                detailAddr +
                "</div>";

              // 마커를 클릭한 위치에 표시합니다
              marker.setPosition(mouseEvent.latLng);
              marker.setMap(map);

              // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
              infowindow.setContent(content);
              infowindow.open(map, marker);
              setAddress(result[0]);
            }
          }
        );
      });
    }
  });

  function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
  }

  function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
  }

  // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
  function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
      var infoDiv = document.getElementById("centerAddr");

      for (var i = 0; i < result.length; i++) {
        // 행정동의 region_type 값은 'H' 이므로
        if (result[i].region_type === "H") {
          // infoDiv.innerHTML = result[i].address_name;
          break;
        }
      }
    }
  }
}

function getKakaoMap2(centertLat, centerLng) {
  let mapContainer = document.getElementById("map"), // 지도를 표시할 div
    mapOption = {
      center: new kakao.maps.LatLng(centertLat, centerLng), // 지도의 중심좌표
      level: 3, // 지도의 확대 레벨
    };

  let map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

  let marker = new kakao.maps.Marker({
    // 지도 중심좌표에 마커를 생성합니다
    position: map.getCenter(),
  });
  // 지도에 마커를 표시합니다
  marker.setMap(map);
  let mapCenter = map.getCenter();
  var geocoder = new kakao.maps.services.Geocoder();

  infowindow = new kakao.maps.InfoWindow({ zindex: 1 }); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

  // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
  searchAddrFromCoords(map.getCenter(), displayCenterInfo);

  searchDetailAddrFromCoords(mapCenter, function (result, status) {
    if (status === kakao.maps.services.Status.OK) {
      var detailAddr = !!result[0].road_address
        ? "<div>도로명주소 : " + result[0].road_address.address_name + "</div>"
        : "";
      detailAddr +=
        "<div>지번 주소 : " + result[0].address.address_name + "</div>";

      var content =
        '<div class="bAddr">' +
        '<span class="title">법정동 주소정보</span>' +
        detailAddr +
        "</div>";

      // 마커를 클릭한 위치에 표시합니다
      marker.setPosition(mapCenter);
      marker.setMap(map);

      // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
      infowindow.setContent(content);
      infowindow.open(map, marker);
      setAddress(result[0]);
    }
  });

  // 지도에 클릭 이벤트를 등록합니다
  // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
  kakao.maps.event.addListener(map, "click", function (mouseEvent) {
    // 클릭한 위도, 경도 정보를 가져옵니다
    let latlng = mouseEvent.latLng;

    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng);

    let message = "클릭한 위치의 위도는 " + latlng.getLat() + " 이고, ";
    message += "경도는 " + latlng.getLng() + " 입니다";

    let resultDiv = document.getElementById("clickLatlng");
    resultDiv.innerHTML = message;

    $("#lat").val(latlng.getLat());
    $("#lng").val(latlng.getLng());

    searchDetailAddrFromCoords(mouseEvent.latLng, function (result, status) {
      if (status === kakao.maps.services.Status.OK) {
        var detailAddr = !!result[0].road_address
          ? "<div>도로명주소 : " +
            result[0].road_address.address_name +
            "</div>"
          : "";
        detailAddr +=
          "<div>지번 주소 : " + result[0].address.address_name + "</div>";

        var content =
          '<div class="bAddr">' +
          '<span class="title">법정동 주소정보</span>' +
          detailAddr +
          "</div>";

        // 마커를 클릭한 위치에 표시합니다
        marker.setPosition(mouseEvent.latLng);
        marker.setMap(map);

        // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
        infowindow.setContent(content);
        infowindow.open(map, marker);

        setAddress(result[0]);
      }
    });
  });

  // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
  kakao.maps.event.addListener(map, "idle", function () {
    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
  });

  function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
  }

  function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
  }

  // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
  function displayCenterInfo(result, status) {
    if (status === kakao.maps.services.Status.OK) {
      var infoDiv = document.getElementById("centerAddr");

      for (var i = 0; i < result.length; i++) {
        // 행정동의 region_type 값은 'H' 이므로
        if (result[i].region_type === "H") {
          // infoDiv.innerHTML = result[i].address_name;
          break;
        }
      }
    }
  }
}

function setAddress(addr) {
  if (addr.road_address != null) {
    $("#address").val(addr.road_address.address_name);
  } else {
    $("#address").val(addr.address.address_name);
  }
}

// 원래 script에 있던 소스
const btn = document.getElementById("btn");
const title = document.getElementById("title");
const meetingDate = document.getElementById("meetingDate");
const meetingDate2 = document.getElementById("meetingDate2");
const frm = document.getElementById("frm");

let personnelCheckResult = false;
let meetingDateCheckResult = false;

var checkResult = [false, false];
// $("#contents").summernote({
//   height: 400,
//   callbacks: {
//     onImageUpload: function (files) {
//       alert("이미지 업로드");
//       //이미지를 server로 전송하고
//       //응답으로 이미지경로와 파일명을 받아서
//       //img 태그를 만들어서 src속성에 이미지경로는 넣는것
//       let formData = new FormData(); //<form></form>
//       formData.append("files", files[0]); //<input type='file' name='files'>
//       $.ajax({
//         type: "post",
//         url: "setContentsImg",
//         data: formData,
//         cashe: false,
//         enctype: "multipart/form-data",
//         contentType: false,
//         processData: false,
//         success: function (result) {
//           $("#contents").summernote("insertImage", result.trim());
//         },
//         error: function () {
//           console.log("error");
//         },
//       });
//     },
//     onMediaDelete: function (files) {
//       let path = $(files[0]).attr("src"); // /resources/upload/notice/파일명
//       $.ajax({
//         type: "post",
//         url: "./setContentsImgDelete",
//         data: {
//           path: path,
//         },
//         success: function (result) {
//           console.log(result);
//         },
//         error: function () {
//           console.log("error");
//         },
//       });
//     },
//   },
// });

btn.addEventListener("click", function () {
  if (title.value == "") {
    alert("제목은 필수 입니다.");
    title.focus();
  } else {
    alert(meetingDate.value.replace("T", " "));
    let s = meetingDate.value.replace("T", " ");
    meetingDate2.value = s;
    if (document.getElementById("meetingDate").value != "") {
      checkResult[1] = true;
    } else {
      alert("날짜를 입력해 주세요.");
      document.getElementById("meetingDate").focus();
    }
    if (document.getElementById("personnel").value != "") {
      checkResult[0] = true;
      document.getElementById("personnel").focus();
    } else {
      alert("모집인원을 입력해주세요.");
    }
    let c = checkResult.includes(false);
    if (!c) {
      //form전송
      frm.submit();
    } else {
    }
  }
});
