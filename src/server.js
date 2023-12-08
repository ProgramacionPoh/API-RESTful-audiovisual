//Ruteo y llamado de funciones
const dotenv = require('dotenv');
dotenv.config();
const express = require('express');
const sequelize = require("./conection/connection")
const server = express();
const catalogoraw = require("./routes/catalogos")
const categoriasraw = require("./routes/categorias")
const actoresraw = require("./routes/actricesyactores")
const generoraw = require("./routes/genero")


//Middlewares
server.use(express.json());


server.use("/", catalogoraw);

server.use("/", categoriasraw);

server.use("/", actoresraw); 

server.use("/", generoraw);


//Control de rutas inexistentes
server.use('*', (req, res) => {
    res.status(404).send({error: `La URL indicada no existe en este servidor`});
});

// Método oyente de solicitudes
sequelize.authenticate().then(()=>{
    server.listen(process.env.PORT, process.env.HOST, () => {
        console.log(`El servidor está escuchando en: http://${process.env.HOST}:${process.env.PORT}`);
    });
}).catch(()=>{
    console.log("Hubo un problema con la conección a la base de datos.")
});

