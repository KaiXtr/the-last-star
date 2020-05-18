tipo=argument0
comb1=argument1
comb2=argument2
classe=argument3
main=argument4
spd=0
dir=0
sep=0
qua=0
num=0

//Velocidade
if tipo=1{spd=5}
if tipo=2{spd=4}
if tipo=3{spd=2}
if tipo=4{spd=5}
if tipo=5{spd=3}
if tipo=6{spd=8}
if tipo=7{spd=6}
if tipo=8{spd=7}

//Direção
if tipo=1{dir=25}
if tipo=2{dir=0}
if tipo=3{dir=75}
if tipo=6{dir=45}

//Separação
if tipo=1{sep=22}
if tipo=2{sep=33}
if tipo=3{sep=11}
if tipo=4{sep=22}
if tipo=5{sep=3}
if tipo=6{sep=44}
if tipo=7{sep=6}
if tipo=8{sep=7}

if classe=1{qua=1}
if classe=2{qua=2}
if classe=3{qua=3}
if classe=4{qua=global.misseis}

//Sprite
if classe<4{sprite_index=Spr_tiroc}
if classe=4{sprite_index=Spr_misselc;if global.misseis>0{global.misseis-=1}}

//Direção Movimento
if classe=3{
if instance_number(Obj_tiro)=1{direction=90}
if instance_number(Obj_tiro)=2{direction=90-dir}
if instance_number(Obj_tiro)=3{direction=90+dir}
if instance_number(Obj_tiro)=4{direction=90}
if instance_number(Obj_tiro)=5{direction=90-dir}
if instance_number(Obj_tiro)=6{direction=90+dir}
if instance_number(Obj_tiro)=7{direction=90}
if instance_number(Obj_tiro)=8{direction=90-dir}
if instance_number(Obj_tiro)=9{direction=90+dir}
}

//Separação
if main=true{
repeat(qua-1){
if classe<4{

if classe=2{ins=instance_create(x+sep,y,Obj_tiro);x-=sep}
if classe=3{ins=instance_create(x,y,Obj_tiro)}
ins.origin=origin
with(ins)Scr_arma(origin.arma,origin.comb1,origin.comb2,origin.classe,false)}
}}

//Checar Quantia
if classe<4{if instance_number(Obj_tiro)>3*qua{instance_destroy()}}
if classe=4{if global.misseis=0{instance_destroy()}}

//Combinações
if comb1=comb2
{spd*=2}

//Misseis Características
if classe=4{
if comb2=1{spd=1;alarm[0]=60}
if comb2=2{alarm[1]=2}
}
