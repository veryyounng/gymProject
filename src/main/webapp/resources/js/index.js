new Swiper('.swiper', {
  autoplay: {
    delay: 2500
  },
  loop: true,
  slidesPerView: 6,
  spaceBetween: 10,
  centeredSlides: true,
  centeredSlides: true,
  pagination: {
    el: '.swiper-pagination',
    clickable: true
  },
  navigation: {
    prevEl: '.swiper-button-prev',
    nextEl: '.swiper-button-next'
  }
})

const notice = document.getElementById("noti_box_notice");
const freeb = document.getElementById("free_board");
const ex_board = document.getElementById("ex_board");

function boardnotice() {
  notice.classList.add("focus_board");
  freeb.classList.remove("focus_board");
  ex_board.classList.remove("focus_board");
}
function boardfreeb() {
  freeb.classList.add("focus_board");
  notice.classList.remove("focus_board");
  ex_board.classList.remove("focus_board");
}
function boardexboard() {
  ex_board.classList.add("focus_board");
  freeb.classList.remove("focus_board");
  notice.classList.remove("focus_board");
}

const n_t = document.getElementById("notice_table");
const f_t = document.getElementById("free_table");
const e_t = document.getElementById("ex_table");

function ntt() {
  n_t.style.display = "table";
  f_t.style.display = "none";
  e_t.style.display = "none";
}
function ftt() {
  f_t.style.display = "table";
  n_t.style.display = "none";
  e_t.style.display = "none";
}
function ett() {
  e_t.style.display = "table";
  n_t.style.display = "none";
  f_t.style.display = "none";
}  
function more() {
  if (notice.classList.contains('focus_board')) {
    location.href = "/board/notice?num=1";
  } else if (freeb.classList.contains('focus_board')) {
    location.href = "/free/freelist?num=1";
  } else if (ex_board.classList.contains('focus_board')) {
    location.href = "/ex_board/ex_list?num=1";
  }
}
