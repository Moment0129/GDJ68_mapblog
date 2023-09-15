const arr = new Array();

// ajax 통신
$.ajax({
  type: "POST", // HTTP method type(GET, POST) 형식이다.
  url: "/calendar/myCalendar", // 컨트롤러에서 대기중인 URL 주소이다.
  async: false,
  success: function (res) {
    // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
    // 응답코드 > 0000
    console.log(typeof res);
    console.log(Object.keys(res).length);
    for (const key in res) {
      let obj = new Object();
      obj.title = res[key].title;
      obj.start = res[key].meetingDate;
      arr.push(obj);
    }
    console.log(arr);
  },
  error: function (XMLHttpRequest, textStatus, errorThrown) {
    // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
  },
});
console.log(arr);
//////////////////////////////////////
$.ajax({
  type: "POST", // HTTP method type(GET, POST) 형식이다.
  url: "/calendar/myCalendar2", // 컨트롤러에서 대기중인 URL 주소이다.
  async: false,
  success: function (res) {
    // 비동기통신의 성공일경우 success콜백으로 들어옵니다. 'res'는 응답받은 데이터이다.
    // 응답코드 > 0000

    for (const key in res) {
      let obj = new Object();
      obj.title = res[key].title;
      let date = new Date(res[key].tripDate);
      let tripDate = date.toISOString().substring(0,10);
      obj.start =tripDate; 

      arr.push(obj);
    }
  },
  error: function (XMLHttpRequest, textStatus, errorThrown) {
    // 비동기 통신이 실패할경우 error 콜백으로 들어옵니다.
  },
});

//////////////////////////////////////
document.addEventListener("DOMContentLoaded", function () {
  var calendarEl = document.getElementById("calendar");
  var calendar = new FullCalendar.Calendar(calendarEl, {
    // Tool Bar 목록 document : https://fullcalendar.io/docs/toolbar
    headerToolbar: {
      left: "prevYear,prev,next,nextYear today",
      center: "title",
      right: "dayGridMonth,dayGridWeek,dayGridDay",
    },

    selectable: true,
    selectMirror: true,

    navLinks: true, // can click day/week names to navigate views
    editable: true,
    // Create new event
    select: function (arg) {
      Swal.fire({
        html: "<div class='mb-7'>Create new event?</div><div class='fw-bold mb-5'>Event Name:</div><input type='text' class='form-control' name='event_name' />",
        icon: "info",
        showCancelButton: true,
        buttonsStyling: false,
        confirmButtonText: "Yes, create it!",
        cancelButtonText: "No, return",
        customClass: {
          confirmButton: "btn btn-primary",
          cancelButton: "btn btn-active-light",
        },
      }).then(function (result) {
        if (result.value) {
          var title = document.querySelector("input[name=;event_name']").value;
          if (title) {
            calendar.addEvent({
              title: title,
              start: arg.start,
              end: arg.end,
              allDay: arg.allDay,
            });
          }
          calendar.unselect();
        } else if (result.dismiss === "cancel") {
          Swal.fire({
            text: "Event creation was declined!.",
            icon: "error",
            buttonsStyling: false,
            confirmButtonText: "Ok, got it!",
            customClass: {
              confirmButton: "btn btn-primary",
            },
          });
        }
      });
    },

    // Delete event
    eventClick: function (arg) {
      Swal.fire({
        text: "Are you sure you want to delete this event?",
        icon: "warning",
        showCancelButton: true,
        buttonsStyling: false,
        confirmButtonText: "Yes, delete it!",
        cancelButtonText: "No, return",
        customClass: {
          confirmButton: "btn btn-primary",
          cancelButton: "btn btn-active-light",
        },
      }).then(function (result) {
        if (result.value) {
          arg.event.remove();
        } else if (result.dismiss === "cancel") {
          Swal.fire({
            text: "Event was not deleted!.",
            icon: "error",
            buttonsStyling: false,
            confirmButtonText: "Ok, got it!",
            customClass: {
              confirmButton: "btn btn-primary",
            },
          });
        }
      });
    },
    dayMaxEvents: true, // allow "more" link when too many events
    // 이벤트 객체 필드 document : https://fullcalendar.io/docs/event-object
    events: arr,
  });

  calendar.render();
});
