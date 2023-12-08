drop schema if exists trailerflix;
create schema trailerflix;
use trailerflix;

drop table if exists categoria;
drop table if exists actricesyactores;
drop table if exists reparto;
drop table if exists genero;
drop table if exists genero_titulo;
drop table if exists catalogo;

create table if not exists catalogo(
id int auto_increment primary key,
poster varchar(255) default '',
titulo varchar(255) default '',
categoria int default 0,
resumen varchar(948) default '',
temporadas int default 0,
trailer varchar(255)default '',
index(categoria)
) engine=innodb;

create table if not exists categoria(
id int auto_increment primary key,
categoria varchar(255) default '',
constraint fk_categoria
foreign key(id)
references catalogo(categoria)
) engine=innodb;

create table if not exists genero_titulo(
id int auto_increment primary key,
idTitulo int default 0,
idGenero int default 0,
index (idGenero),
constraint fk_gen_tit
foreign key(idTitulo)
references catalogo(id)
) engine=innodb;

create table if not exists genero(
id int auto_increment primary key,
genero varchar(255) default '',
constraint fk_gen
foreign key(id)
references genero_titulo(idGenero)
) engine=innodb;

create table if not exists reparto(
id int auto_increment primary key,
idTitulo int default 0,
idActor int default 0,
index (idActor),
constraint fk_rep
foreign key(idTitulo)
references catalogo(id)
) engine=innodb;

create table if not exists actricesyactores(
id int auto_increment primary key,
actor varchar(255) default '',
constraint fk_actor
foreign key(id)
references reparto(idActor)
) engine=innodb;

CREATE VIEW v_datos_completos AS
SELECT 
    c.id as catalogo_id,
    c.poster,
    c.titulo,
    ca.categoria as categoria_nombre,
    c.resumen,
    c.temporadas,
    c.trailer,
    (SELECT GROUP_CONCAT(g.genero SEPARATOR ', ') 
     FROM genero_titulo gt 
     JOIN genero g ON gt.idGenero = g.id 
     WHERE c.id = gt.idTitulo) as generos,
    (SELECT GROUP_CONCAT(aa.actor SEPARATOR ', ') 
     FROM reparto r 
     JOIN actricesyactores aa ON r.idActor = aa.id 
     WHERE c.id = r.idTitulo) as actores
FROM catalogo c
LEFT JOIN categoria ca ON c.categoria = ca.id
GROUP BY c.id;


insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(3,"/posters/3.jpg","The Mandalorian",1,"Ambientada tras la caída del Imperio y antes de la aparición de la Primera Orden, la serie sigue los pasos de un pistolero solitario en las aventuras que protagoniza en los confines de la galaxia, donde no alcanza la autoridad de la Nueva República.",2,"https://www.youtube.com/embed/aOC8E8z_ifw"); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(4,"/posters/4.jpg","The Umbrella Academy",1,"La muerte de su padre reúne a unos hermanos distanciados y con extraordinarios poderes que descubren impactantes secretos y una amenaza que se cierne sobre la humanidad.",1,""); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(5,"/posters/5.jpg","Gambito de Dama",1,"En los cincuenta, una joven de un orfanato descubre que tiene un increíble don para el ajedrez y recorre el arduo camino a la fama mientras lucha contra las adicciones.",1,""); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(2,"/posters/2.jpg","Riverdale",1,"El paso a la edad adulta incluye sexo, romance, escuela y familia. Para Archie y sus amigos, también hay misterios oscuros.",5,""); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(1,"/posters/1.jpg","The Crown",1,"Este drama narra las rivalidades políticas y el romance de la reina Isabel II, así como los sucesos que moldearon la segunda mitad del siglo XX.",4,""); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(6,"/posters/6.jpg","Enola Holmes",2,"La hermana menor de Sherlock, descubre que su madre ha desaparecido y se dispone a encontrarla. En su búsqueda, saca a relucir el sabueso que corre por sus venas y se encuentra con una conspiración que gira en torno a un misterioso lord, demostrando que su ilustre hermano no es el único talento en la familia.",0,""); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(7,"/posters/7.jpg","Guasón",2,"Arthur Fleck (Phoenix) es un hombre ignorado por la sociedad, cuya motivación en la vida es hacer reír. Pero una serie de trágicos acontecimientos le llevarán a ver el mundo de otra forma. Película basada en el popular personaje de DC Comics Joker, conocido como archivillano de Batman, pero que en este film tomará un cariz más realista y oscuro.",0,"https://www.youtube.com/embed/zAGVQLHvwOY"); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(8,"/posters/8.jpg","Avengers: End Game",2,"Después de los devastadores eventos de los Vengadores: Infinity War (2018), el universo está en ruinas. Con la ayuda de los aliados restantes, los Vengadores se reúnen una vez más para revertir las acciones de Thanos y restaurar el equilibrio del universo.",0,""); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(9,"/posters/9.jpg","Juego de tronos",1,"En un mundo fantástico y en un contexto medieval varias familias, relativas a la nobleza, se disputan el poder para dominar el territorio ficticio de Poniente (Westeros) y tomar el control de los Siete Reinos desde el Trono de Hierro, lugar donde el rey ejerce el poder.",8,""); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(10,"/posters/10.jpg","The Flash",1,"Sigue las veloces aventuras de Barry Allen, un joven común y corriente con el deseo latente de ayudar a los demás. Cuando una inesperada partícula aceleradora golpea por accidente a Barry, de pronto se encuentra cargado de un increíble poder para moverse a increíbles velocidades. Mientras Barry siempre ha tenido el alma de un héroe, sus nuevos poderes le han dado la capacidad de actuar como tal.",6,""); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(11,"/posters/11.jpg","The Big Bang Theory",1,"Leonard y Sheldon son dos físicos que comparten trabajo y apartamento. La serie comienza con la mudanza de Penny, su nueva y atractiva vecina, y hace hincapié en la dificultad de los físicos para relacionarse con personas fuera de su entorno para dar lugar a situaciones cómicas.",12,"https://www.youtube.com/embed/WBb3fojgW0Q"); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(12,"/posters/12.jpg","Friends",1,"'Friends' narra las aventuras y desventuras de seis jóvenes de Nueva York: Rachel, Monica, Phoebe, Ross, Chandler y Joey. Ellos forman una unida pandilla de amigos que viven en Manhattan y que suelen reunirse en sus apartamentos o en su bar habitual cafetería, el Central Perk. A pesar de los numerosos cambios que se producen en sus vidas, su amistad es inquebrantable en la dura batalla por salir adelante en sus periplos profesionales y personales.",10,""); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(13,"/posters/13.jpg","Anne with an 'E'",1,"Anne Shirley es una niña huérfana que vive en un pequeño pueblo llamado Avonlea que pertenece a la Isla del Príncipe Eduardo, en el año 1890. Después de una infancia difícil, donde fue pasando de orfanato a hogares de acogida, es enviada por error a vivir con una solterona y su hermano. Cuando cumple 13 años, Anne va a conseguir transformar su vida y el pequeño pueblo donde vive gracias a su fuerte personalidad, intelecto e imaginación. Basada en la inolvidable novela.",2,""); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(14,"/posters/14.jpg","Expedientes Secretos 'X'",1,"Fox Mulder y Dana Scully son dos investigadores del FBI que investigan casos sin resolución ni explicación, ya sea por razones paranormales (espíritus, criaturas extrañas, aliens...) ya porque el gobierno se ha encargado de ocultar todo tipo de pruebas. Cuando Mulder tenía doce años, su hermana pequeña fue secuestrada por unos desconocidos, aunque él cree que, en realidad, fue abducida por extraterrestres. Tras acabar sus estudios en la universidad de Oxford, ingresó en la Academia de Quantico, donde se ganó el apodo de 'siniestro'",11,"https://www.youtube.com/embed/KKziOmsJxzE"); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(15,"/posters/15.jpg","Chernobyl",1,"Sigue «la verdadera historia de una de las peores catástrofes provocadas por el hombre y habla de los valientes hombres y mujeres que se sacrificaron para salvar a Europa de un desastre inimaginable. La miniserie se centra en el desgarrador alcance del desastre de la planta nuclear que ocurrió en Ucrania en abril de 1986, revelando cómo y por qué ocurrió, además contando las sorprendentes y notables historias de los héroes que lucharon y cayeron.",1,"https://www.youtube.com/embed/s9APLXM9Ei8"); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(16,"/posters/16.jpg","Westworld",1,"'Westworld' es una oscura odisea acerca del amanecer de la conciencia artificial y la evolución del pecado. Situada en la intersección del futuro cercano y el pasado reimaginado, explora un mundo donde cada apetito humano, sin importar cuán noble o depravado, puede ser saciado. Está ambientada en un parque temático futurista dirigido por el Dr. Robert Ford (Anthony Hopkins). Las instalaciones cuentan con androides caracterizados del western americano, y gracias a ellos los visitantes pueden introducirse en cualquier tipo de fantasía por muy oscura que sea.",3,"https://www.youtube.com/embed/qLFBcdd6Qw0"); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(17,"/posters/17.jpg","Halt and Catch Fire",1,"Situada en los inicios de la década de 1980, un visionario ficticio, un ingeniero electrónico y una prodigiosa ingeniera, se alían a una programadora de software para confrontar con las corporaciones informáticas dominantes de la época. El Personal de la firma y sus socios de negocio, comenzarán una carrera que cambiará la cultura en el Estado de Texas, cuna de las empresas de tecnología, casi de la misma forma que lo es hoy Silicon Valey. 
 Esta historia ficticia emula el trabajo realizado, en su momento, por la firma Compaq, cuando clonó el BIOS de las Computadoras Personales IBM, dando vida así al económico mercado de los clones. Mostrando también, a lo largo de sus 4 temporadas, el nacimiento de la arquitectura abierta de hardware, los videojuegos online, las salas de chat y de trueque de productos físicos, los BBS, y las primeras nubes computacionales, hasta la llegada de Internet (sin dejar afuera la guerra de los web browsers).",4,"https://www.youtube.com/embed/pWrioRji60A"); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(18,"/posters/18.jpg","Ava",2,"Ava es una mortífera asesina a sueldo que trabaja para una organización de operaciones encubiertas, que viaja por todo el mundo acabando con aquellos objetivos que nadie más puede derribar. Cuando uno de sus encargos sale mal, Ava tendrá que luchar por una vida.",0,""); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(19,"/posters/19.jpg","Aves de presa y la fantabulosa emancipación de una Harley Quinn",2,"Después de separarse de Joker, Harley Quinn y otras tres heroínas (Canario Negro, Cazadora y Renée Montoya) unen sus fuerzas para salvar a una niña (Cassandra Cain) del malvado rey del crimen Máscara Negra.",0,""); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(20,"/posters/20.jpg","Archivo",2,"2038: George Almore está trabajando en una verdadera IA equivalente a la humana. Su último prototipo está casi listo. Esta fase sensible también es la más arriesgada. Especialmente porque tiene un objetivo que debe ocultarse a toda costa: reunirse con su esposa muerta.",0,"https://www.youtube.com/embed/VHSoCnDioAo"); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(21,"/posters/21.jpg","Jumanji - The next level",2,"Las aventuras continúan en el fantástico mundo del video juego Jumanji, donde nada es lo que parece. En esta ocasión, los jugadores vuelven al juego, pero sus personajes se han intercambiado entre sí, lo que ofrece un curioso plantel: los mismos héroes con distinta apariencia y habilidades. Pero, ¿dónde está el resto de la gente?",0,"https://www.youtube.com/embed/rBxcF-r9Ibs"); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(22,"/posters/22.jpg","3022",2,"La película está ambientada en una estación espacial en el futuro. La tripulación sufre un estrés traumático y considera abandonar su misión después de observar lo que creen que es la destrucción de la Tierra. La película se muestra como una serie de flashbacks y flash-forward.",0,"https://www.youtube.com/embed/AGQ7OkmIx4Q"); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(23,"/posters/23.jpg","IT - Capítulo 2",2,"En este segundo capitulo Han pasado 27 años desde que el 'Club de los Perdedores', formado por Bill, Berverly, Richie, Ben, Eddie, Mike y Stanley, se enfrentaran al macabro y despiadado Pennywise (Bill Skarsgård). En cuanto tuvieron oportunidad, abandonaron el pueblo de Derry, en el estado de Maine, que tantos problemas les había ocasionado. Sin embargo, ahora, siendo adultos, parece que no pueden escapar de su pasado. Todos deberán enfrentarse de nuevo al temible payaso para descubrir si de verdad están preparados para superar sus traumas de la infancia.",0,"https://www.youtube.com/embed/hZeFeYSmBcg"); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(24,"/posters/24.jpg","Pantera Negra",2,"T’Challa (Chadwick Boseman) regresa a su hogar en la apartada nación africana de Wakanda para servir como líder de su país. Tras suceder a su padre en el trono, pasa a convertirse en Pantera Negra, una sigilosa criatura de la noche, con agudos sentidos felinos y otras habilidades como súper fuerza e inteligencia, agilidad, estrategia o maestro del combate sin armas. Es bajo el liderazgo de T’Challa como Wakanda consigue convertirse en una de las naciones más ricas y tecnológicamente avanzadas del planeta.",0,"https://www.youtube.com/embed/BE6inv8Xh4A"); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(25,"/posters/25.jpg","Contra lo imposible (Ford versus Ferrari)",2,"Los ganadores del Premio de la Academia® Matt Damon y Christian Bale protagonizan CONTRA LO IMPOSIBLE, basada en la historia real del visionario diseñador americano de automóviles Carroll Shelby (Damon) y el intrépido piloto británico Ken Miles (Bale). Juntos construyen un nuevo coche de carreras para Ford Motor Company y así enfrentar a Enzo Ferrari en las 24 Horas de Le Mans en Francia en 1966.",0,"https://www.youtube.com/embed/SOVb0-2g1Q0"); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(26,"/posters/26.jpg","Centígrados",2,"Una joven pareja estadounidense viaja a las montañas árticas de Noruega. Después de detenerse durante una tormenta de nieve, se despiertan atrapados en su SUV, enterrados bajo capas de nieve y hielo.",0,""); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(27,"/posters/27.jpg","DOOM: Aniquilación",2,"Doom: Aniquilación sigue a un grupo de marines espaciales que han respondido a una llamada de alerta de una base en la luna marciana, solo para descubrir que ha sido tomada por criaturas demoníacas que amenazan con desatar el infierno en la tierra.",0,"https://www.youtube.com/embed/nat3u3gAVLE"); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(28,"/posters/28.jpg","Contagio",2,"De repente, sin saber cuál es su origen, aunque todo hace sospechar que comienza con el viaje de una norteamericana a un casino de Hong Kong, un virus mortal comienza a propagarse por todo el mundo. En pocos días, la enfermedad empieza a diezmar a la población. El contagio se produce por mero contacto entre los seres humanos. Un thriller realista y sin efectos especiales sobre los efectos de una epidemia.",0,"https://www.youtube.com/embed/4sYSyuuLk5g"); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(29,"/posters/29.jpg","Viuda Negra",2,"Primera pelicula individual de la Viuda Negra en el universo cinematografico de Marvel, contando su historia desde que se inició como doble agente rusa, su niñez, sus misiones, y su actualidad, después de Avengers.",0,"https://www.youtube.com/embed/BIn8iANwEog"); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(30,"/posters/30.jpg","The Martian",2,"Durante una misión a Marte de la nave tripulada Ares III, una fuerte tormenta se desata dando por desaparecido y muerto al astronauta Mark Watney (Matt Damon), sus compañeros toman la decisión de irse pero él ha sobrevivido. Está solo y sin apenas recursos en el planeta. Con muy pocos medios deberá recurrir a sus conocimientos, su sentido del humor y un gran instinto de supervivencia para lograr sobrevivir y comunicar a la Tierra que todavía está vivo esperando que acudan en su rescate.",0,"https://www.youtube.com/embed/XvB58bCVfng"); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(31,"/posters/31.jpg","Ex-Machina",2,"Un programador multimillonario selecciona a Caleb, un joven empleado de su empresa, para que pase una semana en un lugar remoto con el objetivo de que participe en un test en el que estará involucrada su última creación: un robot-mujer en el que inteligencia artificial lo es todo.",0,"https://www.youtube.com/embed/XRYL5spvEcI"); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(32,"/posters/32.jpg","Jurassic World",2,"Veintidós años después de lo ocurrido en Jurassic Park, la isla Nublar ha sido transformada en un enorme parque temático, Jurassic Wold, con versiones «domesticadas» de algunos de los dinosaurios más conocidos. Cuando todo parece ir sobre ruedas y ser el negocio del siglo, un nuevo dinosaurio de especie desconocida, pues ha sido creado manipulando genéticamente su ADN, y que resulta ser mucho más inteligente de lo que se pensaba, se escapa de su recinto y comienza a causar estragos entre los visitantes del Parque.",0,""); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(33,"/posters/33.jpg","Soy leyenda",2,"Años después de que una plaga mate a la mayoría de la humanidad y transforme al resto en monstruos, el único superviviente en la ciudad de Nueva York lucha valientemente para encontrar una cura.",0,"https://www.youtube.com/embed/dtKMEAXyPkg"); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(34,"/posters/34.jpg","El primer hombre en la luna",2,"Cuenta la historia de la misión de la NASA que llevó al primer hombre a la luna, centrada en Neil Armstrong (interpretado por Ryan Gosling) y el periodo comprendido entre los años 1961 y 1969. Un relato en primera persona, basado en la novela de James R. Hansen, que explora el sacrificio y el precio que representó, tanto para Armstrong como para Estados Unidos, una de las misiones más peligrosas de la historia.",0,""); 
insert into catalogo(id,poster,titulo,categoria,resumen,temporadas,trailer) values(35,"/posters/35.jpg","Titanes del pacífico - La insurrección",2,"Han pasado 10 años tras la primera invasión que sufrió la humanidad, pero la lucha aún no ha terminado. El planeta vuelve a ser asediado por los Kaiju, una raza de alienígenas colosales, que emergen desde un portal interdimensional con el objetivo de destruir a la raza humana. Ante esta nueva amenaza, los Jaegers, robots gigantes de guerra pilotados por dos personas para sobrellevar la inmensa carga neuronal que conlleva manipularlos, ya no están a la altura de lo que se les viene encima. Será entonces cuando los supervivientes de la primera invasión, además de nuevos personajes como el hijo de Pentecost, tendrán que idear la manera de sorprender al enorme enemigo, apostando por nuevas estrategias defensivas y de ataque. Con la Tierra en ruinas e intentando reconstruirse, esta nueva batalla puede ser decisiva para el futuro.",0,""); 
insert into genero_titulo(idTitulo,idGenero) values(3,1); 
insert into genero_titulo(idTitulo,idGenero) values(3,2); 
insert into genero_titulo(idTitulo,idGenero) values(4,1); 
insert into genero_titulo(idTitulo,idGenero) values(4,2); 
insert into genero_titulo(idTitulo,idGenero) values(5,3); 
insert into genero_titulo(idTitulo,idGenero) values(5,4); 
insert into genero_titulo(idTitulo,idGenero) values(5,5); 
insert into genero_titulo(idTitulo,idGenero) values(2,3); 
insert into genero_titulo(idTitulo,idGenero) values(2,6); 
insert into genero_titulo(idTitulo,idGenero) values(2,4); 
insert into genero_titulo(idTitulo,idGenero) values(1,3); 
insert into genero_titulo(idTitulo,idGenero) values(1,7); 
insert into genero_titulo(idTitulo,idGenero) values(6,4); 
insert into genero_titulo(idTitulo,idGenero) values(6,3); 
insert into genero_titulo(idTitulo,idGenero) values(6,6); 
insert into genero_titulo(idTitulo,idGenero) values(7,8); 
insert into genero_titulo(idTitulo,idGenero) values(7,9); 
insert into genero_titulo(idTitulo,idGenero) values(7,3); 
insert into genero_titulo(idTitulo,idGenero) values(8,10); 
insert into genero_titulo(idTitulo,idGenero) values(8,11); 
insert into genero_titulo(idTitulo,idGenero) values(8,12); 
insert into genero_titulo(idTitulo,idGenero) values(9,10); 
insert into genero_titulo(idTitulo,idGenero) values(9,2); 
insert into genero_titulo(idTitulo,idGenero) values(9,3); 
insert into genero_titulo(idTitulo,idGenero) values(10,1); 
insert into genero_titulo(idTitulo,idGenero) values(10,2); 
insert into genero_titulo(idTitulo,idGenero) values(11,13); 
insert into genero_titulo(idTitulo,idGenero) values(11,2); 
insert into genero_titulo(idTitulo,idGenero) values(11,4); 
insert into genero_titulo(idTitulo,idGenero) values(12,13); 
insert into genero_titulo(idTitulo,idGenero) values(12,14); 
insert into genero_titulo(idTitulo,idGenero) values(12,3); 
insert into genero_titulo(idTitulo,idGenero) values(13,3); 
insert into genero_titulo(idTitulo,idGenero) values(13,14); 
insert into genero_titulo(idTitulo,idGenero) values(13,15); 
insert into genero_titulo(idTitulo,idGenero) values(14,3); 
insert into genero_titulo(idTitulo,idGenero) values(14,1); 
insert into genero_titulo(idTitulo,idGenero) values(15,3); 
insert into genero_titulo(idTitulo,idGenero) values(15,7); 
insert into genero_titulo(idTitulo,idGenero) values(16,15); 
insert into genero_titulo(idTitulo,idGenero) values(16,1); 
insert into genero_titulo(idTitulo,idGenero) values(17,4); 
insert into genero_titulo(idTitulo,idGenero) values(17,3); 
insert into genero_titulo(idTitulo,idGenero) values(17,16); 
insert into genero_titulo(idTitulo,idGenero) values(18,12); 
insert into genero_titulo(idTitulo,idGenero) values(18,3); 
insert into genero_titulo(idTitulo,idGenero) values(18,9); 
insert into genero_titulo(idTitulo,idGenero) values(19,12); 
insert into genero_titulo(idTitulo,idGenero) values(19,4); 
insert into genero_titulo(idTitulo,idGenero) values(19,13); 
insert into genero_titulo(idTitulo,idGenero) values(20,12); 
insert into genero_titulo(idTitulo,idGenero) values(20,11); 
insert into genero_titulo(idTitulo,idGenero) values(20,9); 
insert into genero_titulo(idTitulo,idGenero) values(21,13); 
insert into genero_titulo(idTitulo,idGenero) values(21,4); 
insert into genero_titulo(idTitulo,idGenero) values(21,10); 
insert into genero_titulo(idTitulo,idGenero) values(22,1); 
insert into genero_titulo(idTitulo,idGenero) values(22,9); 
insert into genero_titulo(idTitulo,idGenero) values(23,17); 
insert into genero_titulo(idTitulo,idGenero) values(23,9); 
insert into genero_titulo(idTitulo,idGenero) values(23,2); 
insert into genero_titulo(idTitulo,idGenero) values(24,12); 
insert into genero_titulo(idTitulo,idGenero) values(24,10); 
insert into genero_titulo(idTitulo,idGenero) values(24,2); 
insert into genero_titulo(idTitulo,idGenero) values(25,3); 
insert into genero_titulo(idTitulo,idGenero) values(25,18); 
insert into genero_titulo(idTitulo,idGenero) values(25,10); 
insert into genero_titulo(idTitulo,idGenero) values(26,3); 
insert into genero_titulo(idTitulo,idGenero) values(26,9); 
insert into genero_titulo(idTitulo,idGenero) values(26,19); 
insert into genero_titulo(idTitulo,idGenero) values(27,12); 
insert into genero_titulo(idTitulo,idGenero) values(27,11); 
insert into genero_titulo(idTitulo,idGenero) values(27,17); 
insert into genero_titulo(idTitulo,idGenero) values(28,3); 
insert into genero_titulo(idTitulo,idGenero) values(28,9); 
insert into genero_titulo(idTitulo,idGenero) values(28,20); 
insert into genero_titulo(idTitulo,idGenero) values(29,3); 
insert into genero_titulo(idTitulo,idGenero) values(29,12); 
insert into genero_titulo(idTitulo,idGenero) values(29,10); 
insert into genero_titulo(idTitulo,idGenero) values(30,3); 
insert into genero_titulo(idTitulo,idGenero) values(30,11); 
insert into genero_titulo(idTitulo,idGenero) values(30,10); 
insert into genero_titulo(idTitulo,idGenero) values(31,3); 
insert into genero_titulo(idTitulo,idGenero) values(31,11); 
insert into genero_titulo(idTitulo,idGenero) values(31,9); 
insert into genero_titulo(idTitulo,idGenero) values(32,9); 
insert into genero_titulo(idTitulo,idGenero) values(32,10); 
insert into genero_titulo(idTitulo,idGenero) values(32,4); 
insert into genero_titulo(idTitulo,idGenero) values(33,3); 
insert into genero_titulo(idTitulo,idGenero) values(33,17); 
insert into genero_titulo(idTitulo,idGenero) values(33,4); 
insert into genero_titulo(idTitulo,idGenero) values(34,3); 
insert into genero_titulo(idTitulo,idGenero) values(34,21); 
insert into genero_titulo(idTitulo,idGenero) values(35,12); 
insert into genero_titulo(idTitulo,idGenero) values(35,2); 
insert into genero_titulo(idTitulo,idGenero) values(35,11); 
insert into reparto(idTitulo,idActor) values(3,1); 
insert into reparto(idTitulo,idActor) values(3,2); 
insert into reparto(idTitulo,idActor) values(3,3); 
insert into reparto(idTitulo,idActor) values(3,4); 
insert into reparto(idTitulo,idActor) values(3,5); 
insert into reparto(idTitulo,idActor) values(3,6); 
insert into reparto(idTitulo,idActor) values(4,7); 
insert into reparto(idTitulo,idActor) values(4,8); 
insert into reparto(idTitulo,idActor) values(4,9); 
insert into reparto(idTitulo,idActor) values(4,10); 
insert into reparto(idTitulo,idActor) values(4,11); 
insert into reparto(idTitulo,idActor) values(4,12); 
insert into reparto(idTitulo,idActor) values(5,13); 
insert into reparto(idTitulo,idActor) values(5,14); 
insert into reparto(idTitulo,idActor) values(5,15); 
insert into reparto(idTitulo,idActor) values(5,16); 
insert into reparto(idTitulo,idActor) values(5,17); 
insert into reparto(idTitulo,idActor) values(5,18); 
insert into reparto(idTitulo,idActor) values(2,19); 
insert into reparto(idTitulo,idActor) values(2,20); 
insert into reparto(idTitulo,idActor) values(2,21); 
insert into reparto(idTitulo,idActor) values(2,22); 
insert into reparto(idTitulo,idActor) values(2,23); 
insert into reparto(idTitulo,idActor) values(2,24); 
insert into reparto(idTitulo,idActor) values(1,25); 
insert into reparto(idTitulo,idActor) values(1,26); 
insert into reparto(idTitulo,idActor) values(1,27); 
insert into reparto(idTitulo,idActor) values(1,28); 
insert into reparto(idTitulo,idActor) values(1,29); 
insert into reparto(idTitulo,idActor) values(1,30); 
insert into reparto(idTitulo,idActor) values(6,31); 
insert into reparto(idTitulo,idActor) values(6,32); 
insert into reparto(idTitulo,idActor) values(6,33); 
insert into reparto(idTitulo,idActor) values(6,30); 
insert into reparto(idTitulo,idActor) values(6,34); 
insert into reparto(idTitulo,idActor) values(6,35); 
insert into reparto(idTitulo,idActor) values(7,36); 
insert into reparto(idTitulo,idActor) values(7,37); 
insert into reparto(idTitulo,idActor) values(7,38); 
insert into reparto(idTitulo,idActor) values(7,39); 
insert into reparto(idTitulo,idActor) values(7,40); 
insert into reparto(idTitulo,idActor) values(7,41); 
insert into reparto(idTitulo,idActor) values(8,42); 
insert into reparto(idTitulo,idActor) values(8,43); 
insert into reparto(idTitulo,idActor) values(8,44); 
insert into reparto(idTitulo,idActor) values(8,45); 
insert into reparto(idTitulo,idActor) values(8,46); 
insert into reparto(idTitulo,idActor) values(8,47); 
insert into reparto(idTitulo,idActor) values(9,48); 
insert into reparto(idTitulo,idActor) values(9,49); 
insert into reparto(idTitulo,idActor) values(9,50); 
insert into reparto(idTitulo,idActor) values(9,51); 
insert into reparto(idTitulo,idActor) values(9,52); 
insert into reparto(idTitulo,idActor) values(9,53); 
insert into reparto(idTitulo,idActor) values(10,54); 
insert into reparto(idTitulo,idActor) values(10,55); 
insert into reparto(idTitulo,idActor) values(10,56); 
insert into reparto(idTitulo,idActor) values(10,57); 
insert into reparto(idTitulo,idActor) values(10,58); 
insert into reparto(idTitulo,idActor) values(10,59); 
insert into reparto(idTitulo,idActor) values(11,60); 
insert into reparto(idTitulo,idActor) values(11,61); 
insert into reparto(idTitulo,idActor) values(11,62); 
insert into reparto(idTitulo,idActor) values(11,63); 
insert into reparto(idTitulo,idActor) values(11,64); 
insert into reparto(idTitulo,idActor) values(11,65); 
insert into reparto(idTitulo,idActor) values(11,66); 
insert into reparto(idTitulo,idActor) values(12,67); 
insert into reparto(idTitulo,idActor) values(12,68); 
insert into reparto(idTitulo,idActor) values(12,69); 
insert into reparto(idTitulo,idActor) values(12,70); 
insert into reparto(idTitulo,idActor) values(12,71); 
insert into reparto(idTitulo,idActor) values(12,72); 
insert into reparto(idTitulo,idActor) values(13,73); 
insert into reparto(idTitulo,idActor) values(13,74); 
insert into reparto(idTitulo,idActor) values(13,75); 
insert into reparto(idTitulo,idActor) values(13,76); 
insert into reparto(idTitulo,idActor) values(13,77); 
insert into reparto(idTitulo,idActor) values(13,78); 
insert into reparto(idTitulo,idActor) values(14,79); 
insert into reparto(idTitulo,idActor) values(14,80); 
insert into reparto(idTitulo,idActor) values(14,81); 
insert into reparto(idTitulo,idActor) values(14,82); 
insert into reparto(idTitulo,idActor) values(14,83); 
insert into reparto(idTitulo,idActor) values(14,84); 
insert into reparto(idTitulo,idActor) values(15,85); 
insert into reparto(idTitulo,idActor) values(15,86); 
insert into reparto(idTitulo,idActor) values(15,87); 
insert into reparto(idTitulo,idActor) values(15,88); 
insert into reparto(idTitulo,idActor) values(15,89); 
insert into reparto(idTitulo,idActor) values(15,90); 
insert into reparto(idTitulo,idActor) values(16,91); 
insert into reparto(idTitulo,idActor) values(16,92); 
insert into reparto(idTitulo,idActor) values(16,93); 
insert into reparto(idTitulo,idActor) values(16,94); 
insert into reparto(idTitulo,idActor) values(16,95); 
insert into reparto(idTitulo,idActor) values(16,96); 
insert into reparto(idTitulo,idActor) values(17,97); 
insert into reparto(idTitulo,idActor) values(17,98); 
insert into reparto(idTitulo,idActor) values(17,99); 
insert into reparto(idTitulo,idActor) values(17,100); 
insert into reparto(idTitulo,idActor) values(17,101); 
insert into reparto(idTitulo,idActor) values(17,102); 
insert into reparto(idTitulo,idActor) values(18,103); 
insert into reparto(idTitulo,idActor) values(18,104); 
insert into reparto(idTitulo,idActor) values(18,105); 
insert into reparto(idTitulo,idActor) values(18,106); 
insert into reparto(idTitulo,idActor) values(18,107); 
insert into reparto(idTitulo,idActor) values(18,108); 
insert into reparto(idTitulo,idActor) values(19,109); 
insert into reparto(idTitulo,idActor) values(19,110); 
insert into reparto(idTitulo,idActor) values(19,111); 
insert into reparto(idTitulo,idActor) values(19,112); 
insert into reparto(idTitulo,idActor) values(19,113); 
insert into reparto(idTitulo,idActor) values(19,114); 
insert into reparto(idTitulo,idActor) values(20,115); 
insert into reparto(idTitulo,idActor) values(20,116); 
insert into reparto(idTitulo,idActor) values(20,117); 
insert into reparto(idTitulo,idActor) values(20,118); 
insert into reparto(idTitulo,idActor) values(20,119); 
insert into reparto(idTitulo,idActor) values(20,120); 
insert into reparto(idTitulo,idActor) values(21,121); 
insert into reparto(idTitulo,idActor) values(21,122); 
insert into reparto(idTitulo,idActor) values(21,123); 
insert into reparto(idTitulo,idActor) values(21,124); 
insert into reparto(idTitulo,idActor) values(21,125); 
insert into reparto(idTitulo,idActor) values(21,126); 
insert into reparto(idTitulo,idActor) values(22,127); 
insert into reparto(idTitulo,idActor) values(22,128); 
insert into reparto(idTitulo,idActor) values(22,129); 
insert into reparto(idTitulo,idActor) values(22,130); 
insert into reparto(idTitulo,idActor) values(22,131); 
insert into reparto(idTitulo,idActor) values(22,132); 
insert into reparto(idTitulo,idActor) values(23,133); 
insert into reparto(idTitulo,idActor) values(23,103); 
insert into reparto(idTitulo,idActor) values(23,134); 
insert into reparto(idTitulo,idActor) values(23,135); 
insert into reparto(idTitulo,idActor) values(23,136); 
insert into reparto(idTitulo,idActor) values(23,137); 
insert into reparto(idTitulo,idActor) values(24,138); 
insert into reparto(idTitulo,idActor) values(24,139); 
insert into reparto(idTitulo,idActor) values(24,140); 
insert into reparto(idTitulo,idActor) values(24,141); 
insert into reparto(idTitulo,idActor) values(24,142); 
insert into reparto(idTitulo,idActor) values(24,143); 
insert into reparto(idTitulo,idActor) values(25,144); 
insert into reparto(idTitulo,idActor) values(25,145); 
insert into reparto(idTitulo,idActor) values(25,146); 
insert into reparto(idTitulo,idActor) values(25,147); 
insert into reparto(idTitulo,idActor) values(25,148); 
insert into reparto(idTitulo,idActor) values(25,149); 
insert into reparto(idTitulo,idActor) values(26,150); 
insert into reparto(idTitulo,idActor) values(26,151); 
insert into reparto(idTitulo,idActor) values(26,152); 
insert into reparto(idTitulo,idActor) values(26,153); 
insert into reparto(idTitulo,idActor) values(27,154); 
insert into reparto(idTitulo,idActor) values(27,155); 
insert into reparto(idTitulo,idActor) values(27,156); 
insert into reparto(idTitulo,idActor) values(27,157); 
insert into reparto(idTitulo,idActor) values(27,158); 
insert into reparto(idTitulo,idActor) values(27,159); 
insert into reparto(idTitulo,idActor) values(28,160); 
insert into reparto(idTitulo,idActor) values(28,145); 
insert into reparto(idTitulo,idActor) values(28,161); 
insert into reparto(idTitulo,idActor) values(28,162); 
insert into reparto(idTitulo,idActor) values(28,163); 
insert into reparto(idTitulo,idActor) values(28,164); 
insert into reparto(idTitulo,idActor) values(28,165); 
insert into reparto(idTitulo,idActor) values(29,46); 
insert into reparto(idTitulo,idActor) values(29,166); 
insert into reparto(idTitulo,idActor) values(29,167); 
insert into reparto(idTitulo,idActor) values(29,168); 
insert into reparto(idTitulo,idActor) values(29,169); 
insert into reparto(idTitulo,idActor) values(29,170); 
insert into reparto(idTitulo,idActor) values(29,171); 
insert into reparto(idTitulo,idActor) values(30,145); 
insert into reparto(idTitulo,idActor) values(30,103); 
insert into reparto(idTitulo,idActor) values(30,172); 
insert into reparto(idTitulo,idActor) values(30,173); 
insert into reparto(idTitulo,idActor) values(30,174); 
insert into reparto(idTitulo,idActor) values(30,175); 
insert into reparto(idTitulo,idActor) values(30,176); 
insert into reparto(idTitulo,idActor) values(31,177); 
insert into reparto(idTitulo,idActor) values(31,178); 
insert into reparto(idTitulo,idActor) values(31,179); 
insert into reparto(idTitulo,idActor) values(31,180); 
insert into reparto(idTitulo,idActor) values(31,181); 
insert into reparto(idTitulo,idActor) values(31,182); 
insert into reparto(idTitulo,idActor) values(31,183); 
insert into reparto(idTitulo,idActor) values(32,184); 
insert into reparto(idTitulo,idActor) values(32,185); 
insert into reparto(idTitulo,idActor) values(32,186); 
insert into reparto(idTitulo,idActor) values(32,187); 
insert into reparto(idTitulo,idActor) values(32,188); 
insert into reparto(idTitulo,idActor) values(32,189); 
insert into reparto(idTitulo,idActor) values(32,190); 
insert into reparto(idTitulo,idActor) values(33,191); 
insert into reparto(idTitulo,idActor) values(33,192); 
insert into reparto(idTitulo,idActor) values(33,193); 
insert into reparto(idTitulo,idActor) values(33,194); 
insert into reparto(idTitulo,idActor) values(33,195); 
insert into reparto(idTitulo,idActor) values(33,196); 
insert into reparto(idTitulo,idActor) values(33,197); 
insert into reparto(idTitulo,idActor) values(34,198); 
insert into reparto(idTitulo,idActor) values(34,199); 
insert into reparto(idTitulo,idActor) values(34,200); 
insert into reparto(idTitulo,idActor) values(34,201); 
insert into reparto(idTitulo,idActor) values(34,202); 
insert into reparto(idTitulo,idActor) values(34,203); 
insert into reparto(idTitulo,idActor) values(35,204); 
insert into reparto(idTitulo,idActor) values(35,205); 
insert into reparto(idTitulo,idActor) values(35,206); 
insert into reparto(idTitulo,idActor) values(35,207); 
insert into reparto(idTitulo,idActor) values(35,208); 
insert into reparto(idTitulo,idActor) values(35,209); 
insert into categoria(id,categoria) values(1,"Serie"); 
insert into categoria(id,categoria) values(2,"Película"); 
insert into actricesyactores(id,actor) values(1,"Pedro Pascal"); 
insert into actricesyactores(id,actor) values(2,"Carl Weathers"); 
insert into actricesyactores(id,actor) values(3,"Misty Rosas"); 
insert into actricesyactores(id,actor) values(4,"Chris Bartlett"); 
insert into actricesyactores(id,actor) values(5,"Rio Hackford"); 
insert into actricesyactores(id,actor) values(6,"Giancarlo Esposito"); 
insert into actricesyactores(id,actor) values(7,"Tom Hopper"); 
insert into actricesyactores(id,actor) values(8,"David Castañeda"); 
insert into actricesyactores(id,actor) values(9,"Emmy Raver-Lampman"); 
insert into actricesyactores(id,actor) values(10,"Robert Sheehan"); 
insert into actricesyactores(id,actor) values(11,"Aidan Gallagher"); 
insert into actricesyactores(id,actor) values(12,"Elliot Page"); 
insert into actricesyactores(id,actor) values(13,"Anya Taylor-Joy"); 
insert into actricesyactores(id,actor) values(14,"Thomas Brodie-Sangster"); 
insert into actricesyactores(id,actor) values(15,"Harry Melling"); 
insert into actricesyactores(id,actor) values(16,"Moses Ingram"); 
insert into actricesyactores(id,actor) values(17,"Chloe Pirrie"); 
insert into actricesyactores(id,actor) values(18,"Janina Elkin"); 
insert into actricesyactores(id,actor) values(19,"Lili Reinhart"); 
insert into actricesyactores(id,actor) values(20,"Casey Cott"); 
insert into actricesyactores(id,actor) values(21,"Camila Mendes"); 
insert into actricesyactores(id,actor) values(22,"Marisol Nichols"); 
insert into actricesyactores(id,actor) values(23,"Madelaine Petsch"); 
insert into actricesyactores(id,actor) values(24,"Mädchen Amick"); 
insert into actricesyactores(id,actor) values(25,"Claire Fox"); 
insert into actricesyactores(id,actor) values(26,"Olivia Colman"); 
insert into actricesyactores(id,actor) values(27,"Matt Smith"); 
insert into actricesyactores(id,actor) values(28,"Tobias Menzies"); 
insert into actricesyactores(id,actor) values(29,"Vanesa Kirby"); 
insert into actricesyactores(id,actor) values(30,"Helena Bonham Carter"); 
insert into actricesyactores(id,actor) values(31,"Millie Bobby Brown"); 
insert into actricesyactores(id,actor) values(32,"Henry Cavill"); 
insert into actricesyactores(id,actor) values(33,"Sam Claflin"); 
insert into actricesyactores(id,actor) values(34,"Louis Partridge"); 
insert into actricesyactores(id,actor) values(35,"Adeel Akhtar"); 
insert into actricesyactores(id,actor) values(36,"Joaquin Phoenix"); 
insert into actricesyactores(id,actor) values(37,"Robert De Niro"); 
insert into actricesyactores(id,actor) values(38,"Zazie Beetz"); 
insert into actricesyactores(id,actor) values(39,"Frances Conroy"); 
insert into actricesyactores(id,actor) values(40,"Brett Cullen"); 
insert into actricesyactores(id,actor) values(41,"Shea Whigham"); 
insert into actricesyactores(id,actor) values(42,"Robert Downey Jr."); 
insert into actricesyactores(id,actor) values(43,"Chris Evans"); 
insert into actricesyactores(id,actor) values(44,"Mark Ruffalo"); 
insert into actricesyactores(id,actor) values(45,"Chris Hemsworth"); 
insert into actricesyactores(id,actor) values(46,"Scarlett Johansson"); 
insert into actricesyactores(id,actor) values(47,"Jeremy Renner"); 
insert into actricesyactores(id,actor) values(48,"Emilia Clarke"); 
insert into actricesyactores(id,actor) values(49,"Lena Headey"); 
insert into actricesyactores(id,actor) values(50,"Sophie Turner"); 
insert into actricesyactores(id,actor) values(51,"Kit Harington"); 
insert into actricesyactores(id,actor) values(52,"Peter Dinklage"); 
insert into actricesyactores(id,actor) values(53,"Nikolaj Coster-Waldau"); 
insert into actricesyactores(id,actor) values(54,"Grant Gustin"); 
insert into actricesyactores(id,actor) values(55,"Carlos Valdes"); 
insert into actricesyactores(id,actor) values(56,"Danielle Panabaker"); 
insert into actricesyactores(id,actor) values(57,"Candice Patton"); 
insert into actricesyactores(id,actor) values(58,"Jesse L. Martin"); 
insert into actricesyactores(id,actor) values(59,"Tom Cavanagh"); 
insert into actricesyactores(id,actor) values(60,"Jim Parsons"); 
insert into actricesyactores(id,actor) values(61,"Johnny Galecki"); 
insert into actricesyactores(id,actor) values(62,"Kaley Cuoco"); 
insert into actricesyactores(id,actor) values(63,"Simon Helberg"); 
insert into actricesyactores(id,actor) values(64,"Kunal Nayyar"); 
insert into actricesyactores(id,actor) values(65,"Melissa Rauch"); 
insert into actricesyactores(id,actor) values(66,"Mayim Bialik"); 
insert into actricesyactores(id,actor) values(67,"Jennifer Aniston"); 
insert into actricesyactores(id,actor) values(68,"Courteney Cox"); 
insert into actricesyactores(id,actor) values(69,"Lisa Kudrow"); 
insert into actricesyactores(id,actor) values(70,"David Schwimmer"); 
insert into actricesyactores(id,actor) values(71,"Matthew Perry"); 
insert into actricesyactores(id,actor) values(72,"Matt LeBlanc"); 
insert into actricesyactores(id,actor) values(73,"Amybeth McNulty"); 
insert into actricesyactores(id,actor) values(74,"Geraldine James"); 
insert into actricesyactores(id,actor) values(75,"R. H. Thomson"); 
insert into actricesyactores(id,actor) values(76,"Corrine Koslo"); 
insert into actricesyactores(id,actor) values(77,"Dalila Bela"); 
insert into actricesyactores(id,actor) values(78,"Lucas Jade Zumann"); 
insert into actricesyactores(id,actor) values(79,"Gillian Anderson"); 
insert into actricesyactores(id,actor) values(80,"David Duchovny"); 
insert into actricesyactores(id,actor) values(81,"Mitch Pileggi"); 
insert into actricesyactores(id,actor) values(82,"Robert Patrick"); 
insert into actricesyactores(id,actor) values(83,"Tom Braidwood"); 
insert into actricesyactores(id,actor) values(84,"Bruce Harwood"); 
insert into actricesyactores(id,actor) values(85,"Jared Harris"); 
insert into actricesyactores(id,actor) values(86,"Stellan Skarsgård"); 
insert into actricesyactores(id,actor) values(87,"Emily Watson"); 
insert into actricesyactores(id,actor) values(88,"Paul Ritter"); 
insert into actricesyactores(id,actor) values(89,"Jessie Buckley"); 
insert into actricesyactores(id,actor) values(90,"Adam Nagaitis"); 
insert into actricesyactores(id,actor) values(91,"Evan Rachel Wood"); 
insert into actricesyactores(id,actor) values(92,"Thandie Newton"); 
insert into actricesyactores(id,actor) values(93,"Jeffrey Wright"); 
insert into actricesyactores(id,actor) values(94,"Tessa Thompson"); 
insert into actricesyactores(id,actor) values(95,"Ed Harris"); 
insert into actricesyactores(id,actor) values(96,"Luke Hemsworth"); 
insert into actricesyactores(id,actor) values(97,"Lee Pace"); 
insert into actricesyactores(id,actor) values(98,"Scoot McNairy"); 
insert into actricesyactores(id,actor) values(99,"Mackenzie Davis"); 
insert into actricesyactores(id,actor) values(100,"Kerry Bishé"); 
insert into actricesyactores(id,actor) values(101,"Toby Huss"); 
insert into actricesyactores(id,actor) values(102,"Alana Cavanaugh"); 
insert into actricesyactores(id,actor) values(103,"Jessica Chastain"); 
insert into actricesyactores(id,actor) values(104,"John Malkovich"); 
insert into actricesyactores(id,actor) values(105,"Colin Farrell"); 
insert into actricesyactores(id,actor) values(106,"Common"); 
insert into actricesyactores(id,actor) values(107,"Geena Davis"); 
insert into actricesyactores(id,actor) values(108,"Ioan Gruffudd"); 
insert into actricesyactores(id,actor) values(109,"Margot Robbie"); 
insert into actricesyactores(id,actor) values(110,"Ewan McGregor"); 
insert into actricesyactores(id,actor) values(111,"Mary Elizabeth Winstead"); 
insert into actricesyactores(id,actor) values(112,"Jurnee Smollett"); 
insert into actricesyactores(id,actor) values(113,"Rosie Perez"); 
insert into actricesyactores(id,actor) values(114,"Chris Messina"); 
insert into actricesyactores(id,actor) values(115,"Stacy Martin"); 
insert into actricesyactores(id,actor) values(116,"Rhona Mitra"); 
insert into actricesyactores(id,actor) values(117,"Theo James"); 
insert into actricesyactores(id,actor) values(118,"Peter Ferdinando"); 
insert into actricesyactores(id,actor) values(119,"Lia Williams"); 
insert into actricesyactores(id,actor) values(120,"Toby Jones"); 
insert into actricesyactores(id,actor) values(121,"Dwayne Johnson"); 
insert into actricesyactores(id,actor) values(122,"Kevin Hart"); 
insert into actricesyactores(id,actor) values(123,"Jack Black"); 
insert into actricesyactores(id,actor) values(124,"Karen Gillan"); 
insert into actricesyactores(id,actor) values(125,"Awkwafina"); 
insert into actricesyactores(id,actor) values(126,"Nick Jonas"); 
insert into actricesyactores(id,actor) values(127,"Miranda Cosgrove"); 
insert into actricesyactores(id,actor) values(128,"Kate Walsh"); 
insert into actricesyactores(id,actor) values(129,"Omar Epps"); 
insert into actricesyactores(id,actor) values(130,"Angus Macfadyen"); 
insert into actricesyactores(id,actor) values(131,"Jorja Fox"); 
insert into actricesyactores(id,actor) values(132,"Enver Gjokaj"); 
insert into actricesyactores(id,actor) values(133,"Bill Skarsgård"); 
insert into actricesyactores(id,actor) values(134,"Bill Hader"); 
insert into actricesyactores(id,actor) values(135,"James McAvoy"); 
insert into actricesyactores(id,actor) values(136,"Isaiah Mustafa"); 
insert into actricesyactores(id,actor) values(137,"Jay Ryan"); 
insert into actricesyactores(id,actor) values(138,"Chadwick Boseman"); 
insert into actricesyactores(id,actor) values(139,"Michael B. Jordan"); 
insert into actricesyactores(id,actor) values(140,"Lupita Nyong'o"); 
insert into actricesyactores(id,actor) values(141,"Danai Gurira"); 
insert into actricesyactores(id,actor) values(142,"Martin Freeman"); 
insert into actricesyactores(id,actor) values(143,"Daniel Kaluuya"); 
insert into actricesyactores(id,actor) values(144,"Christian Bale"); 
insert into actricesyactores(id,actor) values(145,"Matt Damon"); 
insert into actricesyactores(id,actor) values(146,"Caitriona Balfe"); 
insert into actricesyactores(id,actor) values(147,"Josh Lucas"); 
insert into actricesyactores(id,actor) values(148,"Noah Jupe"); 
insert into actricesyactores(id,actor) values(149,"Jon Bernthal"); 
insert into actricesyactores(id,actor) values(150,"Génesis Rodríguez"); 
insert into actricesyactores(id,actor) values(151,"Vincent Piazza"); 
insert into actricesyactores(id,actor) values(152,"Benjamin Sokolow"); 
insert into actricesyactores(id,actor) values(153,"Emily Bayiokos"); 
insert into actricesyactores(id,actor) values(154,"Amy Manson"); 
insert into actricesyactores(id,actor) values(155,"Luke Allen-Gale"); 
insert into actricesyactores(id,actor) values(156,"Nina Bergman"); 
insert into actricesyactores(id,actor) values(157,"Dominic Mafham"); 
insert into actricesyactores(id,actor) values(158,"James Weber Brown"); 
insert into actricesyactores(id,actor) values(159,"Lorina Kamburova"); 
insert into actricesyactores(id,actor) values(160,"Marion Cotillard"); 
insert into actricesyactores(id,actor) values(161,"Laurence Fishburne"); 
insert into actricesyactores(id,actor) values(162,"Jude Law"); 
insert into actricesyactores(id,actor) values(163,"Kate Winslet"); 
insert into actricesyactores(id,actor) values(164,"Jennifer Ehle"); 
insert into actricesyactores(id,actor) values(165,"Gwyneth Paltrow"); 
insert into actricesyactores(id,actor) values(166,"Florence Pugh"); 
insert into actricesyactores(id,actor) values(167,"David Harbour"); 
insert into actricesyactores(id,actor) values(168,"O.T. Fagbenle"); 
insert into actricesyactores(id,actor) values(169,"Rachel Weisz"); 
insert into actricesyactores(id,actor) values(170,"William Hurt"); 
insert into actricesyactores(id,actor) values(171,"Ray Winstone"); 
insert into actricesyactores(id,actor) values(172,"Kristen Wiig"); 
insert into actricesyactores(id,actor) values(173,"Jeff Daniels"); 
insert into actricesyactores(id,actor) values(174,"Michael Peña"); 
insert into actricesyactores(id,actor) values(175,"Sean Bean"); 
insert into actricesyactores(id,actor) values(176,"Kate Mara"); 
insert into actricesyactores(id,actor) values(177,"Alicia Vikander"); 
insert into actricesyactores(id,actor) values(178,"Domhnall Gleeson"); 
insert into actricesyactores(id,actor) values(179,"Oscar Isaac"); 
insert into actricesyactores(id,actor) values(180,"Sonoya Mizuno"); 
insert into actricesyactores(id,actor) values(181,"Corey Johnson"); 
insert into actricesyactores(id,actor) values(182,"Claire Selby"); 
insert into actricesyactores(id,actor) values(183,"Gana Bayarsaikhan"); 
insert into actricesyactores(id,actor) values(184,"Bryce Dallas Howard"); 
insert into actricesyactores(id,actor) values(185,"Chris Pratt"); 
insert into actricesyactores(id,actor) values(186,"Irrfan Khan"); 
insert into actricesyactores(id,actor) values(187,"Vincent D'Onofrio"); 
insert into actricesyactores(id,actor) values(188,"Omar Sy"); 
insert into actricesyactores(id,actor) values(189,"Nick Robinson"); 
insert into actricesyactores(id,actor) values(190,"Judy Greer"); 
insert into actricesyactores(id,actor) values(191,"Will Smith"); 
insert into actricesyactores(id,actor) values(192,"Alice Braga"); 
insert into actricesyactores(id,actor) values(193,"Charlie Tahan"); 
insert into actricesyactores(id,actor) values(194,"Dash Mihok"); 
insert into actricesyactores(id,actor) values(195,"Salli Richardson-Whitfield"); 
insert into actricesyactores(id,actor) values(196,"Willow Smith"); 
insert into actricesyactores(id,actor) values(197,"Emma Thompson"); 
insert into actricesyactores(id,actor) values(198,"Ryan Gosling"); 
insert into actricesyactores(id,actor) values(199,"Claire Foy"); 
insert into actricesyactores(id,actor) values(200,"Jason Clarke"); 
insert into actricesyactores(id,actor) values(201,"Kyle Chandler"); 
insert into actricesyactores(id,actor) values(202,"Corey Stoll"); 
insert into actricesyactores(id,actor) values(203,"Patrick Fugit"); 
insert into actricesyactores(id,actor) values(204,"John Boyega"); 
insert into actricesyactores(id,actor) values(205,"Scott Eastwood"); 
insert into actricesyactores(id,actor) values(206,"Cailee Spaeny"); 
insert into actricesyactores(id,actor) values(207,"Jing Tian"); 
insert into actricesyactores(id,actor) values(208,"Rinko Kikuchi"); 
insert into actricesyactores(id,actor) values(209,"Burn Gorman"); 
insert into genero(id,genero) values(1,"Ciencia Ficción"); 
insert into genero(id,genero) values(2,"Fantasía"); 
insert into genero(id,genero) values(3,"Drama"); 
insert into genero(id,genero) values(4,"Ficción"); 
insert into genero(id,genero) values(5,"Sucesos"); 
insert into genero(id,genero) values(6,"Misterio"); 
insert into genero(id,genero) values(7,"Hechos verídicos"); 
insert into genero(id,genero) values(8,"Crimen"); 
insert into genero(id,genero) values(9,"Suspenso"); 
insert into genero(id,genero) values(10,"Aventura"); 
insert into genero(id,genero) values(11,"Sci-Fi"); 
insert into genero(id,genero) values(12,"Acción"); 
insert into genero(id,genero) values(13,"Comedia"); 
insert into genero(id,genero) values(14,"Familia"); 
insert into genero(id,genero) values(15,"Western"); 
insert into genero(id,genero) values(16,"Tecnología"); 
insert into genero(id,genero) values(17,"Terror"); 
insert into genero(id,genero) values(18,"Historia"); 
insert into genero(id,genero) values(19,"Intriga"); 
insert into genero(id,genero) values(20,"¿Ficción?"); 
insert into genero(id,genero) values(21,"Hechos veríficos"); 
