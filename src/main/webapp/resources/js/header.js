const company = document.getElementById("company");

function companyhover() {
  company.innerHTML = "Company";
  company.style.color = "red";
}

function companyhoverout() {
  company.innerHTML = "회사";
  company.style.color = "#000";
}

const program = document.getElementById("program");

function programhover() {
  program.innerHTML = "Program";
}

function programhoverout() {
  program.innerHTML = "프로그램";
}

const community = document.getElementById("community");

function communityhover() {
  community.innerHTML = "Community";
}

function communityhoverout() {
  community.innerHTML = "커뮤니티";
}

const help = document.getElementById("help");

function helphover() {
  help.innerHTML = "Help"
}

function helphoverout() {
  help.innerHTML = "고객센터";
}

document.querySelector("#company").addEventListener("mousedown", function () {
  document.querySelector("#company").style.color = "black";
});
document.querySelector("#program").addEventListener("mousedown", function () {
  document.querySelector("#program").style.color = "black";
});
document.querySelector("#community").addEventListener("mousedown", function () {
  document.querySelector("#community").style.color = "black";
});
document.querySelector("#help").addEventListener("mousedown", function () {
  document.querySelector("#help").style.color = "black";
});

function getIndex() {
  location.href = "/";
}