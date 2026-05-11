window.addEventListener('message', function(e){

if(e.data.action==='open'){

document.body.style.display='block';
setTimeout(()=>document.body.classList.add('show'),40);

const d=e.data.data;

document.getElementById('title').innerText =
d.text.title;

document.getElementById('change').innerText =
d.text.change;

document.getElementById('historyBtn').innerText =
d.text.history;

document.getElementById('close').innerText =
d.text.close;

let sel=document.getElementById('player');
sel.innerHTML='';

d.players.forEach(p=>{
let o=document.createElement('option');
o.value=p.id;
o.textContent=(p.online?"ONLINE ":"OFFLINE ")+p.name;

o.className = p.online ? "online" : "offline";

sel.appendChild(o);
});
}

if(e.data.action==='history'){

let box=document.getElementById('historyBox');
box.innerHTML='';

e.data.history.forEach(h=>{
box.innerHTML+=`
<div>
${h.oldname} → ${h.newname} (${h.admin})
</div>`;
});
}

});

/* CHANGE */
document.getElementById('change').onclick=()=>{
fetch(`https://${GetParentResourceName()}/changeName`,{
method:'POST',
headers:{'Content-Type':'application/json'},
body:JSON.stringify({
target:document.getElementById('player').value,
firstname:document.getElementById('fn').value,
lastname:document.getElementById('ln').value
})
});
};

/* HISTORY */
document.getElementById('historyBtn').onclick=()=>{
fetch(`https://${GetParentResourceName()}/getHistory`,{
method:'POST',
headers:{'Content-Type':'application/json'},
body:JSON.stringify({
target:document.getElementById('player').value
})
});
};

/* CLOSE */
document.getElementById('close').onclick=()=>{
fetch(`https://${GetParentResourceName()}/close`,{
method:'POST',
headers:{'Content-Type':'application/json'},
body:JSON.stringify({})
});

document.body.classList.remove('show');
setTimeout(()=>document.body.style.display='none',300);
};