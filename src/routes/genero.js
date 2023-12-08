const express = require("express");
const router = express.Router();
const dotenv = require('dotenv');
dotenv.config();
const sequelize = require("../conection/connection");

router.get("/generos", async (req, res) => {
    try {
        const [generos] = await sequelize.query("select genero from genero");

        if (!generos.length) {
            return res.status(404).json({ message: "No se encontraron géneros disponibles" });
        }

        res.status(200).json(generos);
    } catch (error) {
        console.error("Error al obtener el listado de géneros:", error);
        res.status(500).json({ message: "Error interno del servidor al recuperar los géneros" });
    }
});


module.exports = router;