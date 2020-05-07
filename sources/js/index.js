const $postList = document.getElementById('postsList');
const $btnPreview = document.getElementById('preview');
const $btnNext = document.getElementById('next');
let $first = "https://graph.instagram.com/me/media?fields=caption,media_url&access_token=IGQVJVdzh2T0hkUHJGQVl0b3k5Q3IzTmVKVzE5dXNUQlA5NHlzLWtPMFdaQzhkNmVveWJXNHhtVDhYM05vdEZACdmxuaUxPbGJ0bHd2M2Y3U1gtNWJSODRvRE1PTkZATVFdXTTFDNTJR";
let $next = '';
let $preview = '';

function updateView($value){
    fetch($value, {
        "method": "GET"
        })
    .then(res => res.json())
    .then(data => readData(data))
    .catch(err => handleError(err));
}

function handleError(err){
    console.error(err);
} 

function readData(data){
    let html = "";
    const mp4 = '.mp4';
    data.data.forEach(element => {
        if (element.media_url.indexOf(mp4) !== -1){
            return html +=`
            <div class="post">
                <video controls>
                    <source src="${element.media_url}">
                </video>
                <p>${element.caption ? element.caption : ''}</p>
            </div>
            `;  
        }
        return html +=`
        <div class="post">
            <img src="${element.media_url}" alt="">
            <p>${element.caption ? element.caption : ''}</p>
        </div>
        `;
    });
    $postList.innerHTML = html;
    $previous = data.paging.previous;
    $next = data.paging.next;
    if($previous === undefined){
        $btnPreview.classList.add('disabled');
    }else{
        $btnPreview.classList.remove('disabled');
    }
    if($next === undefined){
        $btnNext.classList.add('disabled');
    }else{
        $btnNext.classList.remove('disabled');
    }
}

$btnNext.addEventListener('click', (e) => {
    e.preventDefault();
    loadNext()
})
$btnPreview.addEventListener('click', (e) => {
    e.preventDefault();
    loadPreview()
})

function loadNext(){
    updateView($next);
}

function loadPreview(){
    updateView($previous);
}

updateView($first);