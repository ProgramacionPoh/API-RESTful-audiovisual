const express = require("express");
const router = express.Router();
const dotenv = require('dotenv');
dotenv.config();
const sequelize = require("../conection/connection")


router.get("/actricesyactores", async (req, res) => {
    try {
        const [actores] = await sequelize.query("select actor from actricesyactores");

        if (!actores.length) {
            return res.status(404).json({ message: "No se encontraron actores o actrices" });
        }

        res.status(200).json(actores);
    } catch (error) {
        console.error("Error al obtener el listado de actores y actrices", error);

        res.status(500).json({ message: "Error interno del servidor al intentar encontrar los actores y actrices" });
    }
});

module.exports = router;