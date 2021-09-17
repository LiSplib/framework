$(function () {
    $('[data-toggle="popover"]').popover()
})

$btnSidebar = document.getElementById('sidebarActive');
$sidebar = document.getElementById('mySideBar')
$btnSidebar.addEventListener('click', (e) => {
    $sidebar.classList.toggle('d-none')
});